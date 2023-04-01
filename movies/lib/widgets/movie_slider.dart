import 'package:flutter/material.dart';

import '../models/models.dart';

class MovieSliderScreen extends StatefulWidget {
  final List<Movie> popularMovies;
  final String? title;
  final Function onNextPage;

  const MovieSliderScreen(
      {Key? key,
      required this.popularMovies,
      this.title,
      required this.onNextPage})
      : super(key: key);

  @override
  State<MovieSliderScreen> createState() => _MovieSliderScreenState();
}

class _MovieSliderScreenState extends State<MovieSliderScreen> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.position.pixels >=
          _controller.position.maxScrollExtent - 500) {
        widget.onNextPage();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 260,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (widget.title != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              widget.title!,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        Expanded(
          child: ListView.builder(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            itemCount: widget.popularMovies.length,
            itemBuilder: (context, index) => _MoviePoster(
              movie: widget.popularMovies[index],
            ),
          ),
        )
      ]),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final Movie movie;

  const _MoviePoster({required this.movie});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 200,
      margin: const EdgeInsets.all(10),
      child: Column(children: [
        GestureDetector(
          onTap: () =>
              Navigator.pushNamed(context, 'details', arguments: movie),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: NetworkImage(movie.fullPosterImage),
              fit: BoxFit.cover,
              height: 170,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          movie.title,
          maxLines: 2,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        )
      ]),
    );
  }
}
