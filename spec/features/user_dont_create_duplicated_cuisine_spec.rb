require 'rails_helper'

feature "User don't create duplicated cuisine" do
  scenario 'successfully' do
    #criar dados
    cuisine = Cuisine.create(name: 'Chilena')

    #simulação da navegação
    visit root_path
    click_on 'Cadastrar Cozinha'
    fill_in 'Nome', with: 'Chilena'
    click_on 'Enviar'
    #expectativa final
    expect(page).to have_content("Name já foi utilizada")
  end
end
