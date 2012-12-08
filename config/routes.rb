SpheroWeb::Application.routes.draw do
  get "sphero_control/enter_command"
  post "sphero_control/set_color"
  post "sphero_control/set_color_via_wav_file"

  root :to => 'sphero_control#enter_command'
end
