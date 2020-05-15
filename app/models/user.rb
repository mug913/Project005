class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   
    has_many :game_scores
    has_many :game_tables, through: :game_scores

    
    validates :username, :email, presence: true
    validates :username, :email, uniqueness: true


 
     # def authenticatable_salt
 #     "#{super}#{session_token}"
  #  end
    
 #   def invalidate_all_sessions!
 #     self.session_token = SecureRandom.hex
 #   end

end
