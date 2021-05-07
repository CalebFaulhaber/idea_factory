class Review < ApplicationRecord

    belongs_to :idea
    belongs_to :user, optional: true

    validates :rating, presence: { message: 'Please select a rating' }, length: { minimum: 1, maximum: 5 }

end
