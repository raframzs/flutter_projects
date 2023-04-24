import 'package:flutter/material.dart';

import '../models/models.dart';

class LoginProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey();
  String email = '';
  String password = '';
  bool _isLoading = false;

  User? logged;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
