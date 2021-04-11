# Sobre o projeto:

O nome inicial do nosso projeto é "Projeto Centavo". Este nome vem de um projeto já existente e 
funcional "Projeto Agorá" (Agorá é o centavo do shekel israelense, NIS), que já foi implementado e 
bem sucedido em Israel.
Projeto Agorá é uma plataforma de "vendas" de objetos usados por um valor simbolico de uma Agorá 
(centavo). Na prática, as pessoas postam seus objetos, que ao invéz de serem jogados no lixo, são 
doados para quem se interessa, necessita e as vezes não tem a condição de comprar um novo. 
Resumindo, é um OLX de doações, que gostariamos de implementar aqui no Brasil, ou pelo menos 
na nossa comunidade FACENS. Segue link para apreciação: www.agora.co.il

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

/*
  ADICIONANDO OBJETO NO BANCO
  final category = ParseObject('Categories')
    ..set<String>('Title', 'Meias')
    ..set<int>('Position', 1);

    final response = await category.save();

    print(response.success);

    ALTERANDO OBJETO NO BANCO
    final category = ParseObject('Categories')
      ..objectId = 'bmPu8C1CBK'
      ..set<int>('Position', 3);

      final response = await category.save();

      print(response.success);

    EXCLUINDO OBJETO NO BANCO
    final category = ParseObject('Categories')
      ..objectId = 'bmPu8C1CBK';

      category.delete();

    LER UM OBJETO
    final response = await ParseObject('Categories').getObject('z7YDE8rQJm');
    if(response.success){
      print(response.result);
    }

  TRAZENDO TODOS OS OBJETOS DENTRO DE UMA CLASSE
  final response = await ParseObject('Categories').getAll();
  if(response.success) {
    for (final object in response.results) {
      print(object);
    }
  };

  RODANDO UMA QUERY
  final query = QueryBuilder(ParseObject('Categories'));
  query.whereEqualTo('Position', 2);

  final response = await query.query();

  if(response.success){
    print(response.result);
  }

  */
