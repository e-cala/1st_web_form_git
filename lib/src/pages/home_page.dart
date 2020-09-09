import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController _nameController = TextEditingController();
    TextEditingController _idController = TextEditingController();
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          children: [
            Expanded(
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
                          style:
                              TextStyle(color: Colors.blueAccent, fontSize: 24),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: constraints.maxWidth * 0.2),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _nameController,
                              validator: (val) =>
                                  val.isEmpty ? 'Invalid Name' : null,
                              decoration: InputDecoration(
                                  hintText: 'Eric', labelText: 'Name'),
                            ),
                            SizedBox(height: constraints.maxWidth * 0.03),
                            TextFormField(
                              controller: _idController,
                              validator: (val) =>
                                  val.isEmpty ? 'Invalid ID' : null,
                              decoration: InputDecoration(
                                  hintText: 'xxxxxx-E', labelText: 'ID'),
                            ),
                            SizedBox(height: constraints.maxWidth * 0.05),
                            FlatButton(
                              height: constraints.maxWidth * 0.04,
                              minWidth: constraints.maxWidth * 0.1,
                              color: Colors.blueAccent,
                              onPressed: () {
                                print(_nameController.text);
                                print(_idController.text);
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
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.blue,
                child: Column(
                  children: [
                    Text('${_nameController.text}'),
                    Text('${_idController.text}')
                  ]
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
