class Identity < OmniAuth::Identity::Models::ActiveRecord
  attr_accessible :email, :name, :password_digest,
                  :password, :password_confirmation
  validates :email, :presence => true, :uniqueness => true
  validates :name, :presence => true
end
