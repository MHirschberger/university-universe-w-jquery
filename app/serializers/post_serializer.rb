class PostSerializer < ActiveModel::Serializer
  attributes :id, :post_type, :content, :updated_at
end
