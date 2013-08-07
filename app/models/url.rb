require 'securerandom'

class Url < ActiveRecord::Base
  # Remember to create a migration!
  before_save :generate_short_url
  validates :short_url, uniqueness: true
  validates :long_url, format: { with: /(http|https):\/{2}[a-zA-Z0-9]+.[a-zA-Z]{2,}/i }

  

  private 
  def generate_short_url

    until self.valid?
      #generate short_url
      self.short_url = SecureRandom.hex(3)
    end

  end
end
