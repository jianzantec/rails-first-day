class Member < ApplicationRecord
  has_many :grades
  before_create :encryption_pwd

  private
  # 密码加密
  def encryption_pwd
    pwd = Digest::MD5.hexdigest(self.pwd)
    if self.is_encryption == 1
      self.pwd = pwd
    end
  end
end
