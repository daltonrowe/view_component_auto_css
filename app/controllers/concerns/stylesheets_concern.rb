module StylesheetsConcern
  extend ActiveSupport::Concern

  def setup_stylesheets
    @inline = true
    @inline_stylesheets = []
    @link_stylesheets = []
  end

  def use_stylesheet(stylesheet)
    if @inline
      @inline_stylesheets << stylesheet
    else
      @link_stylesheets << stylesheet
    end
  end

  def print_stylesheets
    <<~HEREDOC
      Inlined Stylesheets: #{@inline_stylesheets.join(" ")}\n
      Linked Stylesheets: #{@link_stylesheets.join(" ")}
    HEREDOC
  end

  def end_inline_stylesheets
    @inline = false
  end

  included do
    helper_method :use_stylesheet
    helper_method :insert_stylesheets
    helper_method :print_stylesheets
  end
end
