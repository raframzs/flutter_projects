import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_blog/models/blog.dart';

import '../../providers/providers.dart';
import '../../theme/app_theme.dart';
import '../../ui/ui.dart';

class CreateForm extends StatefulWidget {
  const CreateForm({super.key});

  @override
  State<CreateForm> createState() => _CreateFormState();
}

class _CreateFormState extends State<CreateForm> {
  String selectedCurse = 'Selecciona el Curso';
  String selectedTeacher = '';
  late int _key;

  _collapse() {
    int newKey = 0;
    do {
      _key = Random().nextInt(10000);
    } while (newKey == _key);
  }

  @override
  void initState() {
    super.initState();
    _collapse();
  }

  final headerController = TextEditingController();
  final contentController = TextEditingController();
  String curseId = '';

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    headerController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CursesProvider cursesProvider = Provider.of<CursesProvider>(context);
    final BlogsProvider blogsProvider = Provider.of<BlogsProvider>(context);
    final TeachersProvider teachersProvider =
        Provider.of<TeachersProvider>(context);
    return Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              controller: headerController,
              validator: (header) {
                return header != null && header.length > 10
                    ? null
                    : 'Escribe mas: mínimo 10 caracteres';
              },
              cursorColor: AppTheme.primary,
              maxLength: 50,
              decoration: InputDecorations.createInputDecoration(
                  hintText: '',
                  labelText: 'Frase que describe tu experiencia',
                  icon: Icons.sim_card_alert_outlined),
            ),
            Separators.separatorV(10),
            TextFormField(
              controller: contentController,
              validator: (content) {
                return content != null && content.length > 80
                    ? null
                    : 'El contenido debe ser de mínimo 80 caracteres';
              },
              cursorColor: AppTheme.primary,
              maxLines: 4,
              maxLength: 200,
              decoration: InputDecorations.createInputDecoration(
                  hintText: '',
                  labelText: 'Cuentanos tu historía',
                  icon: Icons.note_outlined),
            ),
            Separators.separatorV(10),
            Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                  key: Key(_key.toString()),
                  iconColor: AppTheme.primary,
                  title: Text(
                    selectedCurse,
                    style: const TextStyle(color: AppTheme.primary),
                  ),
                  subtitle: Text(
                    selectedTeacher,
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  children: cursesProvider.curses
                      .map((curse) => GestureDetector(
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                              setState(() {
                                selectedCurse = curse.name;
                                selectedTeacher =
                                    teachersProvider.getName(curse.teacher);
                                curseId = curse.id!;
                                _collapse();
                              });
                            },
                            child: ListTile(
                              title: Text(curse.name),
                              subtitle:
                                  Text(teachersProvider.getName(curse.teacher)),
                            ),
                          ))
                      .toList()),
            ),

            // Submmit button
            _SubmmitButton(
                contentController: contentController,
                curseId: curseId,
                headerController: headerController,
                blogsProvider: blogsProvider)
          ],
        ));
  }
}

class _SubmmitButton extends StatelessWidget {
  const _SubmmitButton({
    required this.contentController,
    required this.curseId,
    required this.headerController,
    required this.blogsProvider,
  });

  final TextEditingController contentController;
  final String curseId;
  final TextEditingController headerController;
  final BlogsProvider blogsProvider;

  @override
  Widget build(BuildContext context) {
    UsersProvider usersProvider = Provider.of<UsersProvider>(context);
    BlogsProvider blogsProvider = Provider.of<BlogsProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: MaterialButton(
        onPressed: () async {
          Blog blog = Blog(
              content: contentController.text,
              created: DateTime.now(),
              curse: curseId,
              dislikes: 0,
              likes: 0,
              title: headerController.text,
              user: usersProvider.logged?.id);

          if (Blog.isOkBlog(blog)) {
            blogsProvider.saveBlog(blog);
            Navigator.pushNamed(context, Routes.homeScreen);
          }
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 0,
        disabledColor: Colors.grey,
        color: const Color(0xffe2001a),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: blogsProvider.isLoading
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Color(0xffe2001a),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                    Separators.separatorH(10),
                    const Text(
                      'Enviar',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
