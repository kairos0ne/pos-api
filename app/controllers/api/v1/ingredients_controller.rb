module Api
  module V1
    class IngredientsController < ApiController
        before_action :require_login
        before_action :set_ingredient, only: [:show, :update, :destroy]

        # GET /ingredients
        def index

          if params[:name]
            inventory = Inventory.find(params[:inventory_id])
            @ingredients = inventory.ingredient.where(name: params[:name])
          else 
            inventory = Inventory.find(params[:inventory_id])
            @ingredients = inventory.ingredient
          end


          render json: @ingredients
        end

        # GET /ingredients/1
        def show
          inventory = Inventory.find(params[:inventory_id])

          @ingredient = inventory.ingredient.find(params[:id])

          render json: @ingredient
        end

        # POST /ingredients
        def create
          @ingredient = Ingredient.new(ingredient_params)

          if @ingredient.save
            render json: @ingredient, status: :created
          else
            render json: @ingredient.errors, status: :unprocessable_entity
          end
        end

        # PATCH/PUT /ingredients/1
        def update
          if @ingredient.update(ingredient_params)
            render json: @ingredient
          else
            render json: @ingredient.errors, status: :unprocessable_entity
          end
        end

        # DELETE /ingredients/1
        def destroy
          @ingredient.destroy
        end

        private
          # Use callbacks to share common setup or constraints between actions.
          def set_ingredient
            @ingredient = Ingredient.find(params[:id])
          end

          # Only allow a trusted parameter "white list" through.
          def ingredient_params
            params.require(:ingredient).permit(:name, :description, :inventory_id)
          end
    end
  end
end