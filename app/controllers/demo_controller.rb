class DemoController < ApplicationController
  include StylesheetsConcern
  before_action :setup_stylesheets

  def basic
    @page_title = "View Component Auto CSS"
  end
  def import
    @page_title = "View Component Auto CSS Imports"
  end
end
