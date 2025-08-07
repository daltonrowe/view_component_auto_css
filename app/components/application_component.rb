# frozen_string_literal: true

class ApplicationComponent < ViewComponent::Base
  delegate :use_stylesheet, to: :controller

  def before_render
    name = self.class.name.underscore
    entrypoint = "app/components/#{name}/#{name}.js"

    use_stylesheet("/#{entrypoint}") if File.exist?(entrypoint)
  end
end
