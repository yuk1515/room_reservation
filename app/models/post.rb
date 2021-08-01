class Post < ApplicationRecord
    validates :content, {presence: true}
    validates :user_id, {presence: true}
    
    def user
      return User.find_by(id: self.user_id)
    end

    def self.search(keyword)
      where(["address like? OR content like?","%#{keyword}%","%#{keyword}%"])
    end

    
end
