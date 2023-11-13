import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import '../view_model/chicken_vm.dart';
import 'detalle_ave_view.dart';

class ChickenPage extends StatelessWidget {
  final int id_jaula;
  const ChickenPage({this.id_jaula=0});
  
  @override
  Widget build(BuildContext context) {
    EasyLoading.show(status: 'Cargando...');
    return ChangeNotifierProvider(
      create: (context) => ChickenViewModel(id: id_jaula),
      child: Scaffold(
        appBar: AppBar(title: Text('Aves')),
        body: Consumer<ChickenViewModel>(
          builder: (context, model, child) { EasyLoading.dismiss(); return ListView.builder(
            itemCount: model.chickens.length,
            itemBuilder: (context, index) {
              var chicken = model.chickens[index];
              return ListTile(
                leading: Image.network('https://cdn-icons-png.flaticon.com/512/7309/7309075.png'),
                title: Text('Ave # ${chicken.id}'),
                subtitle: Text('Apodo: ${chicken.nickname},\nEstado: ${chicken.healthStatus}'),
                trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.delete)),
                onTap: () {
                  // Navega a una página de detalles o abre un diálogo para editar/eliminar
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetalleAveView(ave: chicken)),
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
