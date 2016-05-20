module Enjoy::Seo
  def self.configuration
    @configuration ||= Configuration.new
  end
  def self.config
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration
  end

  class Configuration
    attr_accessor :localize

    attr_accessor :gallery_support

    def initialize
      @localize = Enjoy.config.localize

      @gallery_support = defined?(Enjoy::Gallery)
    end
  end
end
