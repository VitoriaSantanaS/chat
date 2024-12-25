import 'dart:io';

enum AuthFormType {
  login,
  register,
}

class AuthFormData {
  String email = '';
  String password = '';
  String name = '';
  File? image;
  AuthFormType _mode = AuthFormType.login;

  bool get isLogin => _mode == AuthFormType.login;

  bool get isRegister => _mode == AuthFormType.register;

  void toggleMode() {
    _mode = isLogin ? AuthFormType.register : AuthFormType.login; 
  }
}
