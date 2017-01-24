class Address < ApplicationRecord
  belongs_to :user

  # Validations are mainly present so views can't be broken with some extreme values
  # Addresses are for the use of User himself so no point of stopping him trying to enter 'batman' as phone number
  validates :name, presence: true
  validates :name, uniqueness: { scope: :user_id }
  validates :address1, presence: true, if: :address2?
  validates :name, :zip_code, :country, :state, :phone, :mobile, :email, :website, length: { maximum: 50 }
  validates :address1, :address2, length: { maximum: 200 }
  validates :other, length: { maximum: 2000 }

  def self.to_csv(options = {})
    columns_to_use = %w{name address1 address2 zip_code city state country phone mobile email website other}
    CSV.generate(options) do |csv|
      csv << columns_to_use
      all.each do |address|
        csv << address.attributes.values_at(*columns_to_use)
      end
    end
  end

  def self.import(file, current_user)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      address = new
      address.attributes = row.to_hash.slice(*row.to_hash.keys)
      address.user = current_user
      if address.valid?
        address.save!
      else
        return nil
      end

    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path, csv_options: {encoding: "iso-8859-1:utf-8"})
      else raise "Unknown file type: #{file.original_filename}"
    end
  end

  scope :mine, -> (current_user) { where("user_id = ?", current_user)}

end
