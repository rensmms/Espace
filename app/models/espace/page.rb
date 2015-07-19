module Espace
  class Page < ActiveRecord::Base
    belongs_to :creator, class_name: Espace.user_class.to_s, foreign_key: :created_by_id
    belongs_to :last_contributor, class_name: Espace.user_class.to_s, foreign_key: :updated_by_id
    belongs_to :destructor, class_name: Espace.user_class.to_s, foreign_key: :deleted_by_id
    has_many :comments, class_name: "Espace::Comment"

    after_save :delete_cache

    #validates_presence_of :user_id, message: I18n.t("pages.validate.author")
    validates_presence_of :title, message: I18n.t("pages.validate.title")
    validates_presence_of :text, message: I18n.t("pages.validate.text")

    scope :actifs, -> { where("deleted_at is null") }
    scope :inactifs, -> { where("deleted_at is not null") }
    scope :publics, -> { where("published_at is not null") }
    scope :privates, -> { where("published_at is null") }

    #Override methods
    def destroy(options={})
      self.delete options
    end

    def delete(options={})
      d = options[:deleted_by_id]
      self.update_attributes deleted_at: DateTime.now, deleted_by_id: d
    end

    def active?
      self.deleted_at.nil?
    end

    def activate
      self.update_attribute :deleted_at, nil
    end

    def published?
      !self.published_at.nil?
    end

    def publish
      self.update_attribute :published_at, DateTime.now
    end

    def unpublish
      self.update_attribute :published_at, nil
    end

    def path_cache
      "/gems/espace/pages/#{self.id}"
    end

    private

    def delete_cache
      Rails.cache.delete(self.path_cache)
    end


  end
end
