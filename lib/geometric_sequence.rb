require 'geometric_sequence/core_ext'

module GeometricSequence
  class Geometric
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
      if pk.class == String
        re1 = '.*?'
        re2 = '(\\*)'
        re3 = '(\\d+)'
        re4 = '([-+]\\d+)'
        re = (re1 + re2 + re3 + re4)
        m = Regexp.new(re,Regexp::IGNORECASE)
        if m.match(pk)
          cl = m.match(pk)[1]
          intl = m.match(pk)[2]
          signed_intl = m.match(pk)[3]
          @pk = "#{cl}#{intl}#{signed_intl}"
          return true
        else
          p "PassKey invalid please use the following format '*2+123456'"
          false
        end
      else
        p "PassKey must be a valid String"
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
