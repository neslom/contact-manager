class Company < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :user

  include Contact

  def to_s
    "#{name}"
  end
end
