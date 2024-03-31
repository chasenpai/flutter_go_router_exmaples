import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_samples/layout/default_layout.dart';

class PushScreen extends StatelessWidget {
  const PushScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          //go - 스택이 상위 route를 위에 쌓인다
          // push -> basic
          // ['/', '/push', '/basic'] X
          // ['/', '/basic'] O
          ElevatedButton(
            onPressed: () {
              context.go('/basic');
            },
            child: Text('Go Basic',),
          ),
          //push - 스택이 현재 route위에 쌓인다
          ElevatedButton(
            onPressed: () {
              context.push('/basic');
            },
            child: Text('Push Basic',),
          ),
        ],
      ),
    );
  }
}
