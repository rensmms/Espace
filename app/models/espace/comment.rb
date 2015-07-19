module Espace
  class Comment < ActiveRecord::Base
    belongs_to :creator, class_name: Espace.user_class.to_s, foreign_key: :created_by_id
  end
end
