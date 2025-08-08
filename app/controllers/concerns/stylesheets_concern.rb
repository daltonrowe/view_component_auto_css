module StylesheetsConcern
  extend ActiveSupport::Concern

  def setup_stylesheets
    @inline = true
    @inline_stylesheets = Set.new
    @link_stylesheets = Set.new
    @all_stylesheets = Set.new
    @rendered_stylesheets = []
  end

  def use_stylesheet(stylesheet, force_inline_stylesheet: false)
    return if @all_stylesheets.include?(stylesheet) && !force_inline_stylesheet

    if @inline || force_inline_stylesheet
      @inline_stylesheets << stylesheet
    else
      @link_stylesheets << stylesheet
    end
  end

  def inline_stylesheets
    @inline_stylesheets.sort
  end

  def inline_stylesheet(stylesheet)
    entry = ViteRuby.instance.manifest.resolve_entries(stylesheet)
    css = ""

    entry[:scripts].each do |file|
      @rendered_stylesheets << file
      css += File.read("#{Rails.root}/public#{file}")
    end

    css
  end

  def link_stylesheets
    @link_stylesheets.sort
  end

  def link_stylesheet(stylesheet)
    entry = ViteRuby.instance.manifest.resolve_entries(stylesheet)
    hrefs = []

    entry[:scripts].each do |file|
      @rendered_stylesheets << file
      hrefs << file
    end

    hrefs
  end

  def print_stylesheets
    <<~HEREDOC
      Inlined Stylesheets:#{' '}
      #{@inline_stylesheets.join("\n")}

      Linked Stylesheets:#{' '}
      #{@link_stylesheets.join("\n")}

      Rendered Stylesheets:#{' '}
      #{@rendered_stylesheets.join("\n")}
    HEREDOC
  end

  def end_inline_stylesheets
    @inline = false
  end

  included do
    helper_method :use_stylesheet
    helper_method :end_inline_stylesheets

    helper_method :inline_stylesheets
    helper_method :inline_stylesheet

    helper_method :link_stylesheets
    helper_method :link_stylesheet

    helper_method :print_stylesheets
  end
end
