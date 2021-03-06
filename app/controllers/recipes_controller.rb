class RecipesController < ApplicationController

  MAX_RECIPES_PER_PAGE = 12

  def index
    search_term = params[:search]
    recipes = EdamamApiWrapper.list_recipes(search_term)
    if recipes
      @recipes = Kaminari.paginate_array(recipes).page(params[:page]).per(MAX_RECIPES_PER_PAGE)
    end
  end

  def show
    @recipe = EdamamApiWrapper.show_recipe(params[:id])
    head :bad_request unless @recipe
  end

end
