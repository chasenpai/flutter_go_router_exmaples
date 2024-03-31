import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_samples/layout/default_layout.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              context.go('/basic'); //path
            },
            child: Text('Go Basic Screen',),
          ),
          ElevatedButton(
            onPressed: () {
              context.goNamed('named_screen'); //name
            },
            child: Text('Go Named Screen',),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/push'); //name
            },
            child: Text('Go Push Screen',),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/pop'); //name
            },
            child: Text('Go Pop Screen',),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/path_param/123'); //name
            },
            child: Text('Go Path Param',),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/query_param'); //name
            },
            child: Text('Go Query Param',),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/nested/a'); //name
            },
            child: Text('Go Nested Screen',),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/login'); //name
            },
            child: Text('Go Login Screen',),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/login2'); //name
            },
            child: Text('Go Login2 Screen',),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/transition'); //name
            },
            child: Text('Go Transition Screen',),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/error'); //name
            },
            child: Text('Go Error Screen',), //404
          ),
        ],
      ),
    );
  }
}
