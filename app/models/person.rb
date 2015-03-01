class Person < ActiveRecord::Base
  validates :first_name, :last_name, presence: true
  include Contact

  def name
    "#{self.first_name} #{self.last_name}"
  end
end
