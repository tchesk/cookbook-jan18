class RecipeTypesController < ApplicationController
  def show
    id = params[:id]
    @recipe_type = RecipeType.find(id)
    @recipes = @recipe_type.recipes.all
  end
end
