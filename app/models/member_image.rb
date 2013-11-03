class MemberImage < ActiveRecord::Base
  belongs_to :member

  IMAGE_TYPES = {
    'image/jpeg' => 'jpg',
    'image/gif' => 'gif',
    'image/png' => 'png',
  }

  def extension
    IMAGE_TYPES[content_type]
  end
end
