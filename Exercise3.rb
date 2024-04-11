require "yaml"

def solucao(string)
  config = YAML.load_file("format-1.yaml")
  ret = {}

  ret[:cpf] = string.slice!(0, config["cpf"]["length"])
  ret[:name] = string.slice!(0, config["name"]["length"])
  ret[:value] = string.slice!(0, config["value"]["length"]).sub(/\A0+/, "")

  ret
end

p solucao("97905796671Maria Neusa de00001234")
p solucao("44010762900Ricardo Fontes00000567")
