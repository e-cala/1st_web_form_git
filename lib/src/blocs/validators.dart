import 'dart:async';

mixin Validators {
  final validateName = StreamTransformer<String, String>.fromHandlers(
    handleData: (name, sink) {
      sink.add(name.replaceAll('a', '*'));
    },
  );
}

