import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorScreen extends StatelessWidget {

  final String error;

  const ErrorScreen({
    required this.error,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ERROR'),
      ),
      body: ListView(
        children: [
          Text('Error: $error'),
          ElevatedButton(
            onPressed: () {
              context.go('/');
            },
            child: Text('Go Home',),
          ),
        ],
      ),
    );
  }
}
