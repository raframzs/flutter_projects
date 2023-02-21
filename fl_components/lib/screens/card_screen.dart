import 'package:fl_components/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cards'),
        ),
        body: ListView(
          children: const [
            CustomCardScreen(
              title: 'Card Sample X',
              subtitle:
                  'Sit sit quis enim laborum laborum est magna sunt occaecat fugiat.',
            ),
            CustomCard2Screen(
                name: 'Germany Castle',
                imageUrl:
                    'https://th-thumbnailer.cdn-si-edu.com/Yq_crW-TdiCFYJ6NEm6QlpxUKDE=/1000x750/filters:no_upscale()/https://tf-cmsv2-smithsonianmag-media.s3.amazonaws.com/filer/31/e7/31e70d69-a3b2-4823-9097-2176fd515da6/neuschwanstein-castle.jpg'),
            SizedBox(
              height: 15,
            ),
            CustomCard2Screen(
                imageUrl:
                    'https://hips.hearstapps.com/hmg-prod/images/bojnice-castle-1603142898.jpg'),
            SizedBox(
              height: 15,
            ),
            CustomCard2Screen(
                imageUrl:
                    'https://travellersworldwide.com/wp-content/uploads/2022/05/shutterstock_314150231.jpg.webp'),
            SizedBox(
              height: 15,
            ),
            CustomCard2Screen(
                imageUrl:
                    'https://media.cntraveler.com/photos/5dc5955b51e5fc00088a0dbc/master/w_3864,h_2576,c_limit/Neuschwanstein-GettyImages-149410921.jpg'),
            SizedBox(height: 50),
          ],
        ));
  }
}
