class GreetingsController < ApplicationController

  def index
    @greetings = Greeting.all.order(created_at: :desc)
    @greeting = Greeting.new
  end

  def create
    @greeting = Greeting.new(greeting_params)

    if request.xhr?
      @greeting.save
      # render plain: @greeting.note
      # render json: @greeting
      # render json: {'cool': 'awesome', 'greeting': @greeting.note }
      # render html: "<li>#{@greeting.note}</li>".html_safe
      # render partial: 'greeting'

      respond_to do |format|
        format.json { render json: @greeting }
        format.html { render html: "<li>#{@greeting.note}</li>".html_safe }
      end

    else

      if @greeting.save
        redirect_to greetings_path
      else
        @greetings = Greeting.all.order(created_at: :desc)
        render :index
      end

    end
  end

  private

  def greeting_params
    params.require(:greeting).permit(:note)
  end

end
