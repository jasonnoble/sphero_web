require 'sphero'
require 'sphero_colors'

class ApplicationController < ActionController::Base
  protect_from_forgery

  def self.sphero
    @@sphero ||= sphero_connect
  end

  def sphero
    self.class.sphero
  end

  def self.sphero_connect
    Dir.glob("/dev/tty.Sphero*").each do |sphero|
      begin
        Rails.logger.debug "Attempting to connect to #{sphero}"
        s = Sphero.new(sphero)
        Rails.logger.debug "Attempting to ping #{sphero}"
        s.ping
        Rails.logger.debug "Returning #{sphero}"
        return s
      rescue Errno::EBUSY
        Rails.logger.debug "Unable to connect to #{sphero}"
      end
    end
    raise "Unable to connect to any Spheros"
  end
end
