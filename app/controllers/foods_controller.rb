class FoodsController < ApplicationController
  before_action :set_food, only: %i[show edit update destroy]
  before_action :find_user

  # GET /foods or /foods.json
  def index
    @foods = current_user.foods
  end

  # GET /foods/new
  def new
    @food = Food.new
    @food.user = current_user
  end

  # GET /foods/1/edit
  def edit; end

  # POST /foods or /foods.json
  def create
    @food = Food.new(food_params)
    @food.user = @user

    if @food.save
      redirect_to foods_url(current_user), notice: 'Food was successfully created.'
    else
      render :new, status: :unprocessable_entity

    end
  end

  # PATCH/PUT /foods/1 or /foods/1.json
  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to food_url(@food), notice: 'Food was successfully updated.' }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1 or /foods/1.json
  def destroy
    @food.destroy

    respond_to do |format|
      format.html { redirect_to foods_url, notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def find_user
    @user = current_user
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_food
    @food = Food.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity, :user_id)
  end
end
