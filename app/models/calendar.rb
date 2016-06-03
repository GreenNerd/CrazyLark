class Calendar < ActiveRecord::Base
  belongs_to :corperation
  validates :day, presence: true
  validates :corperation_id, presence: true, uniqueness: true
  validates :start, presence: true, numericality: true
  validates :arrive, presence: true, numericality: true
  validates :late, presence: true, numericality: true
  validates :run, presence: true, numericality: true
  validates :leave, presence: true, numericality: true
  validates :finish, presence: true, numericality: true
  # validate :valid_times, on: :update
  # def valid_times
    # params[:start] < params[:arrive] && params[:arrive] < params[:late]
  # end
end
