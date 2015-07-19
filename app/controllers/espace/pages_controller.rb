require_dependency "espace/application_controller"

module Espace
  class PagesController < ApplicationController
    before_action :set_page, only: [:show, :edit, :update, :destroy, :activate, :publish, :unpublish]
    before_action :set_espace_current_user

    def wall
      @pages = Page.order(:created_at).actifs.publics.limit(100)
    end

    # GET /pages
    def index
      @pages = Page.all
    end

    # GET /pages/1
    def show
    end

    # GET /pages/new
    def new
      @page = Page.new
    end

    # GET /pages/1/edit
    def edit
    end

    # POST /pages
    def create
      @page = Page.new(page_params.merge(created_by_id: current_user.id))

      if @page.save
        redirect_to @page, notice: t("pages.sucess.create")
      else
        render :new
      end
    end

    # PATCH/PUT /pages/1
    def update
      if @page.update(page_params.merge(updated_by_id: current_user.id))
        redirect_to @page, notice: t("pages.sucess.update")
      else
        render :edit
      end
    end

    # DELETE /pages/1
    def destroy
      @page.destroy(deleted_by_id: current_user.id)
      redirect_to pages_url, notice: t("pages.sucess.destroy")
    end

    def activate
      @page.activate
      redirect_to @page
    end

    def publish
      @page.publish
      redirect_to pages_url
    end

    def unpublish
      @page.unpublish
      redirect_to pages_url
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def page_params
      params.require(:page).permit(:title, :text, :deleted_at, :created_by_id, :updated_by_id, :deleted_by_id)
    end

    def set_espace_current_user
      @espace_current_user = current_user
    end

  end
end
