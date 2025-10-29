import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:cinemapedia_220186/domain/entities/movie.dart';
import 'package:cinemapedia_220186/config/helpers/human_formats.dart';

class MovieHorizontalListview extends StatelessWidget {
  final List<Movie> movies;
  final String? title;
  final String? subtitle;
  final VoidCallback? loadNextPage;

  const MovieHorizontalListview({
    super.key,
    required this.movies,
    this.title,
    this.subtitle,
    this.loadNextPage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          if (title != null || subtitle != null)
            _CurrDate(place: title, formattedDate: subtitle),
          Expanded(
            child: ListView.builder(
              itemCount: movies.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return _Slide(movie: movies[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;
  const _Slide({required this.movie});

  

  @override
  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                movie.posterPath, 
                fit: BoxFit.cover,
                width: 150,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    );
                  }
                  return FadeIn(child:child);
                },
              ),
            ),
          ),
          const SizedBox(height: 5,),
          SizedBox(
            width: 150,
            child: Text(
              movie.title,
              maxLines: 2,
              style: textStyles.titleSmall
              
            ),
          ),
          Row(
            children: [
              Icon(Icons.star_half_outlined, color: Colors.yellow.shade800),
              Text('${movie.voteAverage}', style: textStyles.bodyMedium?.copyWith(color: Colors.yellow.shade800)),
              const SizedBox(width: 10),
              Text(HumanFormats.number(movie.popularity),style: textStyles.bodySmall)
            ],
          )
        ],
      ),
    );
  }
}

class _CurrDate extends StatelessWidget {
  final String? place;
  final String? formattedDate;

  const _CurrDate({this.place, this.formattedDate});

  @override
  Widget build(BuildContext context) {
    final placeStyle = Theme.of(context).textTheme.titleLarge;
    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if (place != null) Text(place!, style: placeStyle),
          Spacer(),
          if (formattedDate != null)
            FilledButton.tonal(onPressed: () {}, child: Text(formattedDate!)),
        ],
      ),
    );
  }
}