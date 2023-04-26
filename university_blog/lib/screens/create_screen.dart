import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:university_blog/theme/app_theme.dart';
import 'package:university_blog/ui/separators.dart';
import '../widgets/widgets.dart';

class CreateBlogScreen extends StatelessWidget {
  const CreateBlogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = Provider.of<AppTheme>(context);
    return Scaffold(
      appBar: const BlogAppBar(),
      body: HomeBackground(
        firstIcon: Icons.keyboard,
        isLoading: false,
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(25),
                    decoration: _boxDecoration(),
                    child: Column(children: [
                      Row(
                        children: [
                          Icon(
                            Icons.chat_rounded,
                            size: 50,
                            color: appTheme.gnrlColor,
                          ),
                          Separators.separatorH(5),
                          Text(
                            'Nuevo Blog',
                            style: Theme.of(context).textTheme.headlineMedium,
                          )
                        ],
                      ),
                      Separators.separatorV(10),
                      const CreateForm()
                    ]),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() => BoxDecoration(
          color: const Color.fromARGB(194, 255, 255, 255),
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, blurRadius: 20, offset: Offset(0, 8))
          ]);
}
