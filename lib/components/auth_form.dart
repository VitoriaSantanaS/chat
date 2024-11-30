import 'package:chat/models/auth_form_data.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  final void Function(AuthFormData) onSubmit;

  const AuthForm({ super.key, required this.onSubmit});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _formData = AuthFormData();

  void _submit() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if(!isValid) return;
    
    widget.onSubmit(_formData);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              if (_formData.isRegister)
                TextFormField(
                    key: const ValueKey('name'),
                    initialValue: _formData.name,
                    onSaved: (value) => _formData.name = value!,
                    decoration: const InputDecoration(labelText: 'Nome'),
                    validator: (valor) {
                      final name = valor ?? '';
                      if (name.trim().length < 4) {
                        return 'Nome precisa ter pelo menos 4 caracteres';
                      }
                      return null;
                    },
                  ),
              TextFormField(
                  key: const ValueKey('email'),
                  initialValue: _formData.email,
                  onSaved: (value) => _formData.email = value!,
                  decoration: const InputDecoration(labelText: 'E-mail'),
                  validator: (valor) {
                    final email = valor ?? '';
                    if (!email.contains('@')) {
                      return 'E-mail inválido';
                    }
                    return null;
                   },
                  ),
              TextFormField(
                  key: const ValueKey('password'),
                  initialValue: _formData.password,
                  onSaved: (value) => _formData.password = value!,
                  decoration: const InputDecoration(labelText: 'Senha'),
                  obscureText: true,
                  validator: (valor) {
                    final password = valor ?? '';
                    if (password.length < 6) {
                      return 'Senha deve ter no mínimo 6 caracteres';
                    }
                    return null;
                   },
                  ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                ),
                child: Text(_formData.isLogin ? 'Entrar' : 'Cadastrar'),
              ),
              const SizedBox(height: 5),
              TextButton(
                onPressed: () => setState(() => _formData.toggleMode()),
                child: Text(_formData.isLogin ? 'Criar uma nova conta' : 'Já possui uma conta?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
