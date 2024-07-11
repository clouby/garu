# frozen_string_literal: true

require 'test_helper'

class CardComponentTest < ViewComponent::TestCase
  def test_render_preview
    render_preview(:with_default_item, params: { items: video_games(:first, :second, :third) })

    assert_text('Elden Ring')
    assert_text('Kingdom Hearts 2')
    assert_text('Bloodbourne')
  end

  def test_render_component
    items = video_games(:first, :second)

    render_inline(CardComponent.with_collection(items))

    assert_selector('h3', count: 2)
    assert_selector('h3', text: 'Kingdom Hearts 2')
    assert_selector('h3', text: 'Elden Ring')
  end
end
