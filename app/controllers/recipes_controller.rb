class RecipesController < ApplicationController
  def show
    id = params[:id]
    @recipe = Recipe.find(id)
  end

  def new
    @recipe = Recipe.new
  end

  def create

    recipe_params = params.require(:recipe).permit(:title, :recipe_type_id, :cuisine_id,
                                                  :cook_time, :ingredients, :method,
                                                  :difficulty)

    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to @recipe
    else
      flash[:error] = "Você deve informar todos os dados da receita"
      render :new
      end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    id = params[:id]
    update_recipe_params = params.require(:recipe).permit(:title, :recipe_type_id, :cuisine_id,
                                                  :cook_time, :ingredients, :method,
                                                  :difficulty)

    recipe = Recipe.find(id)
    recipe.update(update_recipe_params)

    redirect_to recipe

  end
end
