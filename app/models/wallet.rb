class Wallet < ActiveRecord::Base
  includes ApplicationHelper
  belongs_to :account


  validate :initializeWallet

  def initializeWallet
     if self.new_record?
        self.code= generate_activation_code(12)
       end
  end

  # Generates a random string from a set of easily readable characters
  def generate_activation_code(size = 6)
    charset = %w{ 2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z}
    (0...size).map{ charset.to_a[rand(charset.size)] }.join
  end

end
