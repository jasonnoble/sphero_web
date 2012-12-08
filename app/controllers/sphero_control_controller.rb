#require 'open-uri'
#require 'uri'


class SpheroControlController < ApplicationController
  def enter_command
  end

  def set_color
    color, red, green, blue = params[:color].split(',')
    sphero.rgb(red.to_i, green.to_i, blue.to_i)
    redirect_to root_path, :notice => 'Color set to #{color}'
  end

  def set_color_via_wav_file
    uploaded_io = params[:command]
    file_contents = uploaded_io.read
    speech_to_text = AttSpeech.new(:content => file_contents)
    speech_to_text.colors.each do |color|
      color, red, green, blue = SpheroColors.send(color).split(',')
      Rails.logger.debug("Setting color to #{color}")
      sphero.rgb(red.to_i, green.to_i, blue.to_i)
      sleep(1)
    end
    redirect_to root_path, :notice => 'Color set to blah'
  end
end
