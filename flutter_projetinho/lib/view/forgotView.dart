// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore: use_key_in_widget_constructors
class ForgotPasswordView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();

    void sucesso(BuildContext context, String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.green,
        ),
      );
    }

    void erro(BuildContext context, String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
        ),
      );
    }

    void esqueceuSenha(BuildContext context, String email) {
      if (email.isNotEmpty) {
        FirebaseAuth.instance.sendPasswordResetEmail(
          email: email,
        );
        sucesso(context, 'E-mail de recuperação enviado com sucesso.');
      } else {
        erro(context, 'Informe o e-mail para recuperar a senha.');
      }
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Esqueceu a Senha'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                esqueceuSenha(context, emailController.text);
              },
              style: ElevatedButton.styleFrom(
                // ignore: deprecated_member_use
                primary: Colors.orange,
              ),
              child: const Text('Recuperar Senha'),
            ),
          ],
        ),
      ),
    );
  }
}
