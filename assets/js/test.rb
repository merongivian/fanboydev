require 'browser/interval'
require 'react/react-source'
require 'hyper-react'
require 'react/top_level_render'

class HelloWorld < React::Component::Base
  param :time, type: Time
  render do
    p do
      span { "Hello, " }
      input(type: :text, placeholder: "Your Name Here")
      span { "! It is #{params.time}"}
    end
  end
end

every(1) do
  Element["#example"].render do
    HelloWorld(time: Time.now)
  end
end
