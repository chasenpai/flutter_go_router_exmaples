import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_samples/layout/default_layout.dart';

class TransitionScreen2 extends StatelessWidget {
  const TransitionScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        body: Container(
          color: Colors.blue,
          child: ListView(
            children: [
              ElevatedButton(
                onPressed: () {
                  context.pop();
                },
                child: Text('Pop',),
              ),
            ],
          ),
        )
    );
  }
}
