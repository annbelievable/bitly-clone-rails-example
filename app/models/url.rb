class Url < ApplicationRecord
  before_create :shorten

  def shorten
    self.short_url = SecureRandom.hex(4)
  end
end
