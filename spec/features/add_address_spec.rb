require 'spec_helper'
require 'rails_helper'

include Warden::Test::Helpers
Warden.test_mode!

describe 'New address' do
  before :each do
    user = FactoryGirl.create(:user)
    login_as(user)
  end

  it 'creates new address' do
    visit new_address_path
    fill_in('address_name', with:'Tom Jones')
    fill_in('address_phone', with:'0501234567')

    click_button('Save address')

    expect(page).to have_content 'Address was successfully created.'

  end

  it 'doesn´t add address if title empty' do
    visit new_address_path
    fill_in('address_name', with:'')
    fill_in('address_phone', with:'0501234567')

    click_button('Save address')

    expect(page).to have_content 'Name can\'t be blank'
  end
end