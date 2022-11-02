class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: ["Fiction", "Non-Fiction"]
    validate :clickbait

    def clickbait
        if title.present? && !( title.match?("Won't Believe") || title.match?("Secret") || title.match?("Top") || title.match?("Guess") )
            errors.add(:title, "not sufficiently clickbait-y")
        end
    end
end
