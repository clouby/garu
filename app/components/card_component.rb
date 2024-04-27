# frozen_string_literal: true

# class CardComponent
class CardComponent < ViewComponent::Base
  with_collection_parameter :item

  def initialize(item:)
    super
    @item = item
  end
end
