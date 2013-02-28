# External
require 'fileutils'
require 'rubygems/user_interaction'

# Internal
require 'gem_newgem/newgem/configuration'

module GemNewgem

  class Newgem

    class Template
      # Class methods
      class << self
        include Gem::UserInteraction

        def get_config
          @config ||= GemNewgem::Newgem::Configuration.instance
        end

        def ensure_default
          create_base_dir unless Dir.exists?(get_config.templates_base_dir)
          create_default_template unless Dir.exists?(default_template_path)
        end

        def create_base_dir
          FileUtils.mkdir_p @config.templates_base_dir
        end

        def default_template_path
          File.expand_path(File.join(get_config.templates_base_dir, get_config.default_template))
        end

        def create_default_template
          alert "Default template doesn't seem to exists yet. Will git clone it now..."
          command = "git clone -v #{get_config.default_template_git_url} #{default_template_path}"
          say command
          result = system(command)
          alert_error "git not installed or not found in path." if result.nil?
          alert_error "Cloning default template failed." if $?.exitstatus != 0
          terminate_interaction(1) if $?.exitstatus != 0
          validate_exists(default_template_path)
        end

        def validate_exists(path)
          unless Dir.exists?(path)
            alert_error "Templates directory #{path} doesn't exist!"
            terminate_interaction(1)
          end
        end
      end
    end

    class Template
      # Instance methods
      attr_reader :name

      def initialize(name)
        @name = name
        @config = Template.get_config
      end

      def path
        File.expand_path(File.join(@config.templates_base_dir, name))
      end

      def validate
        Template.validate_exists(path)
      end
    end

  end
end
