            #language: pt

            Funcionalidade: Cadastro de produtos
            Sendo um administrador de catálogo
            Posso cadastrar um novo produto
            Para que eu possa disponibilizar produtos no catálogo

            @auth
            Cenário: Novo produto

            Dado que eu tenho o seguinte produto:
            | nome        | categoria      | preco | descricao               | imagem          |
            | Donkey Kong | Super Nintendo | 49.99 | Um jogo muito divertido | donkey-kong.jpg |
            E os produtores são:
            | produtores |
            | Konami     |
            | Nintendo   |
            Quando eu faço o cadastro desse item
            Entao devo ver este item na lista de produtos

            @auth @doing
            Cenário: Produto Duplicado
            O gestor de catálogo tenta cadastrar um produto, porém o mesmo
            já foi cadastrado em outro momento, portanto o sistem
            deve notificar o usuário informado que o produto já existe.
            
            Dado que eu tenho o seguinte produto:
            | nome       | categoria  | preco | descricao              | imagem         |
            | Golden Axe | Mega Drive | 39.99 | Um clássico top demais | golden-axe.jpg |
            E os produtores são:
            | produtores |
            | Sega       |
            Mas este item já foi cadastrado
            Quando eu faço o cadastro desse item
            Entao devo ver notificação "Oops - Este produto já foi cadastrado!"