Future<void> main() async {
  final interval = Duration(seconds: 2);
  var stream = Stream<int>.periodic(interval, callback);
  stream = stream.asBroadcastStream();

  print('Início');
  stream.listen((numero) {
    print('Listen 1 value: $numero');
  });
  stream.listen((numero) {
    print('Listen 2 value: $numero');
  });
  print('Fim');
}

int callback(int value) {
  print('O valor é: $value');
  return (value + 1) * 2;
}
