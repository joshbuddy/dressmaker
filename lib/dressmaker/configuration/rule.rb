class Dressmaker
  class Configuration
    class Rule
      
      attr_accessor :description, :informed
      
      def inform
        Dressmaker.inform(self, description) if description && !informed
        self.informed = true
      end
      
      def informed?
        informed
      end
      
    end
  end
end