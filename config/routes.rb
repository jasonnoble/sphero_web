SpheroWeb::Application.routes.draw do
  get "sphero_control/enter_command"
  post "sphero_control/set_color"

  root :to => 'sphero_control#enter_command'
end
