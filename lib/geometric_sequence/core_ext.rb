Fixnum.class_eval do
  include GeometricSequence::Helper
  def geometric_sequence(pk=nil,e=true)
    unless pk.nil?
      if e
        a = parse_pk(self,pk,e)
      else
        return parse_pk(self,pk,e).to_s.each_char.map {|c| c+(('a'..'z').to_a[rand(26)]) }.join
      end
    else
      a = self
    end
    b ||= 2
    if a >= 2
      c, h = 1, 0
      while (a - b) >= 0
        c += 1; b = b * 2; h = b
      end
      s = [h / 2]; a -= h / 2; b = h / 4
      while a > 0
        if a >= b
          a -= b; s << b; b = b / 2
        else
          b = b / 2
        end
      end
      return s
    elsif a.to_i == b
      return b
    else
      p "Please supply a value greater than 1"
      return 2
    end
  end

  protected

  def parse_pk(v,pk,e=true)
    if check_pk(pk)
      ms = ""
      as = ""
      s = false
      pk.each_char do |c|
        if c == "*"
          s = false
        elsif c == "+"
          s = true
        end
        if s == false
          ms += c
        else
          as += c
        end
      end
      m = ms[1..-1].to_i
      a = as[1..-1].to_i
      if e
        return (v-a)/m
      else
        return v*m+a
      end
    end
  end
end

String.class_eval do
  def geometric_sequence(pk=nil,e=true)
    v = self.tr('^0-9','').to_i
    puts v.inspect
    v.geometric_sequence(pk,e)
  end
end

Array.class_eval do
  def to_g_hash
    b = []
    self.each_index{ |x| b << 2**(x+1); b << self[x] }
    return Hash[*b]
  end
end
