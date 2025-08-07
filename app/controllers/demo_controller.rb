class DemoController < ApplicationController
  include StylesheetsConcern
  before_action :setup_stylesheets

  def show;end
end
