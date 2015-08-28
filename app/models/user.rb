class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :properties
  has_many :bookings

  def self.authenticate(email, password)
      @user = User.find_by(email: email)
      if @user && @user.password == password
        @user
      else
        nil
      end

  end

end
