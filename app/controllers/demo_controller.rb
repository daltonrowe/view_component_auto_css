class DemoController < ApplicationController
  include StylesheetsConcern
  before_action :setup_stylesheets

  def basic
    @page_title = "View Component Auto CSS"
  end
  def import
    @page_title = "View Component Auto CSS Imports"
  end

  def order
    params[:version] = "A" unless params[:version].present?

    @page_title = "View Component Auto CSS Ordering (#{params[:version]})"
  end
end
