import 'package:flutter/material.dart';

class Eventosscreen extends StatefulWidget {
  const Eventosscreen({super.key});

  @override
  State<Eventosscreen> createState() => _EventosscreenState();
}

class _EventosscreenState extends State<Eventosscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial de Eventos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            _buildEventCard(
              title: "Evento 1",
              date: "22 de Diciembre, 2024",
              description: "Este es un evento importante sobre tecnología.",
            ),
            const SizedBox(height: 16),
                        _buildEventCard(
              title: "Evento 1",
              date: "22 de Diciembre, 2024",
              description: "Este es un evento importante sobre tecnología.",
            ),
                        _buildEventCard(
              title: "Evento 1",
              date: "22 de Diciembre, 2024",
              description: "Este es un evento importante sobre tecnología.",
            ),
                        _buildEventCard(
              title: "Evento 1",
              date: "22 de Diciembre, 2024",
              description: "Este es un evento importante sobre tecnología.",
            ),
                        _buildEventCard(
              title: "Evento 1",
              date: "22 de Diciembre, 2024",
              description: "Este es un evento importante sobre tecnología.",
            ),
                        _buildEventCard(
              title: "Evento 1",
              date: "22 de Diciembre, 2024",
              description: "Este es un evento importante sobre tecnología.",
            ),
                        _buildEventCard(
              title: "Evento 1",
              date: "22 de Diciembre, 2024",
              description: "Este es un evento importante sobre tecnología.",
            ),

            
          ],
        ),
      ),
    );
  }
}

/*Plantilla de un Eventos en tarjeta*/
Widget _buildEventCard({
  required String title,
  required String date,
  required String description,
}) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 4,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            date,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    ),
  );
}
