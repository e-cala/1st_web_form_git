import 'package:rxdart/rxdart.dart';

class FormBloc{

  BehaviorSubject _nameController = BehaviorSubject<String>();
  BehaviorSubject _idController = BehaviorSubject<String>();

  //sink
   set addName(String text) => _nameController.add(text);
   set addId(String text) => _idController.add(text);

  //stream
  BehaviorSubject<String> get nameStream => _nameController.stream;
  BehaviorSubject<String> get idStream => _idController.stream;

  //get
  get nameValue => _nameController.value;
  get idValue => _idController.value;

  dispose() {
    _nameController?.close();
    _idController?.close();
  }

}