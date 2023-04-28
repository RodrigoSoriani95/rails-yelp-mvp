class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show update edit destroy]

  def index
    @restaurants = Restaurant.all
  end

  # GET /restaurants/1
  def show
    @review = Review.new
  end

  # def chef
  # end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants
  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
       # indica para renderizar a view "new" e usar o status
       # "unprocessable_entity" que representa um erro no processamento
       # de uma requisição.
    end
  end

  # PATCH/PUT /restaurants/1
  def update
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant, notice: "Restaurant was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /restaurants/1
  def destroy
    @restaurant.destroy
    redirect_to restaurants_url, notice: "Restaurant was successfully destroyed."
  end

   private
    # serve para refatorar um codigo utilizado varias vezes no
    # before_action

    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :address, :phone_number, :category)
    end
end
