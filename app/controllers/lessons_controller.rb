class LessonsController < ApplicationController
    before_action :set_course
    before_action :set_lesson, only: %i[show edit update destroy]
  
    def new
      @lesson = @course.lessons.build
    end
  
    def create
      @lesson = @course.lessons.build(lesson_params)
      if @lesson.save
        redirect_to [@course, @lesson], notice: 'Tarefa criada com sucesso.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @lesson.update(lesson_params)
        redirect_to [@course, @lesson], notice: 'Tarefa atualizada com sucesso.'
      else
        render :edit
      end
    end
  
    def destroy
      @lesson.destroy
      redirect_to course_path(@course), notice: 'Tarefa deletada com sucesso.'
    end
  
    def show
    end
  
    private
  
    def set_course
      @course = Course.find(params[:course_id])
    end
  
    def set_lesson
      @lesson = @course.lessons.find(params[:id])
    end
  
    def lesson_params
      params.require(:lesson).permit(:title, :content)
    end
  end
  