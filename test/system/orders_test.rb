require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "creating a Order" do
    visit orders_url
    click_on "New Order"

    fill_in "Order number", with: @order.order_number
    fill_in "Payment type", with: @order.payment_type
    fill_in "Shipping fee", with: @order.shipping_fee
    fill_in "Status", with: @order.status
    fill_in "Tax fee", with: @order.tax_fee
    fill_in "Token key", with: @order.token_key
    fill_in "Total", with: @order.total
    fill_in "User", with: @order.user_id
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "updating a Order" do
    visit orders_url
    click_on "Edit", match: :first

    fill_in "Order number", with: @order.order_number
    fill_in "Payment type", with: @order.payment_type
    fill_in "Shipping fee", with: @order.shipping_fee
    fill_in "Status", with: @order.status
    fill_in "Tax fee", with: @order.tax_fee
    fill_in "Token key", with: @order.token_key
    fill_in "Total", with: @order.total
    fill_in "User", with: @order.user_id
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "destroying a Order" do
    visit orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order was successfully destroyed"
  end
end
