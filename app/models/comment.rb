class Comment < ApplicationRecord
  belongs_to :user
  has_rich_text :content

  has_many :emotes, dependent: :destroy
  # has_many :emoters, through: :emotes, class_name: "User"

  def emotes_size(key)
    self.emotes.select { |e| e.emoji == key }.size
  end
end
