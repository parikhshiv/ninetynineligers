class LigersController < ApplicationController
  def index
    @ligers = Liger.all
    render :index
  end

  def show
    @liger = Liger.find(params[:id])
    @liger_rental_requests = @liger.liger_rental_requests
    @columns = {
      name: @liger.name,
      age: @liger.age,
      color: @liger.color,
      sex: @liger.sex,
      description: @liger.description
    }
    render :show
  end

  def new
    @liger = Liger.new
    render :new
  end

  def create
    @liger = Liger.new(liger_params)
    if @liger.save
      redirect_to liger_url(@liger)
    else
      render :new
    end
  end

  def edit
    @liger = Liger.find(params[:id])
    render :edit
  end

  def update
    @liger = Liger.find(params[:id])
    if @liger.update(liger_params)
      redirect_to liger_url(@liger)
    else
      render :edit
    end
  end

  private

  def liger_params
    params.require(:liger).permit(:name, :birth_date, :color, :age, :sex, :description)
  end

end
