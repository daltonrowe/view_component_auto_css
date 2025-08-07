# frozen_string_literal: true

class ApplicationComponent < ViewComponent::Base
  delegate :use_stylesheet, to: :controller
end
