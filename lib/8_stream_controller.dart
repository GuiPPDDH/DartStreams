import 'dart:async';

Future<void> main() async {
  final streamController = StreamController<int>.broadcast();
  final inStream = streamController.sink;
  final outStream = streamController.stream;

  print('Início da Stream Controller');
  outStream
      .skip(1)
      .where((numero) => numero % 2 == 0)
      .map((numero) => 'O valor par enviado é: $numero')
      .listen((stringConvertida) {
    print('String recebida');
    print(stringConvertida);
  });

  var numeros = List.generate(20, (index) => index);
  for (var numero in numeros) {
    print('Enviando número $numero');
    inStream.add(numero);
    //*streamController.add também funciona da mesma forma que o inStream.add,
    //*Mas como boa pratica, é melhor criar como inStream
    //streamController.add(numero);
    await Future.delayed(Duration(milliseconds: 500));
  }
  print('Fim da Stream Controller');
  await streamController.close();
}
