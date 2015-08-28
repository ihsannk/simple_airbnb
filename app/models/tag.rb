class Tag < ActiveRecord::Base
  # Remember to create a migration!
  has_many :propertytags
  has_many :properties, through: :propertytags


  def self.slice_tag(string_tags)
    arr_tags_obj = []
    arr_tags = string_tags.gsub(/\s+/, "").gsub(/^,*|(?<=,),|,*$/, "").split(",")

    arr_tags.each do |t|
      if Tag.exists?(tag: t)
        arr_tags_obj << Tag.find_by(tag: t)
      else
        arr_tags_obj << Tag.create(tag: t)
      end
    end

    arr_tags_obj

  end
end
