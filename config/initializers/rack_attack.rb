class Rack::Attack
  throttle("ai_bartender/ip", limit: 5, period: 1.minute) do |req|
    req.ip if req.path.start_with?("/ai_bartender")
  end

  safelist("allow-health-check") do |req|
    req.path == "/up"
  end
end
