# Desafio: a Lodjinha 

Seguindo o guia de programação criado para o desafio

Mais informações sobre o teste [Teste](https://github.com/jjfernandes87/challenge-ios/blob/master/TESTE.md). 

### Osbervações sobre o projeto

###### Funcionalidade 03
Exibir uma lista dos produtos mais vendidos. A lista possui um número fixo de produtos e não há necessidade de scroll infinito. Ao clicar em um produto, o usuário deve ser direcionado à Funcionalidade 05.

No Swagger não existe paginação e como o número de itens é grande eu deixei com scroll a home

## Arquitetura

Para esse projeto foi usado o VIPER, dessa forma posso trabalhar com modulos e reaproveitar o máximo de código.

Definição de pastas ficou:
- Modules
    - Home
    - About
    - Product
        - Collection
        - Detail
- Utils
- Resources

## Testes

Para esse projeto foi usado o Quick & Nimble para os testes unitários e o XCUITest para os de interface

Alem disso estou usando fastlane Snapshot 

## Frameworks
	
###### Externos:
- pod 'Alamofire'
- pod 'AlamofireImage', '~> 3.5'
- pod 'Quick'
- pod 'Nimble'

###### Internos:

Estou usando algumas libs próprias porem por conta da regra de iOS9 não foi possivel deixá-la nos pods e trouxe para dentro do projeto

- SelfTableViewManager - Mais informações [SelfTableViewManager](https://github.com/jjfernandes87/SelfTableViewManager). 

## Como executar

Primeiro de tudo, você precisa instalar o Bundler. O Bundler fará com que todos os desenvolvedores que trabalham no projeto usem as mesmas versões de serviços como Cocoapods e Fastlane.

Abra um Terminal e instale o Bundler usando o comando:

```
gem install bundler
```

Para executar o aplicativo, execute os seguintes comandos:

```
bundle install
```

O último comando instalará todas as dependências necessárias para executar o aplicativo, como Cocoapods e Fastlane. Em seguida, execute o seguinte comando para instalar as dependências do Cocoapods:

```
bundle exec pod install
```

## Como testar

Se você quiser executar testes localmente, basta usar Fastlane:

```
bundle exec fastlane tests
```

Se você quiser ver a cobertura de teste

```
bundle exec fastlane coverage
```

Se você quiser ver as imagens

```
bundle exec fastlane screenshots
```