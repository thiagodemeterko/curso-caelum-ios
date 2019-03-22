//: Conhecendo a linguagem Swift

// Constantes X Variáveis
let numero1: Int = 10
let numero2: Double = 5.2
var soma: Double

// Linguagem tipada
// ERRO
//soma=numero1+numero2
soma = Double(numero1) + numero2

// Strings
var nome:String = "Carlos"

// Concatenação 
nome += " Savi"
print("O nome completo é \(nome)")

// Interpolação
let nome1:String = "Steve Jobs"
let idade: Int = 61
let nomeIdade: String = "Se \(nome1) estivesse vivo hoje, teria \(idade) anos"
//print(nomeIdade)
// ou
print("Se \(nome) estivesse vivo hoje, teria \(idade) anos")

/*
 Tuplas - Uma das novidades da linguagm Swift. Elas agrupam múltiplos valores em um único elemento.
 Os valores podem ser de qualquer tipo de dados
 */

let http404Error = (404, "Not Found")
// http404Error é do tipo (Int, String)

// Como exibir as informações?
// 1 - Por decomposição
let (statusCode, statusMessage) = http404Error
print("O código de erro é \(statusCode)")
print("A mensagem de erro é \(statusMessage)")

// 2 - Exibir pelo índice
print("O código de erro é \(http404Error.0)")
print("A mensagem de erro é \(http404Error.1)")

/*
 Comparações em Swift - Linguagem segura
 */
let valor1 = 10
let valor2 = 20
// ERRO: if valor1 = valor2 {
if valor1 == valor2 {
    print("Valores iguais!")
} else {
    print("Valores diferentes!")
}

// C-Style removed in Swift 3
//for i=0; i>10; i++ {
//    print(i)
//}

/*
 Funções em Swift
 */

// Sintaxe completa - função com parâmetros e valor de retorno
func sayHello(nomePessoa: String) -> String {
    let greeting = "Olá, " + nomePessoa + "!"
    return greeting
    // OTIMIZANDO: return "Olá, " + nomePessoa + "!"
}

// Chamando a função
let resposta = sayHello(nomePessoa: "Carlos")
print(resposta)

// Omitindo o nome dos parâmetro
// SINTAXE NORMAL: func sayName(firstName: String, lastName: String) {
func sayName(_ firstName:String, lastName:String) {
    print("Name: \(firstName) + \(lastName)")
}

// Chamando a função
// SINTAXE NORMAL: sayName("Carlos", lastName: "Savi")
sayName("Carlos", lastName: " Savi")

/*
 Classes em Swift (Orientação a Objetos)
 */
class MyClass {
    func mostrarNoConsole(texto: String) {
        print(texto)
    }
}

let myClass = MyClass()
myClass.mostrarNoConsole(texto: "Hello World")

/*
 Conceito de Optional - para evitar quebra do app por valores nulos
 */

// Inicialmente, veremos um código sem proteção, onde a finalidade é converter uma string para um inteiro e efetuar um cálculo com esse número
let possivelNumero = "123"
var numeroConvertido = Int(possivelNumero)
// numeroConvertido é inferido para um tipo de dados "Int"

// INSTRUTOR: Coloque um número inválido em possivelNumero, e veja como o app irá quebrar na instrução abaixo

// Efetuar um cálculo com o número convertido
var numeroCalculado = numeroConvertido! + 10

// Verificar se a variável tem valor nulo - modo reativo, não é o ideal
//if numeroCalculado != nil {
//    print("O valor de variável convertida é \(numeroCalculado)")
//} else {
//    print("Não foi possível converter o valor \(possivelNumero) para um número inteiro")
//}

// Na Swift, a verificação de ausência de valor é validada no momento da conversão
//  Solução pró-ativa e mais sustentável

// O nome do recurso é Optional Binding
if var numeroReal = Int(possivelNumero) {
    print("O valor de variável convertida é \(numeroReal)")
    numeroReal += 10
} else {
    print("Não foi possível converter o valor \(possivelNumero) para um número inteiro")
}

// Arrays
var contatos:Array<String> = ["Batman", "Robin", "Alfred"]

contatos.append("Coringa")
contatos.remove(at: 3)

for contato in contatos {
    print(contato)
}


