class Member < ActiveRecord::Base

  validates :number, presence: true, uniqueness: true,
    numericality: {only_integer: true,
                   greater_than: 0,
                   less_than: 100,
                   allow_blank: true }

  validates :name, presence: true,
    format: {with: /\A[A-Za-z]\w*\z/, allow_blank: true},
    length: {minimum: 2, maximum: 20, allow_blank: true},
    uniqueness: {case_sensitive: false}

  validates :full_name, length: {maximum: 20}

  validates_email_format_of :email

  class << self
    def search(query)
      rel = order('number')
      if query.present?
        rel = rel.where("name LIKE ? OR full_name LIKE ?", "%#{query}%", "%#{query}%")
      end
      rel
    end
  end
end

