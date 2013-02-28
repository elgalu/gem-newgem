# External
require 'active_support/core_ext/string/inflections'

# Internal
require 'gem_newgem/newgem/validations'
require 'gem_newgem/newgem/configuration'
require 'gem_newgem/newgem/template'

module GemNewgem
  class Newgem
    include Validations

    attr_reader :gem_name, :gem_summary, :template, :config

    def initialize(gem_name, gem_summary, template)
      @config        = Configuration.instance
      @gem_name      = gem_name    || ''
      @gem_summary   = gem_summary || config.default_summary
      template_name  = template    || config.default_template
      @template      = Template.new(template_name)
    end

    def generate!
      load "#{File.join(template.path, template.name)}.thor"
      args = [gem_name, template.name]
      opts = { gem_summary: gem_summary }
      const_name = "GemNewgem::Templates::#{template.name.capitalize}".constantize
      script = const_name.new(args, opts)
      script.invoke_all
    end

  end
end
