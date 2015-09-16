class LigerRentalRequest < ActiveRecord::Base
  STATI = [
    "PENDING",
    "APPROVED",
    "DENIED"
  ]
  after_initialize :default_values
  validates :liger_id, :start_date, :end_date, presence: true
  validates :status, inclusion: { in: STATI }
  validate :cannot_have_multiple_overlapping_requests
  validate :start_date_is_before_end_date

  belongs_to :liger


  def approve!
    LigerRentalRequest.transaction do
      self.status = "APPROVED"
      self.save!
      overlapping_requests.each(&:deny!)
      # LigerRentalRequest.update_all
    end
  end

  def deny!
    self.status = "DENIED"
    self.save!
  end

  def pending?
    self.status == 'PENDING'
  end

  private

  def default_values
    self.status ||= 'PENDING'
  end

  def same_liger_requests
    unless id.nil?
      LigerRentalRequest.where(liger_id: liger_id).where.not('id = ?', id)
    else
      LigerRentalRequest.where(liger_id: liger_id)
    end
  end

  def overlapping_requests
    same_liger_requests.select do |request|
      [start_date, end_date].any? do |date|
        next if date.nil?
        date.between?(request.start_date, request.end_date)
      end
    end
  end

  def overlapping_approved_requests
    overlapping_requests.select do |request|
      request.status == 'APPROVED'
    end
  end

  def cannot_have_multiple_overlapping_requests
    unless overlapping_approved_requests.empty? || self.status == "DENIED"
      errors[:base] << "can't have overlapping approved requests!"
    end
  end

  def start_date_is_before_end_date
    unless start_date < end_date
      errors[:base] << "rental start date must be before end date"
    end
  end



end
