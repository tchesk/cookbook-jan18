class RecipesController < ApplicationController
  def show
    id = params[:id]
    @recipe = Recipe.find(id)
  end

  def new
    @recipe = Recipe.new
    @recipe_types = RecipeType.all
    @cuisines = Cuisine.all
  end

  def create

    recipe_params = params.require(:recipe).permit(:title, :recipe_type_id, :cuisine_id,
                                                  :cook_time, :ingredients, :method,
                                                  :difficulty)

    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to @recipe
    else
      @recipe_types = RecipeType.all
      @cuisines = Cuisine.all
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

    @recipe = Recipe.find(id)


    if @recipe.update(update_recipe_params)
      redirect_to @recipe
    else
      flash[:error] = 'Todos os campos devem estar preenchidos'
      render :edit
    end

  end

  def destroy
   @recipe = Recipe.find(params[:id])
   @recipe.destroy
   redirect_to root_path
  end

end
