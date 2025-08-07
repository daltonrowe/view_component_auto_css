module StylesheetsConcern
  extend ActiveSupport::Concern

  def setup_stylesheets
    @css = []
  end

  def use_stylesheet(stylesheet)
    @css << stylesheet
  end

  def print_stylesheets
    @css.join(" ")
  end

  included do
    helper_method :use_stylesheet
    helper_method :print_stylesheets
  end
end
