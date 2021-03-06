

class ProductPage
    include Capybara::DSL

    def go_to_form
        find(".product-add").click
    end
    
    
    def create(product, producers)
        find("input[name = title]").set product["nome"]
        find("input[placeholder = Gategoria]").click
        sleep 2
        find(".el-select-dropdown__item", text: product["categoria"]).click
        find("input[name = price]").set product["preco"]
        input_producers(producers)
        find("textarea[name = description]").set product["descricao"]
        upload_image(product["imagem"])

        click_button "Cadastrar"
            
    end


    def get_tr(target)
        return find("table tbody tr", text: target)
    end 
    

    def alert
        return find(".alert").text
    end

    
    private
    
    def upload_image(image)
        rel_path = "features/support/images/" + image
        image_file = File.join(Dir.pwd, rel_path) 
        #O método "Dr.pwd" é um método que localiza o caminho onde se encontra a imagem,
        #independente da estrutua de arqiuivos do sistem operaciona
        
        Capybara.ignore_hidden_elements = false
        attach_file("upcover", image_file) #attach_file é uma método do capybara
        Capybara.ignore_hidden_elements = true
    end

    def input_producers(producers)
        procuders_element = find(".form-group .col-sm-12 .producers")
        
        producers.each do |p|
            procuders_element.set p["produtores"]
            procuders_element.send_keys :tab
        end
    end

end