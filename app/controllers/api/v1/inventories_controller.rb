module Api
  module V1
    class InventoriesController < ApiController
      before_action :require_login
      before_action :set_inventory, only: [:show, :update, :destroy]

      # GET categories/:id/inventories
      def index

        if params[:name]
          category = Category.find(params[:category_id])
          @inventories = category.inventory.where(name: params[:name])
        else
          category = Category.find(params[:category_id])
          @inventories = category.inventory
        end

        render json: @inventories
      end

      # GET categories/:id/inventories/:id
      def show

        category = Category.find(params[:category_id])

        @inventory = category.inventory.find(params[:id])
        
        render json: @inventory
      end

      # POST /inventories
      def create
        @inventory = Inventory.new(inventory_params)

        if @inventory.save
          render json: @inventory, status: :created
        else
          render json: @inventory.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /inventories/1
      def update
        if @inventory.update(inventory_params)
          render json: @inventory
        else
          render json: @inventory.errors, status: :unprocessable_entity
        end
      end

      # DELETE /inventories/1
      def destroy
        @inventory.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_inventory
          @inventory = Inventory.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def inventory_params
          params.require(:inventory).permit(:name, :description, :base_price, :retail_price, :category_id)
        end
    end
  end
end