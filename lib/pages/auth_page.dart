import 'package:chat/components/auth_form.dart';
import 'package:chat/models/auth_form_data.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLoading = false;
  void _handleSubmit(AuthFormData formData) {
    setState(() => _isLoading = true);

    print('authData... ');
    print(formData.email);

    // setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
        body: 
          Stack(
            children: [
              Center(child: SingleChildScrollView(child: AuthForm(onSubmit: _handleSubmit)),
          ),
          if (_isLoading)
          Container(
            color: const Color.fromRGBO(0, 0, 0, 0.5),
            child: const Center( child: CircularProgressIndicator(),
           )
          )
        ],
      ),
    );
  }
}
