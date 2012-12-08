class MorseCode < String

  def to_morse
    self.split('').map{|letter| translate(letter) }
  end

  def translate(letter)
    code[letter.to_sym]
  end

  def code
    @code = {
        :a => '.-',
        :b => '-...',
        :c => '-.-.',
        :d => '-..',
        :e => '.',
        :f => '..-.',
        :g => '--.',
        :h => '....',
        :i => '..',
        :j => '.---',
        :k => '-.-',
        :l => '.-..',
        :m => '--',
        :n => '-.',
        :o => '---',
        :p => '.--.',
        :q => '--.-',
        :r => '.-.',
        :s => '...',
        :t => '-',
        :u => '..-',
        :v => '...-',
        :w => '.--',
        :x => '-..-',
        :y => '-.--',
        :z => '--..',
        :" " => ' '
    }
  end
end