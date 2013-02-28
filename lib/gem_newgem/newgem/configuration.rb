require 'singleton'

module GemNewgem
  class Newgem
    class Configuration
      include Singleton

      def templates_base_dir
        "~/.newgem-templates/"
      end

      def default_template
        "default"
      end

      def default_template_git_url
        "git://github.com/elgalu/newgem-template.git"
      end

      def default_summary
        "TODO: Write a gem summary"
      end

      def option_summary_desc
        "Set the gem summary text now in case you want to save time."
      end

      def option_template_desc
        <<-DESC.gsub(/^\s*/, '')
        Use TEMPLATE instead of `default` template
        By default, all templates are looked at #{templates_base_dir}
        DESC
      end

    end
  end
end
