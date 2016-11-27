class Post < ActiveRecord::Base

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  has_attached_file :image,
  styles: {
    thumb: '125x125>',
    medium: '200x200>',
    large: '300x300>'
  },
  default_url: "/images/:style/missing.png"
  # path: ":rails_root/public/system/posts/:attachment/:id/:style/:filename",
  # url: "/system/posts/:attachment/:id/:style/:filename"

  validates :image,
    attachment_content_type: {content_type: /\Aimage\/.*\Z/},
    attachment_size: { less_than: 5.megabytes }

  validates :user_id, presence: true

def all_tags=(names)
  self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip.delete('#')).first_or_create!
  end
end

def all_tags
  self.tags.map(&:name)
end

def self.tagged_with(name)
   Tag.find_by_name!(name).posts
end

end
