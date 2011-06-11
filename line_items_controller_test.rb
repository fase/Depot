test "should create line_item via ajax" do
  assert_difference('LineItem.count') do
    xhr :post, :create, :product_id => products(:ruby),id
  end

  assert_response :success
  assert_select_rjs :replace_html, 'cart' do
    assert_select 'tr#current_item td', /Programming Ruby 1.9/
  end
end
