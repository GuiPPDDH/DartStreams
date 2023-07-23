Future<void> main() async {
  final interval = Duration(seconds: 2);
  var stream = Stream<int>.periodic(interval, callback);
  stream = stream.take(10);

  print('Início');
  stream.listen((numero) {
    print('Listen value: $numero');
  });
  print('Fim');
}

int callback(int value) {
  print('O valor é: $value');
  return (value + 1) * 2;
}
