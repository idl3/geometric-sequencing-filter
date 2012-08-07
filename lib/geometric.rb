module Geometric
  module ClassMethods
    def geometric(a,l=nil)
      l ||= {1 => "Food",512 => "Poultry", 2 => "Beef", 4 => "Pork", 8 => "Fish", 16 => "Lamb", 32 => "Veal", 64 => "Snake", 128 => "Monkey", 256 => "Hamster"}
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
        s.each do |k|
          p "#{k} - #{l[k]}"
        end
      elsif a.to_i == b
        p [b].inspect
      else
        p "Please supply a value greater than 1"
      end
    end
  end
end
