require 'rails_helper'

RSpec.describe Address, type: :model do

  before :each do
    FactoryGirl.create(:user)
  end

  it 'saves the address' do
    address = Address.create name: 'Jarkko Pekka',
                             address1: 'Kumpulanmäki 1',
                             address2: 'Rakennus 2, asunto 20',
                             zip_code: '99999',
                             city: 'Helsinki',
                             state: 'Uusimaa',
                             country: 'Finland',
                             phone: '0191234567',
                             mobile: '0501234567',
                             email: 'jarkko.pekka@helsinki.fi',
                             website: 'jarkko.is.best.com',
                             other: 'IRCnet: pekka_slayer',
                             user_id: 1
    expect(address.valid?).to be(true)
    expect(Address.count).to eq(1)
  end

  it 'saves the address with minimal information' do
    address = Address.create name: 'Jarkko Pekka',
                             user_id: 1
    expect(address.valid?).to be(true)
    expect(Address.count).to eq(1)
  end

  it 'doesn´t save the address if there is no name' do
    address = Address.create name: '',
                             address1: 'Kumpulanmäki 1',
                             address2: 'Rakennus 2, asunto 20',
                             zip_code: '99999',
                             city: 'Helsinki',
                             state: 'Uusimaa',
                             country: 'Finland',
                             phone: '0191234567',
                             mobile: '0501234567',
                             email: 'jarkko.pekka@helsinki.fi',
                             website: 'jarkko.is.best.com',
                             other: 'IRCnet: pekka_slayer',
                             user_id: 1
    expect(address.valid?).to be(false)
    expect(Address.count).to eq(0)
  end

  it 'doesn´t save the address if there is no user' do
    address = Address.create name: 'Jarkko Pekka',
                             address1: 'Kumpulanmäki 1',
                             address2: 'Rakennus 2, asunto 20',
                             zip_code: '99999',
                             city: 'Helsinki',
                             state: 'Uusimaa',
                             country: 'Finland',
                             phone: '0191234567',
                             mobile: '0501234567',
                             email: 'jarkko.pekka@helsinki.fi',
                             website: 'jarkko.is.best.com',
                             other: 'IRCnet: pekka_slayer'
    expect(address.valid?).to be(false)
    expect(Address.count).to eq(0)
  end

  it 'doesn´t save the address if there is no address1 when addres2 is present' do
    address = Address.create name: 'Jarkko Pekka',
                             address1: '',
                             address2: 'Rakennus 2, asunto 20',
                             zip_code: '99999',
                             city: 'Helsinki',
                             state: 'Uusimaa',
                             country: 'Finland',
                             phone: '0191234567',
                             mobile: '0501234567',
                             email: 'jarkko.pekka@helsinki.fi',
                             website: 'jarkko.is.best.com',
                             other: 'IRCnet: pekka_slayer',
                             user_id: 1
    expect(address.valid?).to be(false)
    expect(Address.count).to eq(0)
  end

  it 'doesn´t save the address with too long attribute' do
    address = Address.create name: 'a'*100,
                             address1: 'Kumpulanmäki 1',
                             address2: 'Rakennus 2, asunto 20',
                             zip_code: '99999',
                             city: 'Helsinki',
                             state: 'Uusimaa',
                             country: 'Finland',
                             phone: '0191234567',
                             mobile: '0501234567',
                             email: 'jarkko.pekka@helsinki.fi',
                             website: 'jarkko.is.best.com',
                             other: 'IRCnet: pekka_slayer',
                             user_id: 1
    expect(address.valid?).to be(false)
    expect(Address.count).to eq(0)
  end

  it 'doesn´t save the address if one of the address fields is too long' do
    address = Address.create name: 'Jarkko Pekka',
                             address1: 'a'*250,
                             address2: 'Rakennus 2, asunto 20',
                             zip_code: '99999',
                             city: 'Helsinki',
                             state: 'Uusimaa',
                             country: 'Finland',
                             phone: '0191234567',
                             mobile: '0501234567',
                             email: 'jarkko.pekka@helsinki.fi',
                             website: 'jarkko.is.best.com',
                             other: 'IRCnet: pekka_slayer',
                             user_id: 1
    expect(address.valid?).to be(false)
    expect(Address.count).to eq(0)
  end

  it 'doesn´t save the address if there is too much stuff on other field' do
    address = Address.create name: 'Jarkko Pekka',
                             address1: 'Kumpulanmäki 1',
                             address2: 'Rakennus 2, asunto 20',
                             zip_code: '99999',
                             city: 'Helsinki',
                             state: 'Uusimaa',
                             country: 'Finland',
                             phone: '0191234567',
                             mobile: '0501234567',
                             email: 'jarkko.pekka@helsinki.fi',
                             website: 'jarkko.is.best.com',
                             other: 'a'*3000,
                             user_id: 1
    expect(address.valid?).to be(false)
    expect(Address.count).to eq(0)
  end

end
