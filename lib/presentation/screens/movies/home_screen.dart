import 'package:cinemapedia_220186/presentation/providers/movies/movie_slideshow_provider.dart';
import 'package:cinemapedia_220186/presentation/providers/movies/movies_providers.dart';
import 'package:cinemapedia_220186/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: _HomeView(),
    bottomNavigationBar: CustomBottomNavigationbar(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    final nowPlaying=ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies =ref.watch(movieSlideShowProvider);

    return SingleChildScrollView(
      child: Column(
        children: [

          const CustomAppbar(),

          MovieSlideshow(movies: slideShowMovies),
          MovieHorizontalListview(
            movies: nowPlaying,
            title: 'En cines',
            subtitle: 'Miercoles 22 de octubre',
            loadNextPage: () => ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
          ),

          MovieHorizontalListview(
            movies: nowPlaying,
            title: 'Proximamente',
            subtitle: 'En este mes',
            loadNextPage: () => ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
          ),

          MovieHorizontalListview(
            movies: nowPlaying,
            title: 'Populares',
            subtitle: 'Miercoles 22 de octubre',
            loadNextPage: () => ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
          ),

          MovieHorizontalListview(
            movies: nowPlaying,
            title: 'Mexicanas',
            subtitle: 'Miercoles 22 de octubre',
            loadNextPage: () => ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
          ),

          MovieHorizontalListview(
            movies: nowPlaying,
            title: 'Mejor Calificadas',
            subtitle: 'Miercoles 22 de octubre',
            loadNextPage: () => ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
          ),
        ],
      ),
    );
  }
}
