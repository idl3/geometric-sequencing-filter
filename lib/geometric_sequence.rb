require 'geometric_sequence/core_ext'

module GeometricSequence
  class Geometric
    attr_reader :choices
    def initialize
      @choices = {}
    end

    def set_choices(choices)
      if choices.class == Array
        @choices = choices.to_g_hash
        return true
      end
      p "Choices must be an array. e.g ['Choice1', 'Choice2', 'Choice3']"
      false
    end

    def compare(value, pk=nil)
      unless pk.nil?
        a = value.geometric_sequence(pk)
      else
        a = value.geometric_sequence
      end
      r = []
      a.each do |i|
        r << self.choices[i] unless self.choices[i].nil?
      end
      r.reverse
    end
  end
end
