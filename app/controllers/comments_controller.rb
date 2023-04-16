class CommentsController < ApplicationController
  before_action :set_project
  before_action :set_comment, only: %i[show edit update destroy]

  def show
  end

  def new
    @comment = @project.comments.new
  end

  def edit
  end

  def create
    @comment = @project.comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to project_comment_url(@comment.project, @comment), notice: "Comment was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to project_comment_url(@comment.project, @comment), notice: "Comment was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to project_url(@comment.project), notice: "Comment was successfully destroyed." }
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_comment
    @comment = @project.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:project_id, :description)
  end
end
