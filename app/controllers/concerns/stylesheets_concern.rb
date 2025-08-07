module StylesheetsConcern
  extend ActiveSupport::Concern

  def setup_stylesheets
    @inline = true
    @inline_stylesheets = []
    @stylesheets = []
  end

  def use_stylesheet(stylesheet)
    if @inline
      @inline_stylesheets << stylesheet
    else
      @stylesheets << stylesheet
    end
  end

  def print_stylesheets
    <<~HEREDOC
      Inlined Stylesheets: #{@inline_stylesheets.join(" ")}\n
      Linked Stylesheets: #{@stylesheets.join(" ")}
    HEREDOC
  end

  def end_inline_stylesheets
    @inline_stylesheets = false
  end

  included do
    helper_method :use_stylesheet
    helper_method :print_stylesheets
  end
end
