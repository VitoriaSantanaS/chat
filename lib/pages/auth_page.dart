import 'package:chat/components/auth_form.dart';
import 'package:chat/models/auth_form_data.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  void _handleSubmit(AuthFormData formData) {
    print('authData... ');
    print(formData.email.toString());
  }

  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
        body: 
          Center(
            child: SingleChildScrollView(child: AuthForm(onSubmit: _handleSubmit)),
       ),
     );
   }
 }