class PostSerializer < ActiveModel::Serializer
  attributes :id, :post_type, :content, :created, :last_updated
  belongs_to :course
  belongs_to :user
end
