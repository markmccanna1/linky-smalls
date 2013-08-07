require 'securerandom'
require 'uri'


class Url < ActiveRecord::Base
  # Remember to create a migration!
  before_save :generate_short_url, :get_page_title
  after_initialize :init
  validates :short_url, uniqueness: true
  validates :long_url, format: { with: /(http|https):\/{2}[a-zA-Z0-9]+.[a-zA-Z]{2,}/i }

  
  def init
    self.click_count ||= 0
  end

  def increment_count
    new_count = self.click_count + 1
    Url.update(self.id, click_count: new_count)
  end
 
  protected
  def generate_short_url
    until self.valid? && self.short_url != nil
      #generate short_url
      self.short_url = SecureRandom.hex(3)
    end
  end

  def get_page_title
    u = URI(self.long_url)
    self.page_title = u.host
  end

end
