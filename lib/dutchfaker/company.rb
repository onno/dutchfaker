module DutchFaker
  class Company
    SUFFIXES = %w(B.V. NV V.O.F.)
    
    Formats = [
      Proc.new { [ Name.last_name, suffix ].join(' ') },
      Proc.new { [ Name.last_name, suffix ].join(' ') },
      Proc.new { [ Name.last_name, suffix ].join(' ') },
      Proc.new { [ Name.last_name, suffix ].join(' ') },
      Proc.new { [ Name.last_name, Name.last_name ].join('-') },
      Proc.new { "%s, %s en %s" % [ Name.last_name, Name.last_name, Name.last_name ] }
    ]
    
    class << self
      def name
        Formats.rand.call
      end
    
      def suffix
        SUFFIXES.rand
      end
    end
  end
end