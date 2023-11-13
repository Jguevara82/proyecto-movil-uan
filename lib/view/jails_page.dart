import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import '../view_model/chicken_vm.dart';
import '../view_model/jails_vm.dart';
import 'chicken_page.dart';
import 'detalle_ave_view.dart';

class JailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    EasyLoading.show(status: 'Cargando...');
    return ChangeNotifierProvider(
      create: (context) => JailsViewModel(),
      child: Scaffold(
        appBar: AppBar(title: Text('Jaulas')),
        body: Consumer<JailsViewModel>(
          builder: (context, model, child) { EasyLoading.dismiss(); return ListView.builder(
            itemCount: model.jails.length,
            itemBuilder: (context, index) {
              var jail = model.jails[index];
              return ListTile(
                leading: Image.network('https://cdn-icons-png.flaticon.com/512/869/869027.png'),
                title: Text('Jaula # $jail'),
                trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.delete)),
                onTap: () {
                  // Navega a una página de detalles o abre un diálogo para editar/eliminar
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChickenPage(id_jaula: jail,)),
                  );
                },
              );
            },
          );}
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
