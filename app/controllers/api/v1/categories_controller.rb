module Api
  module V1
    class CategoriesController < ApiController
      before_action :require_login
      before_action :set_category, only: [:show, :update, :destroy]


      # GET /categories
      def index
        if params[:name]
          @categories = Category.where(name: params[:name])
        else 
          @categories = Category.all
        end
        render json: @categories
      end

      # GET /categories/1
      def show
        render json: @category
      end

      # POST /categories
      def create
        @category = Category.new(category_params)

        if @category.save
          render json: @category, status: :created
        else
          render json: @category.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /categories/1
      def update
        if @category.update(category_params)
          render json: @category
        else
          render json: @category.errors, status: :unprocessable_entity
        end
      end

      # DELETE /categories/1
      def destroy
        @category.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_category
          @category = Category.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def category_params
          params.require(:category).permit(:name, :description, :photo_path, :icon_path)
        end
    end
  end
end