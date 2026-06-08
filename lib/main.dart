import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MyApp());

class SitioTuristico {
  final String nombre;
  final String ubicacion;
  final String descripcion;
  final String imagen;
  final String geolocalizacion;
  final String emoji;

  const SitioTuristico({
    required this.nombre,
    required this.ubicacion,
    required this.descripcion,
    required this.imagen,
    required this.geolocalizacion,
    required this.emoji,
  });
}

final List<SitioTuristico> sitios = [
  SitioTuristico(
    nombre: 'Mitad del Mundo',
    ubicacion: 'Quito',
    descripcion: 'Monumento ubicado sobre la línea ecuatorial, donde el hemisferio norte y sur se encuentran.',
    imagen: 'images/mitad_mundo.jpg',
    geolocalizacion: 'https://maps.google.com/?q=-0.0022,-78.4558',
    emoji: '🌐',
  ),
  SitioTuristico(
    nombre: 'Volcán Cotopaxi',
    ubicacion: 'Latacunga',
    descripcion: 'Uno de los volcanes activos más altos del mundo, con sus nieves eternas y majestuosas vistas.',
    imagen: 'images/cotopaxi.jpg',
    geolocalizacion: 'https://maps.google.com/?q=-0.6800,-78.4370',
    emoji: '🌋',
  ),
  SitioTuristico(
    nombre: 'Baños de Agua Santa',
    ubicacion: 'Tungurahua',
    descripcion: 'Famoso destino turístico rodeado de cascadas espectaculares y aventura en cada rincón.',
    imagen: 'images/banios.jpg',
    geolocalizacion: 'https://maps.google.com/?q=-1.3969,-78.4247',
    emoji: '💧',
  ),
  SitioTuristico(
    nombre: 'Laguna Quilotoa',
    ubicacion: 'Cotopaxi',
    descripcion: 'Laguna volcánica de impresionante color turquesa, formada en el cráter de un volcán.',
    imagen: 'images/quilotoa.jpg',
    geolocalizacion: 'https://maps.google.com/?q=-0.8556,-78.8974',
    emoji: '🏞️',
  ),
  SitioTuristico(
    nombre: 'Islas Galápagos',
    ubicacion: 'Galápagos',
    descripcion: 'Patrimonio Natural de la Humanidad, hogar de una fauna única que inspiró a Darwin.',
    imagen: 'images/galapagos.jpg',
    geolocalizacion: 'https://maps.google.com/?q=-0.9538,-90.9656',
    emoji: '🐢',
  ),
  SitioTuristico(
    nombre: 'Malecón 2000',
    ubicacion: 'Guayaquil',
    descripcion: 'Uno de los principales atractivos de Guayaquil, a orillas del majestuoso río Guayas.',
    imagen: 'images/malecon.jpg',
    geolocalizacion: 'https://maps.google.com/?q=-2.1894,-79.8806',
    emoji: '🌆',
  ),
  SitioTuristico(
    nombre: 'Parque Nacional Yasuní',
    ubicacion: 'Amazonía',
    descripcion: 'Zona de enorme biodiversidad, considerada una de las más ricas del planeta.',
    imagen: 'images/yasuni.jpg',
    geolocalizacion: 'https://maps.google.com/?q=-0.6748,-76.3980',
    emoji: '🌿',
  ),
  SitioTuristico(
    nombre: 'Catedral Nueva',
    ubicacion: 'Cuenca',
    descripcion: 'Icono arquitectónico de la ciudad, con sus imponentes cúpulas azules visibles desde toda la ciudad.',
    imagen: 'images/cuenca.jpg',
    geolocalizacion: 'https://maps.google.com/?q=-2.9001,-79.0059',
    emoji: '⛪',
  ),
  SitioTuristico(
    nombre: 'Nariz del Diablo',
    ubicacion: 'Alausí',
    descripcion: 'Histórica ruta ferroviaria de montaña, considerada una de las más difíciles del mundo.',
    imagen: 'images/nariz.jpg',
    geolocalizacion: 'https://maps.google.com/?q=-2.2034,-78.8487',
    emoji: '🚂',
  ),
  SitioTuristico(
    nombre: 'Reserva Cuyabeno',
    ubicacion: 'Sucumbíos',
    descripcion: 'Reserva natural amazónica de gran belleza, refugio de cientos de especies de flora y fauna.',
    imagen: 'images/cuyabeno.jpg',
    geolocalizacion: 'https://maps.google.com/?q=-0.0200,-76.1600',
    emoji: '🦜',
  ),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecuador Turístico',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1B5E20),
          primary: const Color(0xFF2E7D32),
          secondary: const Color(0xFFFFD600),
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: const Color(0xFF1B5E20),
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Ecuador Turístico',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  shadows: [Shadow(color: Colors.black38, blurRadius: 4)],
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://images.unsplash.com/photo-1469474968028-56623f02e42e',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Color(0xCC1B5E20)],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Destinos Destacados',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B5E20),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${sitios.length} lugares que debes conocer',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => SitioCard(sitio: sitios[index]),
                childCount: sitios.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }
}

class SitioCard extends StatefulWidget {
  final SitioTuristico sitio;

  const SitioCard({super.key, required this.sitio});

  @override
  State<SitioCard> createState() => _SitioCardState();
}

class _SitioCardState extends State<SitioCard> {
  bool isFavorite = false;
  int favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      favoriteCount += isFavorite ? 1 : -1;
    });
  }

  Future<void> _openMaps() async {
    final uri = Uri.parse(widget.sitio.geolocalizacion);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No se pudo abrir Google Maps')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with badges
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.asset(
                  widget.sitio.imagen,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 200,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF2E7D32), Color(0xFF66BB6A)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        widget.sitio.emoji,
                        style: const TextStyle(fontSize: 64),
                      ),
                    ),
                  ),
                ),
              ),
              // Location badge
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xEE1B5E20),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.location_on, color: Colors.white, size: 14),
                      const SizedBox(width: 4),
                      Text(
                        widget.sitio.ubicacion,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Favorite button
              Positioned(
                top: 8,
                right: 8,
                child: Material(
                  color: Colors.white,
                  shape: const CircleBorder(),
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    onTap: _toggleFavorite,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.grey,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.sitio.emoji,
                      style: const TextStyle(fontSize: 24),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        widget.sitio.nombre,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1B2D1E),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Color(0xFFFFD600), size: 18),
                        const SizedBox(width: 2),
                        Text(
                          '$favoriteCount',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Description
                Text(
                  widget.sitio.descripcion,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF555555),
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 16),

                // Buttons row
                Row(
                  children: [
                    // Google Maps button
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: _openMaps,
                        icon: const Icon(Icons.map, size: 18),
                        label: const Text('Ver en Maps'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2E7D32),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    // Share button
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.share_outlined, size: 18),
                      label: const Text('Compartir'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF2E7D32),
                        side: const BorderSide(color: Color(0xFF2E7D32)),
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}