Future<void> main() async {
  final interval = Duration(seconds: 2);
  var stream = Stream<int>.periodic(interval, callback);
  stream = stream.where((numero) => numero % 6 == 0).take(3);

  print('Início');
  stream.listen((numero) {
    print('Listen value: $numero');
  });
  print('Fim');
}

int callback(int value) {
  print('No callback, o valor que chegou é: $value');
  return (value + 1) * 2;
}
