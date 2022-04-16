//: [Previous](@previous)

import Foundation

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

var empregado1 = Empregado(nome: "Clei Sabino", sobrenome: "Gomes")
empregado1.dataNascimento = "25/06/1988"
empregado1.cidadeNascimento = "Salvador"
empregado1.funcao = "Analista de Sistema"

print(empregado1.descricao())
