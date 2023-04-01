import 'package:flutter/material.dart';
import 'package:movies/models/models.dart';
import 'package:movies/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {
  final int movieId;
  const CastingCards({Key? key, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
        future: moviesProvider.getCreditsReponse(movieId),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container(
              constraints: const BoxConstraints(maxHeight: 150),
              height: 180,
              child: const CircularProgressIndicator(),
            );
          }

          final List<Cast> cast = snapshot.data!;

          return SizedBox(
            width: double.infinity,
            height: 180,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => _CastCard(cast: cast[index]),
            ),
          );
        });
  }
}

class _CastCard extends StatelessWidget {
  final Cast cast;

  const _CastCard({required this.cast});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage(
            placeholder: const AssetImage('assets/no-image.jpg'),
            image: NetworkImage(cast.fullProfilePath),
            height: 140,
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          cast.name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ]),
    );
  }
}
