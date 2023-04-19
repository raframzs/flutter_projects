import 'package:flutter/material.dart';

class BlogText extends StatelessWidget {
  const BlogText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Text(
          'Ultimate Spider-Man es una serie animada estadounidense creada por Man of Action Studios, basada en el cómic homónimo. La serie se transmitió el 1 de abril de 2012 por el canal Disney XD y finalizó con su cuarta temporada en enero de 2017.1​2​ Contó con escritores como Brian Michael Bendis (quien también escribe la serie de cómics del mismo nombre), Paul Dini y Man of Action (un grupo formado por Steven T. Seagle, Joe Kelly, Joe Casey y Duncan Rouleau). La tercera temporada fue retitulada Marvels Ultimate Spider-Man: Web Warriors y la cuarta y última temporada fue retitulada Marvels Ultimate Spider-Man vs. the Sinister 6. Su lanzamiento para el canal Disney XD se anunció por primera vez a principios de 2012,3​4​ y se transmitió junto con la segunda temporada de The Avengers: Earths',
          style: TextStyle(fontSize: 16),
        ));
  }
}
