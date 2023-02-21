import 'package:flutter/material.dart';

class CustomCard2Screen extends StatelessWidget {
  final String imageUrl;
  final String? name;
  const CustomCard2Screen({Key? key, required this.imageUrl, this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      clipBehavior: Clip.antiAlias,
      elevation: 20,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          FadeInImage(
            placeholder: const AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(imageUrl),
            width: double.infinity,
            height: 260,
            fadeInDuration: const Duration(milliseconds: 300),
            fit: BoxFit.cover,
          ),
          if (name != null)
            Container(
                alignment: AlignmentDirectional.centerEnd,
                padding: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
                child: Text(name ?? 'A beautiful castle'))
        ],
      ),
    );
  }
}
