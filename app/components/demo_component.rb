# frozen_string_literal: true

class DemoComponent < ApplicationComponent
  def before_render
    use_stylesheet("component_stylesheet")
  end
end
