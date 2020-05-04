class User < ApplicationRecord
    has_secure_password

    has_many :game_scores
    has_many :game_tables, through: :game_scores

    validates :username, :email, presence: true
    validates :username, :email, uniqueness: true

end
