class Url < ActiveRecord::Base
  before_create :generate_short_url, :set_click_count

  validates :long_url, :presence => true, :uniqueness => true

  def set_click_count
    self.click_count  ||= 0
  end

  def generate_short_url
    str = random_string
    while Url.find_by_short_url(str)
      str = random_string
    end
    self.short_url = str
  end

  def random_string
    str = ""
    6.times { str += ('a'..'z').to_a.sample }
    str
  end




end
