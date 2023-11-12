import 'package:flutter/material.dart';

import 'detalle_ave_view.dart';

class ListaAvesView extends StatelessWidget {
  final List<String> items;

  const ListaAvesView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    const title = 'Listado de aves - Llanolargo';

    return Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView.builder(
          itemCount: items.length,
          prototypeItem: ListTile(
            title: Text(items.first),
            subtitle: Text(items.first),
            trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.delete)),
          ),
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.network('https://cdn-icons-png.flaticon.com/512/7309/7309075.png'),
              title: Text(items[index]),
              subtitle: Text('apodo $index'),
              trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.delete)),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetalleAveView(id_ave: index)),
                );
              },
            );
          },
        ),
      );
  }
}