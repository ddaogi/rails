class Article < ApplicationRecord
  include Visible


  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10}


  #이걸 빼는 이유는 concerns로 관리하기 때문에
  # VALID_STATUSES = ['public', 'private', 'archived']
  # validates :status , inclusion: { in: VALID_STATUSES }
  # def archived?
  #   status == 'archived'
  # end
end
