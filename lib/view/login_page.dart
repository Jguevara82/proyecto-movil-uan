import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/login_vm.dart';
import 'chicken_page.dart';
import 'lista_aves_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Ingreso - Llanolargo';

    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      body: const MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
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

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: ChangeNotifierProvider(
        create: (context) => LoginViewModel(),
        child: Consumer<LoginViewModel>(
            builder: (context, model, child) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingresa un nombre de usuario';
                      }
                      model.username = value;
                      return null;
                    },
                    //onChanged: (value) => model.username = value,
                    decoration: InputDecoration(labelText: 'Usuario'),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingresa una contraseña';
                      } else if (value.length < 8) {
                        return 'La contraseña no tiene el tamaño requerido';
                      }
                      model.password = value;
                      return null;
                    },
                    //onChanged: (value) => model.password = value,
                    decoration: InputDecoration(labelText: 'Contraseña'),
                    obscureText: true,
                  ),
                  ElevatedButton(
                    child: Text('Iniciar Sesión'),
                    onPressed: () async {
                      if(_formKey.currentState!.validate()){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Validando campos...')),
                        );
                        if (await model.login()) {
                          // Navega a la siguiente pantalla
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChickenPage(),
                                  //ListaAvesView(items: List<String>.generate(200, (i) => 'Ave $i'),),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Usuario o contraseña incorrectos')),
                          );
                          // Muestra un mensaje de error
                        }
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Error de validación de campos')),
                        );
                      }

                    },
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}

