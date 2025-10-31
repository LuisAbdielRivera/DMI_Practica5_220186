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
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(upComingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(mexicanMoviesProvider.notifier).loadNextPage();

  }

  @override
  Widget build(BuildContext context) {

    final nowPlaying=ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies =ref.watch(movieSlideShowProvider);
    final popular= ref.watch(popularMoviesProvider);
    final upComing= ref.watch(upComingMoviesProvider);
    final topRated= ref.watch(topRatedMoviesProvider);
    final mexican= ref.watch(mexicanMoviesProvider);

    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAppbar(),
          MovieSlideshow(movies: slideShowMovies),
      
      
          MovieHorizontalListview(
          movies: nowPlaying,
          title: 'En cines',
          subtitle: 'Miercoles 22 de octubre',
          loadNextPage: (){
            //print('Evebto lananzod por listern horizomtal');
            ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
          },
          ),
      
           MovieHorizontalListview(
          movies: upComing,
          title: 'Proximamete',
          subtitle: 'Este Mes',
          loadNextPage: (){
            //print('Evebto lananzod por listern horizomtal');
            ref.read(upComingMoviesProvider.notifier).loadNextPage();
          },
          ),

            MovieHorizontalListview(
          movies: popular,
          title: 'Populares',
          subtitle: 'La Proxima Semana',
          loadNextPage: (){
            //print('Evebto lananzod por listern horizomtal');
            ref.read(popularMoviesProvider.notifier).loadNextPage();
          },
          ),
      
            MovieHorizontalListview(
          movies: topRated,
          title: 'Mejor Calificadas',
          subtitle: 'La Proxima Semana',
          loadNextPage: (){
            //print('Evebto lananzod por listern horizomtal');
            ref.read(topRatedMoviesProvider.notifier).loadNextPage();
          },
          ),
      
            MovieHorizontalListview(
          movies: mexican,
          title: 'Mexicanas',
          subtitle: 'La Proxima Semana',
          loadNextPage: (){
            //print('Evebto lananzod por listern horizomtal');
            ref.read(mexicanMoviesProvider.notifier).loadNextPage();
          },
          ),
        ]
      ),
    );
  }
}