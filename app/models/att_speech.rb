class AttSpeech
  # Licensed by AT&T under 'Software Development Kit Tools Agreement.' 2012
  # TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION: http://developer.att.com/sdk_agreement/
  # Copyright 2012 AT&T Intellectual Property. All rights reserved. http://developer.att.com
  # For more information contact developer.support@att.com
  attr_accessor :content
  attr_accessor :text_content
  attr_accessor :decoded
  attr_accessor :settings
  def initialize(options={})
    self.content = options[:content]
    self.settings = YAML.load(File.read('config/att_speech_config.yml'))
    obtain_tokens
    decode
  end

  def decode
    self.decoded ||=
    begin
      response = RestClient.post url, "#{content}",
                                 :Authorization => "Bearer #{settings['access_token']}",
                                 :Content_Type => 'audio/wav',
                                 :Accept => 'application/json'
      result = JSON.parse response
      self.text_content = result['Recognition']['NBest'].first['Words'].map{|word| word.gsub(/\W/, '').titlecase}
      self
    end
  end

  def colors
    all_colors = SpheroColors.all_colors.map(&:color)
    text_content.select{|word| all_colors.include?(word) }
  end

  def url
    "#{settings['FQDN']}/rest/2/SpeechToText"
  end

  def to_s

  end

  def obtain_tokens
    read_tokens(settings['tokens_file'])

    response = RestClient.post "#{settings['FQDN']}/oauth/access_token",
                               :grant_type => 'client_credentials',
                               :client_id => settings['api_key'],
                               :client_secret => settings['secret_key'],
                               :scope => 'SPEECH'

    from_json = JSON.parse(response.to_str)
    settings['access_token'] = from_json['access_token']
    settings['refresh_token'] = from_json['refresh_token']
    write_tokens(settings['tokens_file'])
  end

  def write_tokens(tokens_file)
    File.open(tokens_file, 'w+') { |f| f.puts settings['access_token'], settings['refresh_token'] }
  end

  def read_tokens(tokens_file)
    access_token, refresh_token, refresh_expiration = File.foreach(tokens_file).first(2).map! &:strip!
    settings['access_token'] = access_token
    settings['refresh_token'] = refresh_token
  rescue
    return
  end

end