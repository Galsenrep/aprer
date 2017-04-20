class Article < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "500x300>", thumb: "100x80>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  belongs_to :user
  before_save :set_slug #permet d'appeler une fonction avant enregistrement

  self.per_page = 3


private
def set_slug
  self.slug=self.title.parameterize+"&#{DateTime.now}"
end

  def self.search(search)
    where("title LIKE ? OR content LIKE ?", "%#{search}%", "%#{search}%")
  end

end
