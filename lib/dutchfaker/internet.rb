module DutchFaker
  class Internet
    DOMAIN_SUFFIXES = %w(nl com org eu)
    
    FREE_EMAIL_SUFFIXES = %w(gmail.com yahoo.com hotmail.com)
    
    class << self
      def email(name = nil)
        "#{user_name(name)}@#{domain_name}"
      end
      
      def free_email(name = nil)
        "#{user_name(name)}@#{free_email_suffix}"
      end
      
      def free_email_suffix
        FREE_EMAIL_SUFFIXES.rand
      end
      
      def user_name(name = nil)
        return name.scan(/\w+/).join(%w(. _).rand).downcase if name
        [ 
          Proc.new { Name.first_name.gsub(/\W/, '').downcase },
          Proc.new { 
            [ Name.first_name, Name.last_name ].map {|n| 
              n.gsub(/\W/, '')
            }.join(%w(. _).rand).downcase }
        ].rand.call
      end
      
      def domain_name
        "#{domain_word}.#{domain_suffix}"
      end
      
      def domain_word
        Company.name.split(' ').first.gsub(/\W/, '').downcase
      end
      
      def domain_suffix
        DOMAIN_SUFFIXES.rand
      end
      
      def web_site(name = nil)
        "www.#{domain_name}"
      end
    end
  end
end