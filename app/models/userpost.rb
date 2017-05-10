class Userpost < ApplicationRecord

belongs_to :user

   validates :title, presence: true
    validates :content, presence: true

    scope :published, -> { where(publish: true).order(id: :desc) }

    def self.matching_title_or_content search
     where("title LIKE ? OR content LIKE?", "%#{search}%", "%#{search}%")
    end




end
