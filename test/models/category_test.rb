require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = categories(:one)
  end

  test 'should be valid' do
    assert @category.valid?
  end

  test 'should be invalid without name present' do
    @category.name = nil
    refute @category.valid?
  end
end
