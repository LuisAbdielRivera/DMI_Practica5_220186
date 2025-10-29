import 'package:flutter/material.dart';
import 'package:cinemapedia_220186/config/router/app_router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:cinemapedia_220186/config/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  // Asegura que los bindings de Flutter estén listos antes de cargar dotenv
  WidgetsFlutterBinding.ensureInitialized();

  // Cargar variables de entorno (.env)
  await dotenv.load(fileName: '.env');

  // Iniciar la app dentro del ProviderScope (para Riverpod)
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}
