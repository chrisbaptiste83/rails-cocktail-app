module.exports = {
  content: [
    "./app/views/**/*.{html,erb,haml,slim}",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.{js,ts}",
    "./app/assets/stylesheets/**/*.css"
  ],
  theme: {
    extend: {
      colors: {
        ink: "#0f1416",
        sand: "#f7f1e8",
        smoke: "#c9b9a2",
        teal: "#1b2d2f",
        ember: "#c9822b",
        emberGlow: "#f2c14e",
        glass: "rgba(12, 16, 18, 0.78)"
      },
      fontFamily: {
        display: ["Cormorant Garamond", "serif"],
        body: ["Space Grotesk", "sans-serif"]
      },
      boxShadow: {
        lounge: "0 24px 50px rgba(5, 10, 12, 0.5)",
        glow: "0 12px 25px rgba(201, 130, 43, 0.35)"
      },
      backgroundImage: {
        "lounge-radial":
          "radial-gradient(circle at top, rgba(27, 45, 47, 0.65), rgba(15, 20, 22, 0.95)), linear-gradient(135deg, rgba(18, 25, 29, 0.9), rgba(12, 15, 17, 0.95))"
      }
    }
  }
};
