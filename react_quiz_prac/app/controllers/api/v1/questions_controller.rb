class Api::V1::QuestionsController < Api::ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
  

    def index
        # nil.my_method_that_doesnt_exist
        questions = Question.order(created_at: :desc)
        render(
            json: questions,
            each_serializer: QuestionSerializer
        )
    end

    def show
        render(
          json: question,
          # When using ActiveModelSerializer, it will
          # automatically including nested associations
          # in the generated JSON. It does this for
          # perfomance reasons.
    
          # To include a nested association, we must
          # tell Rails to do so using the "include"
          # argument in the "render" method.
    
          # In the below, we specify that the "author"
          # associate is included. We also specify
          # the "answer" association and the "answer's
          # authors" are included as well.
          include: [ :author, { answers: [ :author ]}]
        )
    end

    # def create
    #     # render json: params
    #     question = Question.new question_params
    #     question.user = current_user
    #     if question.save
    #         render json: { id: question.id }
    #     else
    #         render(
    #             json: { errors: question.errors },
    #             status: 422 # Unprocessable Entity
    #         )
    #     end
    # end


    def create
        question = Question.new question_params
        question.user = current_user
    
        question.save!
        render json: { id: question.id }
        # else
        #   render(
        #     json: { errors: question.errors },
        #     status: 422 # Unprocessable Entity
        #   )
        # end
    end


    def destroy
        question.destroy
        render(json: {status: 200}, status: 200)
    end

    def update

        if question.update(question_params)
            render json: { id: question.id }
        # else
            # render :edit
        end
    end
    
    private
    def question
        @question ||= Question.find params[:id]
    end

    def question_params
        params.require(:question).permit(:title, :body)
    end

end
