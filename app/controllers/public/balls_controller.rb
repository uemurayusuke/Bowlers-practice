class Public::BallsController < ApplicationController
  def index
  end



def new
    @ball = Ball.new
end

  def create
    @ball = Ball.new(ball_params)
    @ball.user_id = current_user.id
    if @ball.save
      flash[:notice] = "投稿が完了しました"
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def show
  end

  def destroy
  end


private

  def ball_params
    params.require(:ball).permit(:maker, :name, :caption)
  end

end
