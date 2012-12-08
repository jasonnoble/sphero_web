class SpheroControlController < ApplicationController
  def enter_command
  end

  def set_color
    color, red, green, blue = params[:color].split(',')
    $SPHERO.rgb(red.to_i, green.to_i, blue.to_i)
    redirect_to :action => :enter_command, :notice => 'Color set to #{color}'
  end
end
