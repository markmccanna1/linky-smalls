require 'securerandom'

class Url < ActiveRecord::Base
  # Remember to create a migration!
  before_save :generate_short_url
  validates :short_url, uniqueness: true



  private 
  def generate_short_url

    until self.valid?
      #generate short_url
      self.short_url = [1,2,3].sample
    end

  end
end
