class Post < ActiveRecord::Base

  belongs_to :user
  has_many :comments, dependent: :destroy

  has_attached_file :image,
  styles: {
    thumb: '125x125>',
    medium: '200x200>',
    large: '300x300>'
  },
  :default_url => "/images/:style/missing.png",
  :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
  :url => "/system/:attachment/:id/:style/:filename"

  validates :image,
    attachment_content_type: {content_type: /\Aimage\/.*\Z/},
    attachment_size: { less_than: 5.megabytes }

  validates :user_id, presence: true

end
