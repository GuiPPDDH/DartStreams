Future<void> main() async {
  final interval = Duration(seconds: 2);
  var stream = Stream<int>.periodic(interval, callback);
  //*Take
  //stream = stream.take(5);
  //*TakeWhile
  stream = stream.takeWhile((int numero) {
    print('O número que chegou no takeWhile é: $numero');
    return numero <= 10;
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
