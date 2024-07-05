# frozen_string_literal: true

require 'test_helper'

class PreviewCardComponentTest < ViewComponent::TestCase
  def test_render_component
    items = [{ 'name' => 'Elden Ring',
               'summary' => 'It includes elements that are similar to those in other FromSoftware-developed games',
               'cover' => { 'image_id' => '_id_1234' } }]

    render_inline(PreviewCardComponent.with_collection(items))

    assert_selector('img[alt="Elden Ring Cover Image"]')
    assert_selector('h3', text: 'Elden Ring')
  end
end
