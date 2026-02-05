function ready(callback) {
  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", callback);
  } else {
    callback();
  }
}

function attachAiBartenderStream() {
  const form = document.querySelector("[data-ai-bartender-form]");
  if (!form) return;
  if (form.dataset.aiBartenderBound === "true") return;
  form.dataset.aiBartenderBound = "true";

  let log = document.querySelector("[data-ai-bartender-log]");
  const submit = form.querySelector("[data-ai-bartender-submit]");
  const promptInput = form.querySelector("[data-ai-bartender-prompt]");
  const streamUrl = form.dataset.streamUrl;

  if (!streamUrl) return;

  const ensureLog = () => {
    if (!log) return null;
    if (log.classList.contains("bartender-chat-log")) return log;

    const logContainer = document.createElement("div");
    logContainer.className = "bartender-chat-log";
    logContainer.dataset.aiBartenderLog = "";

    if (log.parentNode) {
      log.parentNode.replaceChild(logContainer, log);
    }
    log = logContainer;
    return log;
  };

  const scrollLog = () => {
    if (!log) return;
    log.scrollTop = log.scrollHeight;
  };

  const buildMessage = (role, text) => {
    const wrapper = document.createElement("div");
    wrapper.className = `bartender-message${role === "user" ? " is-user" : ""}`;

    const label = document.createElement("span");
    label.className = "bartender-message-label";
    label.textContent = role === "user" ? "You" : "Bartender";

    const bubble = document.createElement("div");
    bubble.className = `bartender-bubble${role === "assistant" ? " is-bartender" : ""}`;

    const body = document.createElement("p");
    body.className = "whitespace-pre-line";
    body.textContent = text || "";

    bubble.appendChild(body);
    wrapper.appendChild(label);
    wrapper.appendChild(bubble);

    return { wrapper, body };
  };

  form.addEventListener("submit", async (event) => {
    event.preventDefault();
    if (!promptInput || !promptInput.value.trim()) return;

    if (submit) submit.disabled = true;

    const token = document.querySelector("meta[name='csrf-token']");
    const headers = {
      "Accept": "text/event-stream"
    };
    if (token) headers["X-CSRF-Token"] = token.content;

    const formData = new FormData(form);
    const userPrompt = formData.get("prompt") || "";

    log = ensureLog();

    if (log) {
      const userMessage = buildMessage("user", userPrompt.toString());
      log.appendChild(userMessage.wrapper);
    }

    const assistantMessage = buildMessage("assistant", "");
    const assistantText = assistantMessage.body;

    let typingNode = null;
    if (log) {
      typingNode = document.createElement("div");
      typingNode.className = "bartender-typing";
      typingNode.innerHTML =
        '<span>Shaking</span><span class="bartender-dots"><span class="bartender-dot"></span><span class="bartender-dot"></span><span class="bartender-dot"></span></span>';
      log.appendChild(typingNode);
      log.appendChild(assistantMessage.wrapper);
      scrollLog();
    }

    let fullText = "";

    try {
      const response = await fetch(streamUrl, {
        method: "POST",
        headers,
        body: formData
      });

      if (!response.body) {
        throw new Error("Streaming not supported");
      }

      const reader = response.body.getReader();
      const decoder = new TextDecoder();
      let buffer = "";

      while (true) {
        const { value, done } = await reader.read();
        if (done) break;
        buffer += decoder.decode(value, { stream: true });

        const lines = buffer.split("\n");
        buffer = lines.pop() || "";

        lines.forEach((line) => {
          const trimmed = line.trim();
          if (!trimmed.startsWith("data:")) return;

          const json = trimmed.replace(/^data:\s*/, "");
          if (!json) return;
          if (json === "[DONE]") return;

          let payload;
          try {
            payload = JSON.parse(json);
          } catch (error) {
            return;
          }

          if (payload.error) {
            if (typingNode) typingNode.remove();
            assistantText.textContent = payload.error;
            scrollLog();
            return;
          }

          if (payload.delta) {
            fullText += payload.delta;
            assistantText.textContent = fullText;
            if (typingNode) typingNode.remove();
            scrollLog();
          }
        });
      }
    } catch (error) {
      if (typingNode) typingNode.remove();
      assistantText.textContent = "The bartender dropped the shaker. Try again.";
      scrollLog();
    } finally {
      if (submit) submit.disabled = false;
      if (promptInput) promptInput.value = "";
    }
  });
}

function attachBartenderTabs() {
  const hub = document.querySelector("[data-bartender-hub]");
  if (!hub) return;
  if (hub.dataset.bartenderTabsBound === "true") return;
  hub.dataset.bartenderTabsBound = "true";

  const tabs = Array.from(hub.querySelectorAll("[data-bartender-tab]"));
  const panels = Array.from(hub.querySelectorAll("[data-bartender-panel]"));
  const defaultTab = hub.dataset.bartenderDefault || "picks";

  const setActive = (name) => {
    tabs.forEach((tab) => {
      const isActive = tab.dataset.bartenderTab === name;
      tab.classList.toggle("is-active", isActive);
      tab.setAttribute("aria-selected", isActive ? "true" : "false");
    });

    panels.forEach((panel) => {
      const isActive = panel.dataset.bartenderPanel === name;
      panel.classList.toggle("is-hidden", !isActive);
    });
  };

  tabs.forEach((tab) => {
    tab.addEventListener("click", () => setActive(tab.dataset.bartenderTab));
  });

  setActive(defaultTab);
}

ready(() => {
  attachAiBartenderStream();
  attachBartenderTabs();
  document.addEventListener("turbo:load", attachAiBartenderStream);
  document.addEventListener("turbo:load", attachBartenderTabs);
});
