import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:university_blog/ui/separators.dart';
import 'package:university_blog/widgets/home/blog_appbar.dart';

import '../theme/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch');
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme appTheme = Provider.of<AppTheme>(context);
    return Scaffold(
      appBar: const BlogAppBar(),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const CircleAvatar(
          maxRadius: 160,
          backgroundImage: AssetImage('assets/rr.jpg'),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Software Engineer',
                      style: TextStyle(fontSize: 18)),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Scotiabank',
                    style:
                        TextStyle(color: appTheme.emailLogoColor, fontSize: 17),
                  ),
                ],
              ),
              const Text('Libre University', style: TextStyle(fontSize: 17)),
              const Text('Bogotá, D.C.', style: TextStyle(fontSize: 17)),
              Separators.separatorV(80),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () =>
                          _launchUrl('https://www.instagram.com/jafaael/'),
                      icon: const FaIcon(
                        FontAwesomeIcons.instagram,
                        size: 30,
                        color: Colors.pink,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () => _launchUrl(
                          'https://www.linkedin.com/in/rafael-ramirez-49028415a/'),
                      icon: FaIcon(
                        FontAwesomeIcons.linkedinIn,
                        size: 30,
                        color: Colors.blue.shade800,
                      )),
                ],
              ),
              Separators.separatorV(100),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                    'APLICACIÓN CREADA DURANTE EL CURSO DE PROGRAMACIÓN MOVIL DICTADO POR EL ING. RICARDO SANTA EN LA UNIVERSIDAD LIBRE 2023-1',
                    maxLines: 3,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 12)),
              ),
              Separators.separatorV(10),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text('ALL RIGHTS RESERVED ®',
                    maxLines: 3,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 11)),
              ),
            ],
          ),
        )
      ])),
    );
  }
}
