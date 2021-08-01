class Reservation < ApplicationRecord
  validates :num_people, presence: true
  validate :start_end_check

  def start_end_check
    errors.add(:終了日, "は開始日より前の日付は登録できません。") unless
    self.start_date < self.fin_date
  end
end
