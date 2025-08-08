class DemoController < ApplicationController
  include StylesheetsConcern
  before_action :setup_stylesheets

  def basic;end
end
