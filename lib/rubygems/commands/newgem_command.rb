# External
require 'rubygems/command'

# Internal
require 'gem_newgem/platform'
require 'gem_newgem/newgem/configuration'
require 'gem_newgem/newgem'

class Gem::Commands::NewgemCommand < Gem::Command

  def initialize
    super('newgem', GemNewgem::SUMMARY)

    @config = GemNewgem::Newgem::Configuration.instance

    add_option('-t', '--template TEMPLATE_NAME', @config.option_template_desc) do |template, options|
      options[:template] = template
    end

    add_option('-s', '--summary "SUMMARY_TEXT"', @config.option_summary_desc) do |summary, options|
      options[:summary] = summary
    end
  end

  def arguments
    %Q|GEMNAME          name of the gem skeleton to generate.|
  end

  def usage
    %Q|#{program_name} GEMNAME|
  end

  def defaults_str
    %Q|--template #{@config.default_template} --summary "#{@config.default_summary}"|
  end

  def execute
    @newgem = GemNewgem::Newgem.new(
      get_one_optional_argument, options[:summary], options[:template]
    )

    @newgem.validate

    @newgem.generate!
  end

end
