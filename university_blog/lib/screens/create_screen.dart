import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_blog/theme/app_theme.dart';
import 'package:university_blog/ui/separators.dart';

import '../providers/providers.dart';
import '../ui/input_decorations.dart';
import '../widgets/widgets.dart';

class CreateBlogScreen extends StatefulWidget {
  const CreateBlogScreen({Key? key}) : super(key: key);

  @override
  State<CreateBlogScreen> createState() => _CreateBlogScreenState();
}

class _CreateBlogScreenState extends State<CreateBlogScreen> {
  String selectedCurse = 'Selecciona el Curso';
  String selectedTeacher = '';
  @override
  Widget build(BuildContext context) {
    final CursesProvider cursesProvider = Provider.of<CursesProvider>(context);
    final TeachersProvider teachersProvider =
        Provider.of<TeachersProvider>(context);
    return Scaffold(
      appBar: const BlogAppBar(),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            padding: const EdgeInsets.all(25),
            decoration: _boxDecoration(),
            child: Column(children: [
              Row(
                children: [
                  const Icon(
                    Icons.chat_rounded,
                    size: 50,
                    color: AppTheme.primary,
                  ),
                  Separators.separatorH(5),
                  Text(
                    'Nuevo Blog',
                    style: Theme.of(context).textTheme.headlineMedium,
                  )
                ],
              ),
              Separators.separatorV(10),
              Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (header) {
                          return header != null && header.length > 10
                              ? null
                              : 'El encabezado debe ser de mínimo 10 caracteres';
                        },
                        cursorColor: AppTheme.primary,
                        maxLength: 50,
                        initialValue: 'Gerencia estratégica efectiva',
                        decoration: InputDecorations.createInputDecoration(
                            hintText: '',
                            labelText: 'Frase que describe tu experiencia',
                            icon: Icons.sim_card_alert_outlined),
                      ),
                      Separators.separatorV(10),
                      TextFormField(
                        validator: (content) {
                          return content != null && content.length > 80
                              ? null
                              : 'El contenido debe ser de mínimo 80 caracteres';
                        },
                        cursorColor: AppTheme.primary,
                        maxLines: 4,
                        maxLength: 200,
                        initialValue:
                            'La gerencia es vital para el éxito empresarial, pero la efectividad varía según el liderazgo y la gestión de recursos.',
                        decoration: InputDecorations.createInputDecoration(
                            hintText: '',
                            labelText: 'Cuentanos tu historía',
                            icon: Icons.note_outlined),
                      ),
                      Separators.separatorV(10),
                      Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
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
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                        setState(() {
                                          selectedCurse = curse.name;
                                          selectedTeacher = teachersProvider
                                              .getName(curse.teacher);
                                        });
                                      },
                                      child: ListTile(
                                        title: Text(curse.name),
                                        subtitle: Text(teachersProvider
                                            .getName(curse.teacher)),
                                      ),
                                    ))
                                .toList()),
                      )
                    ],
                  ))
            ]),
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, blurRadius: 20, offset: Offset(0, 8))
          ]);
}
