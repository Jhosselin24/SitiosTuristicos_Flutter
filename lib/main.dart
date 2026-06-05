import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class SitioTuristico {
  final String nombre;
  final String ubicacion;
  final String descripcion;
  final String imagen;
  final String geolocalizacion;

  SitioTuristico({
    required this.nombre,
    required this.ubicacion,
    required this.descripcion,
    required this.imagen,
    required this.geolocalizacion,
  });
}

final List<SitioTuristico> sitios = [
  SitioTuristico(
    nombre: 'Mitad del Mundo',
    ubicacion: 'Quito',
    descripcion: 'Monumento ubicado sobre la línea ecuatorial.',
    imagen: 'images/mitad_mundo.jpg',
    geolocalizacion: 'https://maps.google.com/?q=-0.0022,-78.4558',
),
  SitioTuristico(
    nombre: 'Volcán Cotopaxi',
    ubicacion: 'Latacunga',
    descripcion: 'Uno de los volcanes activos más altos del mundo.',
    imagen: 'images/cotopaxi.jpg',
    geolocalizacion: 'https://maps.google.com/?q=-0.6800,-78.4370',

  ),
  SitioTuristico(
    nombre: 'Baños de Agua Santa',
    ubicacion: 'Tungurahua',
    descripcion: 'Famoso destino turístico por sus cascadas.',
    imagen: 'images/banios.jpg',
    geolocalizacion: 'https://maps.google.com/?q=-1.3969,-78.4247',
  ),
  SitioTuristico(
    nombre: 'Laguna Quilotoa',
    ubicacion: 'Cotopaxi',
    descripcion: 'Laguna volcánica de impresionante color turquesa.',
    imagen: 'images/quilotoa.jpg',
    geolocalizacion: 'https://maps.google.com/?q=-0.8556,-78.8974',
  ),
  SitioTuristico(
    nombre: 'Islas Galápagos',
    ubicacion: 'Galápagos',
    descripcion: 'Patrimonio Natural de la Humanidad.',
    imagen: 'images/galapagos.jpg',
    geolocalizacion: 'https://maps.google.com/?q=-0.9538,-90.9656',
  ),
  SitioTuristico(
    nombre: 'Malecón 2000',
    ubicacion: 'Guayaquil',
    descripcion: 'Uno de los principales atractivos de Guayaquil.',
    imagen: 'images/malecon.jpg',
    geolocalizacion: 'https://maps.google.com/?q=-2.1894,-79.8806',
  ),
  SitioTuristico(
    nombre: 'Parque Nacional Yasuní',
    ubicacion: 'Amazonía',
    descripcion: 'Zona de enorme biodiversidad.',
    imagen: 'images/yasuni.jpg',
    geolocalizacion: 'https://maps.google.com/?q=-0.6748,-76.3980',
  ),
  SitioTuristico(
    nombre: 'Catedral Nueva',
    ubicacion: 'Cuenca',
    descripcion: 'Icono arquitectónico de la ciudad.',
    imagen: 'images/cuenca.jpg',
    geolocalizacion: 'https://maps.google.com/?q=-2.9001,-79.0059',
  ),
  SitioTuristico(
    nombre: 'Nariz del Diablo',
    ubicacion: 'Alausí',
    descripcion: 'Histórica ruta ferroviaria de montaña.',
    imagen: 'images/nariz.jpg',
    geolocalizacion: 'https://maps.google.com/?q=-2.2034,-78.8487',
  ),
  SitioTuristico(
    nombre: 'Reserva Cuyabeno',
    ubicacion: 'Sucumbíos',
    descripcion: 'Reserva natural amazónica de gran belleza.',
    imagen: 'images/cuyabeno.jpg',
    geolocalizacion: 'https://maps.google.com/?q=-0.0200,-76.1600',
  ),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sitios Turísticos',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Sitios Turísticos de Ecuador'),
        ),
        body: Container(
  decoration: const BoxDecoration(
    image: DecorationImage(
      image: NetworkImage(
        'https://images.unsplash.com/photo-1469474968028-56623f02e42e',
      ),
      fit: BoxFit.cover,
    ),
  ),
  child: ListView.builder(
    itemCount: sitios.length,
    itemBuilder: (context, index) {
      final sitio = sitios[index];

      return Card(
        margin: const EdgeInsets.all(10),
        color: Colors.white70,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSection(image: sitio.imagen),
            TitleSection(
              name: sitio.nombre,
              location: sitio.ubicacion,
            ),
            const ButtonSection(),
            TextSection(
              description: sitio.descripcion,
            ),
            const Divider(
              thickness: 2,
            ),
          ],
        ),
      );
    },
  ),
),
      ),
    );
  }
}

class TitleSection extends StatefulWidget {
  const TitleSection({
    super.key,
    required this.name,
    required this.location,
  });

  final String name;
  final String location;

  @override
  State<TitleSection> createState() => _TitleSectionState();
}

class _TitleSectionState extends State<TitleSection> {
  bool isFavorite = false;
  int favoriteCount = 41;

  void toggleFavorite() {
    setState(() {
      if (isFavorite) {
        favoriteCount--;
        isFavorite = false;
      } else {
        favoriteCount++;
        isFavorite = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    widget.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  widget.location,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 29, 29, 29),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              isFavorite ? Icons.star : Icons.star_border,
              color: Colors.pink,
            ),
            onPressed: toggleFavorite,
          ),
          Text('$favoriteCount'),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ButtonWithText(
          color: color,
          icon: Icons.call,
          label: 'CALL',
        ),
        ButtonWithText(
          color: color,
          icon: Icons.near_me,
          label: 'ROUTE',
        ),
        ButtonWithText(
          color: color,
          icon: Icons.share,
          label: 'SHARE',
        ),
      ],
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(
        description,
        softWrap: true,
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            image,
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}