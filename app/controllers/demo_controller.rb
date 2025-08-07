class DemoController < ApplicationController
  include StylesheetsConcern
  before_action :setup_stylesheets

  def show
    use_stylesheet("some_css")
  end
end
