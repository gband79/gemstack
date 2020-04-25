
class LoginPage
    include Capybara::DSL

    def go_page
        visit "http://pixel-web:3000/login"
    end

    def login(email, password)
        find("input[name=email]").set email
        find("input[name=password]").set password
        click_button "Entrar"
    end

    def alert
        return find(".alert").text
    end
end