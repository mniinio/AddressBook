require 'rails_helper'

RSpec.describe "addresses/index", type: :view do
  before(:each) do
    assign(:addresses, [
      Address.create!(
        :user => nil,
        :name => "Name",
        :address1 => "Address1",
        :address2 => "Address2",
        :zip_code => "Zip Code",
        :city => "City",
        :state => "State",
        :country => "Country",
        :phone => "Phone",
        :mobile => "Mobile",
        :email => "Email",
        :website => "Website",
        :other => "MyText"
      ),
      Address.create!(
        :user => nil,
        :name => "Name",
        :address1 => "Address1",
        :address2 => "Address2",
        :zip_code => "Zip Code",
        :city => "City",
        :state => "State",
        :country => "Country",
        :phone => "Phone",
        :mobile => "Mobile",
        :email => "Email",
        :website => "Website",
        :other => "MyText"
      )
    ])
  end

  it "renders a list of addresses" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address1".to_s, :count => 2
    assert_select "tr>td", :text => "Address2".to_s, :count => 2
    assert_select "tr>td", :text => "Zip Code".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Mobile".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
