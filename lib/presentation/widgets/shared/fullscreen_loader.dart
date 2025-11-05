import 'package:flutter/material.dart';

class FullscreenLoader extends StatelessWidget {
  const FullscreenLoader({super.key});

  Stream<String> _getLoadingAnimation() async* {
    final messages = <String>[
      'Estableciendo elementos de comunicación',
      'Conectando a la API de TheMovieDB',
      'Obteniendo las películas que actualmente se proyectan',
      'Obteniendo los próximos estrenos',
      'Obteniendo las películas mejor valoradas',
      'Obteniendo las mejores películas Mexicanas',
      'Todo listo... ¡comenzemos!',
    ];

    for (final message in messages) {
      yield message;
      await Future.delayed(const Duration(milliseconds: 1200));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Bienvenido a Cinemapedia - 220186'),
          const SizedBox(height: 10),
          const CircularProgressIndicator(strokeWidth: 4),
          const SizedBox(height: 10),
          StreamBuilder(
            stream: _getLoadingAnimation(),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (!snapshot.hasData) return const Text('Cargando...');
              return Text(snapshot.data!);
            },
          ),
        ],
      ),
    );
  }
}