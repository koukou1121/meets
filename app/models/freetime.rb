class Freetime < ActiveRecord::Base
  require 'date'
  belongs_to :user
  belongs_to :booking

validates :place, presence: true


private
  def start_time_should_be_future

    return unless time > Date.today

  end

scope :date_between, -> from, to {
    if from.present? && to.present?
      where(time: from..to)
    elsif from.present?
      where('time >= ?', from)
    elsif to.present?
      where('time <= ?', to)
    end
  }

end
