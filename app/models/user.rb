class User < ApplicationRecord
  before_save { self.email = email.downcase if email.present? }
  before_save {
  	  #create empty array to store name
      name_array = []
      #split all the names, then iterate through them
      #while capitalizing every first letter and add to name_array
      name.to_s.split.each do |part|
          name_array << part.capitalize
      end
      #save the capitalized names to the name attribute seperated by space
      self.name = name_array.join(" ")
  }

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true

  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true

  validates :email,
             presence: true,
             uniqueness: { case_sensitive: false },
             length: { minimum: 3, maximum: 254 }

  has_secure_password
end
