class GreetingsController < ApplicationController

  def index
    @greetings = Greeting.all.order(created_at: :desc)
    @greeting = Greeting.new
  end

  def create
    @greeting = Greeting.new(greeting_params)
    if @greeting.save
      redirect_to greetings_path
    else
      @greetings = Greeting.all.order(created_at: :desc)
      render :index
    end
  end

  private

  def greeting_params
    params.require(:greeting).permit(:note)
  end

end
