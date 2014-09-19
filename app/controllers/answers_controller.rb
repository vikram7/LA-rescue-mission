class AnswersController < ApplicationController

  def new
    binding.pry
    @question_id = params[:format]
    @question = Question.find(@question_id)
    @answer = Answer.new
  end

  def create
    binding.pry
    @answer = Answer.create(answer_params)
     if @answer.save
      flash[:notice] = "Added question"
      redirect_to question_path
    else
      flash[:notice] = "Sorry, you need at least 40 character title and 150 character description"
      redirect_to question_path
    end
  end

  def answer_params
    params.require(:answer).permit(:description, :question_id)
  end

end
