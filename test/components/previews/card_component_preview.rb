# frozen_string_literal: true

class CardComponentPreview < ViewComponent::Preview
  def with_default_item(items:)
    render(CardComponent.with_collection(items))
  end
end
