# frozen_string_literal: true

class ApplicationComponent < ViewComponent::Base
  delegate :use_stylesheet, to: :controller

  def initialize(force_inline_stylesheet: false, **args)
    @force_inline_stylesheet = force_inline_stylesheet
  end

  attr_accessor :force_inline_stylesheet

  def before_render
    name = self.class.name.underscore
    entrypoint = "app/components/#{name}/#{name}.css"

    use_stylesheet("/#{entrypoint}", force_inline_stylesheet:) if File.exist?(entrypoint)
  end
end
