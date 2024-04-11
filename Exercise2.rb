require "yaml"

input = [
  {
    name: "Maria Neusa de Aparecida",
    cpf: "97905796671",
    state: "Sao Paulo",
    value: "1234"
  },
  {name: "Ricardo Fontes",
   cpf: "44010762900",
   state: "Rio Grande do Sul",
   value: "567"}
]

class UserData
  attr_reader :config
  attr_reader :data

  def initialize(data)
    @data = data
    @config = change_config(YAML.load_file("format-2.yaml"))
  end

  def change_config(config_data)
    config_data.each_pair do |key, value|
      value["align"] = (value["align"] == "left") ? :ljust : :rjust
      value["padding"] = (value["padding"] == "spaces") ? " " : "0"
    end
  end

  def formated
    string = ""
    @data.each do |i, index|
      string << i[:cpf][0, config["cpf"]["length"]].send(config["cpf"]["align"], config["cpf"]["length"], config["cpf"]["padding"])
      string << i[:name][0, config["name"]["length"]].send(config["name"]["align"], config["name"]["length"], config["name"]["padding"]) if config.key?("name")
      string << i[:value][0, config["value"]["length"]].send(config["value"]["align"], config["value"]["length"], config["value"]["padding"])
      string << i[:state][0, config["state"]["length"]].send(config["state"]["align"], config["state"]["length"], config["state"]["padding"]) if config.key?("state")
      string << "\n"
    end
    string
  end
end

user = UserData.new(input)

puts user.formated
