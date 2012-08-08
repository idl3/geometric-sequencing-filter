Fixnum.class_eval do
  def geometric_sequence(pk=nil)
    unless pk.nil?
      a = parse_pk(self,pk)
    else
      a = self
    end
    if a > 2
      c, h = 1, 0; b ||= 2
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
      return 1
    end
  end

  protected

  def parse_pk(v,pk,e=true)
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