class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show edit update destroy created]

  def show
  end

  def new
    @project = Project.find(params[:project_id])
    @comment = Comment.new
  end

  def created
    @project = Project.find(params[:project_id])
  end

  def edit
  end

  def create
    @project = Project.find(params[:project_id])
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.valid? && @project.entries.create(entryable: @comment)
        format.html { redirect_to created_project_comment_url(@project, @comment), notice: "Comment was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to comment_url(@comment), notice: "Comment was successfully updated." }
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


  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:project_id, :description)
  end
end
