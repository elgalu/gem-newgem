# External
require 'rubygems/user_interaction'

# Internal
require 'gem_newgem/newgem/template'

module GemNewgem
  class Newgem
    module Validations
      include Gem::UserInteraction # Methods alert, ask, ask_yes_no...

      def validate
        validate_gem_name
        validate_target_dir
        Template.ensure_default
        template.validate
      end

      private

      def validate_gem_name
        if gem_name.nil? || gem_name.empty?
          alert_error "Please specify a gem name on the command line (e.g. gem newgem GEMNAME)"
          terminate_interaction(1)
        end
      end

      def validate_target_dir
        if Dir.exists?(gem_name)
          alert_error "Directory #{gem_name} already exists! Remove first."
          terminate_interaction(1)
        end
      end

    end
  end
end
