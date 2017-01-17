require 'rails_helper'

RSpec.describe "addresses/edit", type: :view do
  before(:each) do
    @address = assign(:address, Address.create!(
      :user => nil,
      :name => "MyString",
      :address1 => "MyString",
      :address2 => "MyString",
      :zip_code => "MyString",
      :city => "MyString",
      :state => "MyString",
      :country => "MyString",
      :phone => "MyString",
      :mobile => "MyString",
      :email => "MyString",
      :website => "MyString",
      :other => "MyText"
    ))
  end

  it "renders the edit address form" do
    render

    assert_select "form[action=?][method=?]", address_path(@address), "post" do

      assert_select "input#address_user_id[name=?]", "address[user_id]"

      assert_select "input#address_name[name=?]", "address[name]"

      assert_select "input#address_address1[name=?]", "address[address1]"

      assert_select "input#address_address2[name=?]", "address[address2]"

      assert_select "input#address_zip_code[name=?]", "address[zip_code]"

      assert_select "input#address_city[name=?]", "address[city]"

      assert_select "input#address_state[name=?]", "address[state]"

      assert_select "input#address_country[name=?]", "address[country]"

      assert_select "input#address_phone[name=?]", "address[phone]"

      assert_select "input#address_mobile[name=?]", "address[mobile]"

      assert_select "input#address_email[name=?]", "address[email]"

      assert_select "input#address_website[name=?]", "address[website]"

      assert_select "textarea#address_other[name=?]", "address[other]"
    end
  end
end
