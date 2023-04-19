import 'package:flutter/material.dart';

class BlogTitle extends StatelessWidget {
  const BlogTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Spiderman Ultimate',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Creada por Man of Action Studios',
                style: TextStyle(color: Colors.grey, fontSize: 18),
              )
            ],
          ),
          const SizedBox(
            width: 40,
          ),
          const Icon(
            Icons.star,
            color: Colors.orange,
            size: 25,
          ),
          const Text('41', style: TextStyle(fontSize: 18))
        ],
      ),
    );
  }
}
