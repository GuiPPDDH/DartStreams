Future<void> main() async {
  final interval = Duration(seconds: 2);
  var stream = Stream<int>.periodic(interval, callback);
  stream = stream.take(5);

  print('Início');
  final data = await stream.toList();
  print(data);
  print('Fim');
}

int callback(int value) {
  print('O valor é: $value');
  return (value + 1) * 2;
}
