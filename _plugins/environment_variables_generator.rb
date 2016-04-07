### author: https://gist.github.com/nicolashery

module Jekyll
  class EnvironmentVariablesGenerator < Generator
    def generate(site)
      site.config['test'] = ENV['TEST'] || 'miss'
      # Add other environment variables to `site.config` here...
    end
  end
end
