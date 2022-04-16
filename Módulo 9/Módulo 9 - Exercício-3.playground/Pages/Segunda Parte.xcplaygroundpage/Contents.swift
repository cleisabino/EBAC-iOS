import UIKit

class Empregado{
    var nome: String = ""
    var sobrenome: String = ""
    var dataNascimento: String = ""
    var cidadeNascimento: String = ""
    var funcao: String = ""
    var nomeCompleto: String {
        "\(nome) \(sobrenome)"
    }
    init(nome: String, sobrenome: String) {
        self.nome = nome
        self.sobrenome = sobrenome
    }
    
    func descricao() -> String {
        return "\(nomeCompleto), nascido em \(dataNascimento) na cidade de \(cidadeNascimento), oculpa a função de \(funcao)"
    }
}

var empregado1 = Empregado(nome: "Silvio", sobrenome: "Pereira da Silva")
empregado1.dataNascimento = "12/04/1988"
empregado1.cidadeNascimento = "Salvador"
empregado1.funcao = "Analista em Segurança de Redes"

print(empregado1.descricao())

var empregado2 = Empregado(nome: "Glauber", sobrenome: "Vieira")
empregado2 = empregado1

print(empregado2.descricao())

empregado1.funcao = "Analista de Sistema"

print(empregado2.descricao())

empregado2.cidadeNascimento = "Paulo Afonso"

print(empregado1.descricao())

//É possível identificar que as duas variáveis tem a mesma referência de memória.
