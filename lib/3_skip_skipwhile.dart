Future<void> main() async {
  final interval = Duration(seconds: 2);
  var stream = Stream<int>.periodic(interval, callback);

  //*Skip
  //*Ele vai pular uma quantidade de vezes a partir do início
  //*da quantidade de dados no take
  //stream = stream.take(5).skip(2);

  //*SkipWhile
  //*Ele vai pular uma quantidade de vezes
  //*enquanto a condição for true 
  stream = stream.take(5).skipWhile((numero) {
    print('Número que chegou no skipWhile: $numero');
    return numero < 5;
  });

  print('Início');
  //*Await For
  await for (var i in stream) {
    print(i);
  }
  print('Fim');
}

int callback(int value) {
  print('O valor é: $value');
  return (value + 1) * 2;
}
