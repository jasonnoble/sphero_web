class SpheroColors < Struct.new(:color, :rgb_value)
  def self.all_colors
    @colors ||= [
      self.new('Black', 'Black,0,0,0'),
      self.new('White', 'White,255,255,255'),
      self.new('Red', 'Red,255,0,0'),
      self.new('Lime', 'Lime,0,255,0'),
      self.new('Blue', 'Blue,0,0,255'),
      self.new('Yellow', 'Yellow,255,255,0'),
      self.new('Cyan', 'Cyan,0,255,255'),
      self.new('Magenta', 'Magenta,255,0,255'),
      self.new('Silver', 'Silver,192,192,192'),
      self.new('Gray', 'Gray,128,128,128'),
      self.new('Maroon', 'Maroon,128,0,0'),
      self.new('Olive', 'Olive,128,128,0'),
      self.new('Green', 'Green,0,128,0'),
      self.new('Purple', 'Purple,128,0,128'),
      self.new('Teal', 'Teal,0,128,128'),
      self.new('Navy', 'Navy,0,0,128')
    ]
  end
end