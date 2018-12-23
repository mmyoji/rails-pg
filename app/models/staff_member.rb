class StaffMember < ApplicationRecord
  include EmailRegisterable

  belongs_to :company

  validates :username, presence: true, uniqueness: true, length: { maximum: 16 }
end
