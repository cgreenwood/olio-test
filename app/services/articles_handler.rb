class ArticlesHandler < ApplicationService
  SOURCE_URL = 'https://s3-eu-west-1.amazonaws.com/olio-staging-images/developer/test-articles-v4.json'.freeze

  def initialize
    super
    @articles_json = HTTParty.get(SOURCE_URL).body
  end

  def call
    # Take the articles JSON and convert it into usable OpenStruct objects
    JSON.parse(@articles_json, object_class: OpenStruct)
  end
end
