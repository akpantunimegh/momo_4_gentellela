class Instant < ActiveRecord::Base
  belongs_to :account
  has_many :payments, dependent: :delete_all
end
