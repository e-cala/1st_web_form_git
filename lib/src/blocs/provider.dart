import 'package:flutter/cupertino.dart';
import 'package:web_form_git/src/blocs/formBloc.dart';


class Provider extends InheritedWidget {
  Provider({Key key, Widget child}) : super(key: key, child: child);

  final _formBloc = FormBloc();

  static FormBloc of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<Provider>()._formBloc;

  @override
  bool updateShouldNotify(Provider oldWidget) => true;
  
}
