class QuizzesController < ApplicationController
    before_action :set_course
    before_action :set_quiz, only: %i[show edit update destroy]
  
    def new
      @quiz = @course.quizzes.build
    end
  
    def create
      @quiz = @course.quizzes.build(quiz_params)
      if @quiz.save
        redirect_to [@course, @quiz], notice: 'Quiz criado com sucesso.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @quiz.update(quiz_params)
        redirect_to [@course, @quiz], notice: 'Quiz atualizado com sucesso.'
      else
        render :edit
      end
    end
  
    def destroy
      @quiz.destroy
      redirect_to course_path(@course), notice: 'Quiz deletado com sucesso.'
    end
  
    def show
    end
  
    private
  
    def set_course
      @course = Course.find(params[:course_id])
    end
  
    def set_quiz
      @quiz = @course.quizzes.find(params[:id])
    end
  
    def quiz_params
      params.require(:quiz).permit(:question, :answer)
    end
  end
  