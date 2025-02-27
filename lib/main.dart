import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Asegúrate de importar FontAwesomeIcons
import 'package:petronexus/reporte.dart';
import 'package:petronexus/desglose.dart'; // Asegúrate de importar la página DesglosePage

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Petronexus',
      theme: ThemeData(
        primaryColor: const Color(0xFFC0261F), // Usar primaryColor en lugar de primarySwatch
        scaffoldBackgroundColor: const Color(0xFFe5e8e8),
      ),
      home: const MyHomePage(title: 'Petronexus'),
      debugShowCheckedModeBanner: false, // Ocultar banner de debug
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Función para mostrar el diálogo
  void _mostrarDialogo(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Función no disponible'),
          content: const Text('Esta función estará disponible próximamente.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: const Color(0xFFC0261F),
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      backgroundColor: const Color(0xFFe5e8e8),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/lateral.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Petronexus',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Menú desplegable para "Carga de Gasolina"
            ExpansionTile(
              leading: const Icon(Icons.local_gas_station), // Ícono de gasolina
              title: const Text('Carga de Gasolina'),
              children: [
                ListTile(
                  leading: const Icon(FontAwesomeIcons.upload), // Ícono de subir
                  title: const Text('Subir carga de gasolina'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReportePage()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(FontAwesomeIcons.fileAlt), // Ícono de lista
                  title: const Text('Reportes de gasolina'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DesglosePage()),
                    );
                  },
                ),
              ],
            ),
            // Menú desplegable para "Servicio de aceite"
            ExpansionTile(
              leading: const Icon(FontAwesomeIcons.oilCan), // Ícono de aceite
              title: const Text('Servicio de aceite'),
              children: [
                ListTile(
                  leading: const Icon(FontAwesomeIcons.upload), // Ícono de subir
                  title: const Text('Subir servicio de aceite'),
                  onTap: () {
                    _mostrarDialogo(context); // Mostrar diálogo
                  },
                ),
                ListTile(
                  leading: const Icon(FontAwesomeIcons.fileAlt), // Ícono de reporte
                  title: const Text('Reportes de servicio'),
                  onTap: () {
                    _mostrarDialogo(context); // Mostrar diálogo
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/oil.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}