require 'rails_helper'

feature 'User edit recipe' do
  scenario 'successfully' do
    # cria os dados
    RecipeType.create(name: 'Janta')
    recipe_type = RecipeType.create(name: 'Petisco')
    Cuisine.create(name: 'Chinesa' )
    cuisine = Cuisine.create(name: 'Australiana')
    recipe = Recipe.create(title:'Yakisoba', difficulty:'Fácil', cook_time: 30,
                    ingredients:'Avocado, tomate, cebola, pimeta, manjericão',
                    method:'picar todos os ingredientes e misturar',
                    recipe_type: recipe_type, cuisine_id:cuisine.id)
    #simula a ação usuário
    visit root_path
    click_on 'Yakisoba'
    click_on 'Editar'

    fill_in 'Título', with:'Yakisoba'
    fill_in 'Dificuldade', with: 'Médio'
    fill_in 'Tempo de Preparo', with: '60'
    fill_in 'Ingredientes', with: 'Macarrão, carne, vegetais, shoyu'
    fill_in 'Como Preparar', with: 'Cortar os vegetais e carne, separar e ferver o macarrão, colocar o molho shoyu e misturar'
    select  'Chinesa', from: 'Cozinha'
    select 'Janta', from: 'Tipo da Receita'

    click_on 'Enviar'
    #expectativa
    expect(current_path).to eq(recipe_path(recipe.id))
    expect(page).to have_css('h1', text: 'Yakisoba')
    expect(page).to have_css('p', text: 'Médio')
    expect(page).to have_css('p', text: '60 minutos')
    expect(page).to have_css('p', text: 'Macarrão, carne, vegetais, shoyu')
    expect(page).to have_css('p', text: 'Cortar os vegetais e carne, separar e ferver o macarrão, colocar o molho shoyu e misturar')
    expect(page).to have_css('p', text: 'Chinesa')
    expect(page).to have_css('p', text: 'Janta')

  end
end
