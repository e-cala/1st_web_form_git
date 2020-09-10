import 'package:flutter/material.dart';
import 'package:web_form_git/src/blocs/formBloc.dart';
import 'package:web_form_git/src/blocs/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of(context);
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          children: [
            LeftSide(constraints: constraints, formKey: _formKey, bloc: _bloc),
            RightSide(constraints: constraints, bloc: _bloc),
          ],
        );
      }),
    );
  }
}

class RightSide extends StatelessWidget {
  const RightSide({
    Key key,
    @required FormBloc bloc,
    @required BoxConstraints constraints,
  })  : constraints = constraints,
        _bloc = bloc,
        super(key: key);

  final FormBloc _bloc;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.blue,
        child: Padding(
          padding: EdgeInsets.all(constraints.maxWidth * 0.05),
          child: Column(children: [
            Text('Los datos son:',
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: constraints.maxHeight * 0.1),
            StreamBuilder<String>(
                stream: _bloc.nameStream,
                builder: (context, snapshot) => snapshot.data == null
                    ? Text('Name: <no name>')
                    : Text('Name: ${snapshot.data.toUpperCase()}')),
            SizedBox(height: constraints.maxHeight * 0.1),
            StreamBuilder<String>(
                stream: _bloc.idStream,
                builder: (context, snapshot) => snapshot.data == null
                    ? Text('Id: <nod id>')
                    : Text('Id: ${snapshot.data.toUpperCase()}')),
          ]),
        ),
      ),
    );
  }
}

class LeftSide extends StatelessWidget {
  const LeftSide({
    Key key,
    @required GlobalKey<FormState> formKey,
    @required FormBloc bloc,
    @required BoxConstraints constraints,
  })  : constraints = constraints,
        _formKey = formKey,
        _bloc = bloc,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final FormBloc _bloc;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        height: constraints.maxHeight,
        width: constraints.maxWidth,
        color: Colors.white70,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(constraints.maxWidth * 0.05),
              child: Center(
                child: Text(
                  'Container',
                  style: TextStyle(color: Colors.blueAccent, fontSize: 24),
                ),
              ),
            ),
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.2),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (val) => _bloc.addName = val,
                      validator: (val) => val.isEmpty ? 'Invalid Name' : null,
                      decoration:
                          InputDecoration(hintText: 'Eric', labelText: 'Name'),
                    ),
                    SizedBox(height: constraints.maxWidth * 0.03),
                    TextFormField(
                      onChanged: (val) => _bloc.addId = val,
                      validator: (val) => val.isEmpty ? 'Invalid ID' : null,
                      decoration: InputDecoration(
                          hintText: 'xxxxxx-E', labelText: 'ID'),
                    ),
                    SizedBox(height: constraints.maxWidth * 0.05),
                    FlatButton(
                      height: constraints.maxWidth * 0.04,
                      minWidth: constraints.maxWidth * 0.1,
                      color: Colors.blueAccent,
                      onPressed: () {
                        print(_bloc.nameValue);
                        print(_bloc.idValue);
                      },
                      child: Text(
                        'Add',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
