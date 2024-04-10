def solucao(arg)
  string = ""
  arg.each do |item|
    item.each do |i|
      string << i[1][0, 10].ljust(10)
    end
    string << "\n"
  end
  string
end

input = [
  {name: "Maria Neusa de Aparecida",
   cpf: "97905796671",
   state: "Sao Paulo",
   value: "1234"},
  {name: "Ricardo Fontes",
   cpf: "44010762900",
   state: "Rio Grande do Sul",
   value: "567"}
]

puts solucao(input)
