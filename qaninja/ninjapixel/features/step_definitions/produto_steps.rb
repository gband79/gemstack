

Dado("que eu tenho o seguinte produto:") do |table|
    # table is a Cucumber::MultilineArgument::DataTable
    puts table.hashes
end
  
Quando("eu faço o cadastro desse item") do
    find(".product-add").click
end
  
Entao("devo ver este item na lista de produtos") do
    pending # Write code here that turns the phrase above into concrete actions
end