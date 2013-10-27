class Article < ActiveRecord::Base
  scope :member_only, where(member_only: true)

  scope :readable_for,
    ->(member){
      now = Time.current
      #rel = where("released_at <= ? AND (? < expired_at OR expired_at IS NULL)", now, now)
      rel = where("")
      member.kind_of?(Member) ? rel : rel.where(:member_only => false) }
  
  before_validation :clear_expired_at

  validates :title, :body, :released_at, presence: true
  validates :title, length: {maximum: 200}

  private
  def check_expired_at
    if expired_at && expired_at < released_at
      errors.add(:expired_at, :expired_at_too_old)
    end
  end

  def no_expiration
    expired_at.blank?
  end

  def no_expiration=(val)
    @no_expiration = val.in?([true, 1, '1'])
  end

  def clear_expired_at
    self.expired_at = nil if @no_expiration
  end

  class << self
    def sidebar_articles(member, num=5)
      readable_for(member).order("released_at DESC").limit(num)
    end
  end
end

