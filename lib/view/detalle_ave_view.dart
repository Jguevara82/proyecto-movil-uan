import 'package:app_llanolargo/model/chicken.dart';
import 'package:flutter/material.dart';

class DetalleAveView extends StatelessWidget {
  final Chicken ave;

  const DetalleAveView({super.key, required this.ave});

  @override
  Widget build(BuildContext context) {
    var appTitle = 'Ave # ${ave.id} - Llanolargo';

    return Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(ave: ave,),
      );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  final Chicken ave;
  const MyCustomForm({super.key, required this.ave});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState(ave);
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final Chicken ave;
  MyCustomFormState(this.ave);

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: TextFormField(
              initialValue: '${ave.nickname}',
              readOnly: true,
              validator: (value) {
                return null;
              },
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Apodo',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: TextFormField(
              initialValue: '${ave.birthdate}',
              readOnly: true,
              validator: (value) {
                return null;
              },
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Fecha de nacimiento',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: Row(
              children: [
                SizedBox(
                  width: 90,
                  child: TextFormField(
                    initialValue: '${ave.weight}',
                    readOnly: true,
                    validator: (value) {
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Peso',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      Navigator.pop(
                          context
                      );
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text('Historial'),
                  ),
                ),
    ],
    )

          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: TextFormField(
              initialValue: 'Sana',
              readOnly: true,
              validator: (value) {
                return null;
              },
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Estado de salud',
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      Navigator.pop(
                          context
                      );
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text('Atrás'),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
