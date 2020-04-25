

Dado("que acesso à página principal") do
    @login_page.go_page
end
  
Quando("eu submeto minhas credenciais {string} e {string}") do |email, password|
    @login_page.login(email, password)
end
  
Então("devo ser autenticado") do
    expect(@side.logged_user).to eql "Gabriel"
end
  
Então("devo ver uma mensagem de alerta {string}") do |expect_alert|
    expect(@login_page.alert).to eql expect_alert
end

