class Account < ActiveRecord::Base
  has_many :wallets, dependent: :delete_all
  has_many :instants, dependent: :delete_all
  has_many :vaults, dependent: :delete_all

  def self.search(search)
    where("Oid = ?", "%#{search}%")
    #where("content LIKE ?", "%#{search}%")
  end
end