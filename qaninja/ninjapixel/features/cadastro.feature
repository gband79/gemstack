            #language: pt

Funcionalidade: Cadastro de produtos
    Sendo um administrador de catálogo
    Posso cadastrar um novo produto
    Para que eu possa disponibilizar produtos no catálogo

    @auth    
    Cenário: Novo produto

        Dado que eu tenho o seguinte produto:
            | nome        | categoria      | preco | produtores | descricao               |
            | Donkey Kong | Super Nintendo | 49.99 | Konami     | Um jogo muito divertido |
        Quando eu faço o cadastro desse item
        Entao devo ver este item na lista de produtos