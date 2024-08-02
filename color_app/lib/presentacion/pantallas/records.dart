import 'package:color_app/presentacion/pantallas/inicio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:color_app/funciones/guardar_record.dart';

class RecordsPantalla extends StatelessWidget {
  const RecordsPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    final records = Provider.of<RecordsNotifier>(context).records;

    // Sort the records in descending order by score and take the top 5
    final top5Records = records
      ..sort((a, b) => b.puntaje.compareTo(a.puntaje)) // Descending order
      ..take(5)
      .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Records', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          const SizedBox(height: 50),
          const Text('5 Mejores Records!', style: TextStyle(fontSize: 30)),
          const SizedBox(height: 50),
          Expanded(
            child: ListView.builder(
              itemCount: top5Records.length,
              itemBuilder: (context, index) {
                final record = top5Records[index];
                return ListTile(
                  leading: Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  title: Text(record.nombre, style: const TextStyle(fontSize: 20)),
                  trailing: Text(record.puntaje.toString(), style: const TextStyle(fontSize: 20)),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center, // Center the button horizontally
            children: [
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PantallaInicial()),
                ),
                child: const Text('Volver a Inicio', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              ),
              const SizedBox(width: 20.0), // Add spacing between buttons
             ElevatedButton(
  onPressed: () {
    final recordsNotifier = Provider.of<RecordsNotifier>(context, listen: false);
    recordsNotifier.clearRecords(); // Assuming a clearRecords method in RecordsNotifier

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Todos los records eliminados'),
        duration: const Duration(seconds: 2),
      ),
    );
  },
  child: const Text('Borrar Records', style: TextStyle(color: Colors.white)),
  style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
),

            ],
          ),
          const SizedBox(height: 20.0), // Add some bottom padding
        ],
      ),
    );
  }
}
