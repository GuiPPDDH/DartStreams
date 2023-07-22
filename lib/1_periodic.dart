Future<void> main() async {
  final interval = Duration(seconds: 2);
  final stream = Stream<int>.periodic(interval, callback);

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
