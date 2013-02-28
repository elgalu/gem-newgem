# gem-newgem

## Description

This a [rubygems plugin][Gem plugins] useful to generate new gem skeleton based on a default or custom template.

```bash
$ gem install gem-newgem
$ gem new fancy_stuff --summary "This newgem will do some fancy stuff"
```

## Similar tools

You can achieve pretty much the same with [bundle gem][] GEMNAME using [bundler predefined][] template.

Or you can use one of these tools:

[Ore][] | [RubiGen][] | [gem-init][] | [prigner][] | [gem-new][]

But i guess i just wanted to write my own ;)

If you like the idea of creating creating custom generators take a look at [thor][] (used by this gem) and how to [start][] the generator from your ruby script.

## Installation

```bash
$ gem install gem-newgem
```

## Usage

Use either the long form `$ gem newgem GEMNAME` or the [short form][] `$ gem new GEMNAME`

```bash
$ gem newgem GEMNAME [--template TEMPLATE_NAME] [--summary "This newgem will do some fancy stuff"]

$ gem newgem --help
Usage: gem newgem GEMNAME [options]

  Options:
    -t, --template TEMPLATE_NAME     Use TEMPLATE instead of `default` template
                                     By default, all templates are looked at ~/.newgem-templates/
    -s, --summary "SUMMARY_TEXT"     Set the gem summary text now in case you want to save time.

  Common Options:
    -h, --help                       Get help on this command
    -V, --[no-]verbose               Set the verbose level of output
    -q, --quiet                      Silence commands
        --config-file FILE           Use this config file instead of default
        --backtrace                  Show stack backtrace on errors
        --debug                      Turn on Ruby debugging

  Arguments:
    GEMNAME          name of the gem skeleton to generate.

  Summary:
    Generate new gem skeleton based on a default or custom template.

  Defaults:
    --template default --summary "TODO: Write a gem summary"
```

You can't use templates absolute paths, so place your templates at `~/.newgem-templates/` and provide just the name of the template.

Example:

```bash
$ gem new play_piano -t default -s "Gem that plays all day"
      create  play_piano
      create  play_piano/play_piano.gemspec
      create  play_piano/.gitignore
      create  play_piano/.rspec
      create  play_piano/.travis.yml
      create  play_piano/CHANGELOG.md
      create  play_piano/Gemfile
      create  play_piano/LICENSE.md
      create  play_piano/README.md
      create  play_piano/Rakefile
      create  play_piano/lib/play_piano.rb
      create  play_piano/lib/play_piano/version.rb
      create  play_piano/spec/play_piano_spec.rb
      create  play_piano/spec/spec_helper.rb
INFO: Initializing git repo at play_piano/
  git init
Initialized empty Git repository in ~/apps/gem-newgem/play_piano/.git/
  git add .
INFO: Will add remote so you get ready to push to github
  git remote add github git@github.com:elgalu/play_piano.git
INFO: Make branch tracking automatic
  git config --add branch.master.remote github
  git config --add branch.master.merge refs/heads/master
```

## Contributing

1. Fork it.
2. Make your feature addition or bug fix and create your feature branch.
3. Add specs/tests for it. This is important so I don't break it in a future version unintentionally.
4. Commit, create a new Pull Request.
5. Check that your pull request passes the [build][travis pull requests].

### TODO
+ Add specs so this gem can be published
+ Make easier to use the gem as a general bootstrap tool, not just for new gems
+ Show configurations found banner, then pause, then continue the bootstrap.
+ Add yaml configuration file.
+ Add support to install templates from git like [Ore][Ore custom templates] does.
+ Add more templates.
+ Add more integration with Bundler tasks: 'bundler/gem_tasks'
  + Then add more integration with [RubyGems API][].

## License

Released under the MIT License. See the [LICENSE][] file for further details.

<!-- ## Links

[Gem plugins][] | [RubyGems][] | [Documentation][] | [Source][] | [Bugtracker][] | [Build Status][] | [Dependency Status][] | [Code Climate][]
 -->

[Gem plugins]: http://guides.rubygems.org/plugins/
[short form]: https://github.com/rubygems/rubygems/blob/1894b60ee9b65f768c40a6b834b49f04feac6edd/lib/rubygems/command_manager.rb#L190

[bundle install]: http://gembundler.com/man/bundle-install.1.html
[Gemfile]: http://gembundler.com/man/gemfile.5.html
[LICENSE]: LICENSE.md

[RubyGems]: https://rubygems.org/gems/gem-newgem
[Documentation]: http://rubydoc.info/gems/gem-newgem
[Source]: https://github.com/elgalu/gem-newgem
[Bugtracker]: https://github.com/elgalu/gem-newgem/issues
[BS img]: https://travis-ci.org/elgalu/gem-newgem.png
[DS img]: https://gemnasium.com/elgalu/gem-newgem.png
[CC img]: https://codeclimate.com/github/elgalu/gem-newgem.png
[Build Status]: https://travis-ci.org/elgalu/gem-newgem
[travis pull requests]: https://travis-ci.org/elgalu/gem-newgem/pull_requests
[Dependency Status]: https://gemnasium.com/elgalu/gem-newgem
[Code Climate]: https://codeclimate.com/github/elgalu/gem-newgem

[bundle gem]: http://gembundler.com/v1.2/bundle_gem.html
[bundler predefined]: https://github.com/carlhuda/bundler/tree/master/lib/bundler/templates/newgem
[Ore]: https://github.com/ruby-ore/ore
[Ore custom templates]: https://github.com/ruby-ore/ore/blob/5a2d8f48db63f0a0cfd9c6c1d5d15765b0612b28/README.md#custom-templates
[RubiGen]: https://github.com/drnic/rubigen
[gem-init]: https://github.com/mwhuss/gem-init
[prigner]: https://github.com/codigorama/prigner
[gem-new]: https://github.com/apeiros/gem-new
[thor]: https://github.com/wycats/thor/wiki/Generators
[start]: http://elgalu.github.com/2013/how-to-run-thor-tasks-from-your-ruby-scripts/

[RubyGems API]: http://guides.rubygems.org/rubygems-org-api/
