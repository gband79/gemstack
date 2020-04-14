Dado("que acesso à página principal") do
    visit "http://pixel-web:3000/login"
    page.current_window.resize_to(1440, 900)
    #Launchy.open("http://pixel-web:3000/login")
end
  
Quando("eu submeto minhas credenciais {string} e {string}") do |email, password|
    # O hashtag é para buscar o elemento pelo ID
    find("#emailId").set email
    find("input[name='password']").set password
    click_button "Entrar"
end
  
Então("devo ser autenticado") do
    logged_user = find(".user .info span").text
    expect(logged_user).to eq("Gabriel")
end

Quando("eu submeto minhas credenciais {string} e com senha {string} inválida") do |email, invalidPass|
    find("#emailId").set email
    find("input[name='password']").set invalidPass
    click_button "Entrar"
end
  
  Então("devo ver uma mensagem de alerta {string}") do |alertMsg|
    alert = find(".card-body .alert-danger span b").text
    expect(alert).to eq(alertMsg)
end