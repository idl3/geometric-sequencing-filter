require 'geometric_sequence/helper'
require 'geometric_sequence/core_ext'

module GeometricSequence
  class Geometric
    include GeometricSequence::Helper
    attr_reader :choices, :pk
    def initialize
      @choices = {}
      @pk = nil
    end

    def set_choices(choices)
      if choices.class == Array
        @choices = choices.to_g_hash
        return true
      end
      p "Choices must be an array. e.g ['Choice1', 'Choice2', 'Choice3']"
      false
    end

    def set_pk(pk)
      @pk = check_pk(pk)
      if @pk
        true
      else
        false
      end
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
