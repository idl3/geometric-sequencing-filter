module GeometricSequence
  module Helper
    def check_pk(pk)
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
          return "#{cl}#{intl}#{signed_intl}"
        else
          p "PassKey invalid please use the following format '*2+123456'"
          false
        end
      else
        p "PassKey must be a valid String"
        false
      end
    end
  end
end
