module StylesheetsConcern
  extend ActiveSupport::Concern

  def setup_stylesheets
    @inline = true
    @inline_stylesheets = Set.new
    @link_stylesheets = Set.new
    @all_stylesheets = Set.new
  end

  def use_stylesheet(stylesheet)
    return if @all_stylesheets.include?(stylesheet)

    if @inline
      @inline_stylesheets << stylesheet
    else
      @link_stylesheets << stylesheet
    end
  end

  def inline_stylesheet(stylesheet)
    entry = ViteRuby.instance.manifest.resolve_entries(stylesheet)
    css = ""

    entry[:stylesheets].each do |file|
      css += File.read("#{Rails.root}/public#{file}")
    end

    css
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
    helper_method :inline_stylesheet
    helper_method :end_inline_stylesheets
    helper_method :print_stylesheets
  end
end
