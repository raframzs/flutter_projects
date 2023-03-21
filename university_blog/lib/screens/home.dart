import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Blog : Universidad Libre',
          ),
        ),
        body: ListView(
          children: const [
            BlogFeed(
                url:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_a4ESrgV1fyKimFM4LDdSFJodqGzUDlLaPA&usqp=CAU',
                userName: 'RAFAEL RAMIREZ',
                userNick: 'raframzs',
                content: 'Me la super suda...',
                curse: 'GERENCIA ESTRATEGICA',
                teacher: 'Jairo Cortez',
                likes: 20,
                dislikes: 0),
            BlogFeed(
                url:
                    'https://www.pngarts.com/files/11/Avatar-PNG-Free-Download.png',
                userName: 'JULIAN JIMENEZ',
                userNick: 'jucajiro',
                content:
                    'Me costo mucho entenderle al principio, me senti bastante confundido y emocionalmente afligido.',
                curse: 'E. PROGRAMACIÓN MOVIL',
                teacher: 'Ricardo Santa',
                likes: 1,
                dislikes: 54),
            BlogFeed(
                url:
                    'https://lamenteesmaravillosa.com/wp-content/uploads/2019/01/miguel-de-cervantes.png',
                userName: 'MIGUEL DE SERVANTES',
                userNick: 'rabon777',
                content:
                    'Muy mal profesor, no inscriban con el, es una trampa.',
                curse: 'REDES DE COMPUTADORES',
                teacher: 'Fernando Velazco',
                likes: 1,
                dislikes: 5),
            BlogFeed(
                url:
                    'https://i.pinimg.com/564x/99/71/9c/99719c13210068a408ebcdf7a05ecd73.jpg',
                userName: 'PAULA SANABRIA',
                userNick: 'paula2169',
                content:
                    'Muy contenta con la formación impartida. He realizado 2 cursos ya con el profe y he aprendido un 0.32% mas',
                curse: 'VISUALIZACIÓN DE DATOS',
                teacher: 'Mauricio Moncada',
                likes: 265,
                dislikes: 14),
          ],
        ));
  }
}
