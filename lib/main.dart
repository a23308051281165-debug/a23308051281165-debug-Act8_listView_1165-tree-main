import 'package:flutter/material.dart';

void main() => runApp(const AppHeladeria());

class AppHeladeria extends StatelessWidget {
  const AppHeladeria({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Heladería',
      // Agregamos la coma que faltaba después de 'Heladería'
      home: const Sabores(), 
    );
  }
}

class Sabores extends StatelessWidget {
  const Sabores({super.key});

  @override
  Widget build(BuildContext context) {
    // Definimos los datos. Nota: Usamos cast explícito para evitar errores de tipo.
    final List<Map<String, dynamic>> helados = [
      {'nombre': 'Fresa Silvestre', 'desc': 'Con trozos de fruta natural', 'icon': Icons.icecream, 'color': Colors.pink},
      {'nombre': 'Vainilla Real', 'desc': 'Vainilla de Madagascar', 'icon': Icons.cookie, 'color': Colors.amber},
      {'nombre': 'Menta Choc', 'desc': 'Refrescante y crujiente', 'icon': Icons.ac_unit, 'color': Colors.teal},
      {'nombre': 'Chocolate Suizo', 'desc': '70% cacao puro', 'icon': Icons.bakery_dining, 'color': Colors.brown},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Heladería Dana',
          style: TextStyle(
            color: Color.fromARGB(255, 218, 81, 134), 
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 197, 216),
        leading: IconButton(
          icon: const Icon(Icons.camera_alt, color: Color.fromARGB(255, 211, 172, 206)),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.ac_unit, color: Color.fromARGB(255, 218, 81, 134)),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.icecream, color: Color.fromARGB(255, 218, 81, 134)),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: helados.length,
        itemBuilder: (context, index) {
          final helado = helados[index];
          // Extraemos los valores con seguridad
          final Color colorIcono = helado['color'] as Color;
          
          return Card(
            elevation: 3,
            shadowColor: Colors.pink.withOpacity(0.2),
            margin: const EdgeInsets.only(bottom: 15),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: colorIcono.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(helado['icon'] as IconData, color: colorIcono),
              ),
              title: Text(
                helado['nombre'] as String,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text(helado['desc'] as String),
              trailing: const Icon(Icons.add_circle, color: Colors.pinkAccent),
              onTap: () {
                // Feedback visual al tocar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('¡Añadiste ${helado['nombre']} al carrito!'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}