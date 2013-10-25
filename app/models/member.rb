class Member < ActiveRecord::Base
  has_secure_password

=begin
  attr_accessor :password, :password_confirmation
  validates :password, presence: {on: :create}, confirmation: {allow_blank: true}
=end

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

=begin
  def password=(val)
    if val.present?
      #self.hashed_password = BCrypt::Password.create(val)
      self.hashed_password = 'aaa'
    else
      self.hashed_password = 'bbb'
    end
    @password = val
  end
=end

  class << self
    def search(query)
      rel = order('number')
      if query.present?
        rel = rel.where("name LIKE ? OR full_name LIKE ?", "%#{query}%", "%#{query}%")
      end
      rel
    end

    #authenticate
    def authenticate(email, password)
      member = find_by_name(email)
      if member
        return member.authenticate(password) #model
      else
        return null
      end
    end
  end
end

