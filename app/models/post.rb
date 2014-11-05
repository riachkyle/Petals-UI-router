class Post < ActiveRecord::Base
  #attr_accessor :pic_file_name
  has_attached_file :pic,
     :styles => {
       :medium => "300x300>", :thumb => "100x100>"
     },
     :bucket => 'petals-queue',
     :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :pic, :content_type => /\Aimage\/.*\Z/
  validates_attachment_presence :pic, message: "Please provide a picture"
  validates_presence_of :release_date, message: "Please add the release time"

end
