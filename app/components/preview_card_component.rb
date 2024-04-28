# frozen_string_literal: true
# TODO: Refactor style and wrapping sets for friendly component
class PreviewCardComponent < ViewComponent::Base
  with_collection_parameter :item

  def initialize(item:)
    @item = item
  end
end
