class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order(updated_at: :desc)
    @question = Question.new
  end

  def create
    @question = Question.create(question_params)
    if @question.save
      flash[:notice] = "Added question"
      redirect_to questions_path
    else
      @questions = Question.all
      flash[:notice] = "Sorry, you need at least 40 character title and 150 character description"
      render :index
    end
  end

  def show
    @question = Question.find(params[:id])
    @answers = Answer.where(question_id: params[:id])
  end

  private

  def question_params
    params.require(:question).permit(:title, :description)
  end
end
