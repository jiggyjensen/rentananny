class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :nanny
  has_one :review
  has_one_attached :photo

  def color
    if status == 'accepted'
      return 'green'
    elsif status == 'rejected'
      return 'red'
    else
      return 'grey'
    end
  end
end
