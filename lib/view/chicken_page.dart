import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/chicken_vm.dart';

class ChickenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChickenViewModel(),
      child: Scaffold(
        appBar: AppBar(title: Text('Chickens')),
        body: Consumer<ChickenViewModel>(
          builder: (context, model, child) => ListView.builder(
            itemCount: model.chickens.length,
            itemBuilder: (context, index) {
              var chicken = model.chickens[index];
              return ListTile(
                title: Text('${chicken.nickname}, Nacimiento: ${chicken.birthdate}'),
                subtitle: Text('ID: ${chicken.id}, Weight: ${chicken.weight}g, Health Status: ${chicken.healthStatus}'),
                onTap: () {
                  // Navega a una página de detalles o abre un diálogo para editar/eliminar
                },
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            // Navega a una página de creación o abre un diálogo para crear una nueva gallina
          },
        ),
      ),
    );
  }
}
