class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :account,  dependent: :delete
  #validates :last_name, :first_name, :middle_name, :email, :username, presence: true

  #def active_for_authentication?
    # Uncomment the below debug statement to view the properties of the returned self model values.
    # logger.debug self.to_yaml

   # super && account_active?
  #end

  validate :file_size_under_one_mb, :initializeAccount



  def initializeAccount

    self.account_reference = initialize_account_token
    mbal = 0.20
  @account = Account.new
    #@account = self.account.create(:name=>self.username,:account_reference=>self.account_reference,:balance=>mbal)
    @account.name =self.username
    @account.account_reference = self.account_reference
    @account.total_balance = 200.00 # @subscription.pricing[current_user.subscription_type]

    @wallet = @account.wallets.build
    #@wallet = Wallet.new
    @wallet.available_balance = 200.00
    @wallet.name= "General"
    @wallet.description = "General expenses wallet"
    self.account =  Account.new
    self.account = @account
    self.account.save


  end

  # Generates a random string from a set of easily readable characters
  def generate_activation_code(size = 6)
    charset = %w{ 2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z}
    (0...size).map{ charset.to_a[rand(charset.size)] }.join
  end

  #Auto-generate str_token for account reference
  def initialize_account_token
    return_str=""
    return_str  << generate_activation_code(8)
  end


  def initialize(params = {})
    # File is now an instance variable so it can be
    # accessed in the validation.
    @file = params.delete(:file)
    super
    if @file
      self.filename = sanitize_filename(@file.original_filename)
      self.mime_type = @file.original_filename
      self.photo = @file.read
    end
  end

  NUM_BYTES_IN_MEGABYTE = 1048576
  def file_size_under_one_mb
    #if (@file.size.to_f / NUM_BYTES_IN_MEGABYTE) > 1
    #  errors.add(:file, 'File size cannot be over one megabyte.')
   # end
  end


    private
    def sanitize_filename(filename)
      # Get only the filename, not the whole path (for IE)
      # Thanks to this article I just found for the tip: http://mattberther.com/2007/10/19/uploading-files-to-a-database-using-rails
      return File.basename(filename)
    end


end
