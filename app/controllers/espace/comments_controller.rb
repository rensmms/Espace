require_dependency "espace/application_controller"

module Espace
  class CommentsController < ApplicationController
    def create
      @page = Page.find(params[:page_id])
      @comment = @page.comments.create(comment_params.merge(created_by_id: current_user.id))
      flash[:notice] = t("comments.create")
      redirect_to @page
    end

    private
    def comment_params
      params.require(:comment).permit(:text)
    end
  end
end