class Api::V1::AnswersController < Api::ApplicationController
    before_action :authenticate_user!
  
    def destroy
      answer = Answer.find params[:id]
      answer.destroy
  
      render json: { status: 200 }, status: 200
    end

    def create
      @question = Question.find params[:question_id]
      answer = Answer.new answer_params
      answer.user = current_user
      answer.question = @question
      answer.save!
      render json: {id: answer.id}
    end

    private
    def answer_params
      params.require(:answer).permit(:body)
    end
end
