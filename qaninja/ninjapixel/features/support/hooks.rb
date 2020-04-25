
    Before do
        page.current_window.resize_to(1440, 900)
        @login_page = LoginPage.new
        @side = SideBar.new
    end
    
    Before("@auth") do
                
        @login_page.go_page
        @login_page.login("gabriel@ninjapixel.com", "pwd123" )
    end


    After do
        puts "Tudo que tiver antes desse bloco, roda depois do teste."
    end