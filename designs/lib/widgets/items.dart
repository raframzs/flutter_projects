import 'dart:ui';

import 'package:flutter/material.dart';

class CardItems extends StatelessWidget {
  const CardItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: const [
        TableRow(children: [
          _SingleCardItem(
            colors: [Color.fromARGB(255, 165, 214, 255), Color(0xff2ea4f9)],
            iconData: Icons.app_registration_sharp,
            label: 'General',
          ),
          _SingleCardItem(
            colors: [Color(0xffb18cfd), Color(0xff7f57f7)],
            iconData: Icons.bus_alert,
            label: 'Transporte',
          ),
        ]),
        TableRow(children: [
          _SingleCardItem(
            colors: [Color(0xfffe99f3), Color(0xffff3ed6)],
            iconData: Icons.shopify,
            label: 'Compras',
          ),
          _SingleCardItem(
            colors: [Color(0xfffecd9b), Color(0xfff68b48)],
            iconData: Icons.note_sharp,
            label: 'Deudas',
          ),
        ]),
        TableRow(children: [
          _SingleCardItem(
            colors: [Color(0xff80aaff), Color(0xff4f70fe)],
            iconData: Icons.movie,
            label: 'Entretenimiento',
          ),
          _SingleCardItem(
            colors: [Color(0xff88fd8c), Color(0xff25dd54)],
            iconData: Icons.local_grocery_store,
            label: 'Supermercado',
          ),
        ]),
        TableRow(children: [
          _SingleCardItem(
            colors: [
              Color.fromARGB(255, 246, 248, 181),
              Color.fromARGB(255, 202, 207, 35)
            ],
            iconData: Icons.yard,
            label: 'Flores',
          ),
          _SingleCardItem(
            colors: [
              Color.fromARGB(255, 255, 147, 147),
              Color.fromARGB(255, 255, 51, 51)
            ],
            iconData: Icons.ramen_dining_sharp,
            label: 'Comida',
          ),
        ])
      ],
    );
  }
}

class _SingleCardItem extends StatelessWidget {
  final List<Color> colors;
  final String label;
  final IconData iconData;
  const _SingleCardItem(
      {required this.colors, required this.label, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(62, 66, 107, 0.7),
                borderRadius: BorderRadius.circular(20)),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: colors)),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.transparent,
                  child: Icon(
                    iconData,
                    size: 35,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                label,
                style: TextStyle(fontSize: 18, color: colors[1]),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
