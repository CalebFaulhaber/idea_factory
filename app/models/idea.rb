class Idea < ApplicationRecord

    belongs_to :user, optional: true

    validates :title, presence: true    # , uniqueness: true

    before_save :capitalize_title

    private

    def capitalize_title
        self.title.capitalize!
    end

end
