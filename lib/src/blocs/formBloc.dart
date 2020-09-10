import 'package:rxdart/rxdart.dart';
import 'package:web_form_git/src/blocs/validators.dart';

class FormBloc with Validators{

  BehaviorSubject _nameController = BehaviorSubject<String>();
  BehaviorSubject _idController = BehaviorSubject<String>();

  //sink
   set addName(String text) => _nameController.add(text);
   set addId(String text) => _idController.add(text);

  //stream
  Stream<String> get nameStream => _nameController.stream.transform(validateName);
  BehaviorSubject<String> get idStream => _idController.stream;

  //get
  String get nameValue => _nameController.value;
  String get idValue => _idController.value;

  dispose() {
    _nameController?.close();
    _idController?.close();
  }

}