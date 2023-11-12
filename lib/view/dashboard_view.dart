import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: DashboardView(),
  ));
}

class DashboardView extends StatelessWidget {

  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Listado de aves - Llanolargo';

    return Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
          child: Chart(
            data: const [
              { 'fecha': '20/10/2023', 'sold': 275 },
              { 'fecha': '21/10/2023', 'sold': 115 },
              { 'fecha': '22/10/2023', 'sold': 120 },
              { 'fecha': '23/10/2023', 'sold': 350 },
              { 'fecha': '24/10/2023', 'sold': 150 },
              { 'fecha': '25/10/2023', 'sold': 320 },
              { 'fecha': '26/10/2023', 'sold': 115 },
              { 'fecha': '27/10/2023', 'sold': 120 },
              { 'fecha': '28/10/2023', 'sold': 350 },
              { 'fecha': '29/10/2023', 'sold': 150 },
              { 'fecha': '30/10/2023', 'sold': 275 },
              { 'fecha': '31/10/2023', 'sold': 115 },
              { 'fecha': '32/10/2023', 'sold': 120 },
              { 'fecha': '33/10/2023', 'sold': 350 },
              { 'fecha': '34/10/2023', 'sold': 150 },

            ],
            variables: {
              'genre': Variable(
                accessor: (Map map) => map['fecha'] as String,
              ),
              'sold': Variable(
                accessor: (Map map) => map['sold'] as num,
              ),
            },
            marks: [IntervalMark()],
            axes: [
              Defaults.horizontalAxis,
              Defaults.verticalAxis,
            ],
          ),
        )

      );
  }
}