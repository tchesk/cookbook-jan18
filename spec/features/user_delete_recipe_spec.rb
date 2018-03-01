require 'rails_helper'

feature 'user delete a recipe' do

  scenario  'successfully' do

  #criar dados
  cuisine = Cuisine.create(name:'brasileira')
  recipe_type = RecipeType.create(name:'Janta')
  recipe = Recipe.create(title:'Moqueca', difficulty: 'Médio', cook_time:45,
    ingredients:"Peixe, tomate, cebola, pimentão, azeite de dendê, batata,
    leite de coco e ovos ", method: "Pocisionar os vegetais no fundo da panela
    logo acima colocar o peixe, depois despejar
    leite de coco e por ultimo azeite de dendê",
    cuisine_id: cuisine.id, recipe_type: recipe_type)

  #simulação de navegação
  visit root_path
  click_on recipe.title
  click_on 'Deletar'

  expect(current_path).to eq(root_path)
  end

end
