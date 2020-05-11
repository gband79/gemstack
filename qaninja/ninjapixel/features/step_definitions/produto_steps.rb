

Dado("que eu tenho o seguinte produto:") do |table|
    # table is a Cucumber::MultilineArgument::DataTable
    @product_table = table.hashes.first
    puts @product_table["nome"]
    puts @product_table["categoria"]
    puts @product_table["preco"]
    puts @product_table["descricao"]

    DataBase.new.delete_product(@product_table["nome"])
end

Dado("os produtores são:") do |table|
    @producers = table.hashes
end

Dado("este item já foi cadastrado") do
    steps %(
    Quando eu faço o cadastro desse item 
    ) #Dinamic step "steps %()"" que utiliza uma especificão já impplementada de outro cenário
end
  
Quando("eu faço o cadastro desse item") do
    @product.go_to_form
    @product.create(@product_table, @producers)
    sleep 5
end
  
Entao("devo ver este item na lista de produtos") do
    tr = @product.get_tr(@product_table["nome"])
    expect(tr).to have_text @product_table["categoria"]
    expect(tr).to have_text @product_table["preco"]
end

Entao("devo ver notificação {string}") do |expected_notice|
   expect(@product.alert).to eql expected_notice
end
