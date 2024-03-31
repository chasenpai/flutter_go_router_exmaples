import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_samples/screen/basic_screen.dart';
import 'package:go_router_samples/screen/error_screen.dart';
import 'package:go_router_samples/screen/login_screen.dart';
import 'package:go_router_samples/screen/named_screen.dart';
import 'package:go_router_samples/screen/nested_child_screen.dart';
import 'package:go_router_samples/screen/nested_screen.dart';
import 'package:go_router_samples/screen/path_param_screen.dart';
import 'package:go_router_samples/screen/pop_base_screen.dart';
import 'package:go_router_samples/screen/pop_return_screen.dart';
import 'package:go_router_samples/screen/private_screen.dart';
import 'package:go_router_samples/screen/push_screen.dart';
import 'package:go_router_samples/screen/query_param_screen.dart';
import 'package:go_router_samples/screen/root_screen.dart';
import 'package:go_router_samples/screen/transition_screen_1.dart';
import 'package:go_router_samples/screen/transition_screen_2.dart';


final router = GoRouter(
  redirect: (context, state) { //GoRouterState.of(context)
    //return path -> 해당 route로 이동
    //return null -> 원래 이동하려던 route로 이동
    if(state.location == '/login/private' && !authState) {
      return '/login';
    }
    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return RootScreen();
      },
      routes: [
        GoRoute(
          path: 'basic',
          builder: (context, state) {
            return BasicScreen();
          },
        ),
        GoRoute(
          path: 'named',
          name: 'named_screen',
          builder: (context, state) {
            return NamedScreen();
          },
        ),
        GoRoute(
          path: 'push',
          builder: (context, state) {
            return PushScreen();
          },
        ),
        GoRoute(
          // /pop
          path: 'pop',
          builder: (context, state) {
            return PopBaseScreen();
          },
          routes: [
            GoRoute(
              // /pop/return
              path: 'return',
              builder: (context, state) {
                return PopReturnScreen();
              },
            ),
          ]
        ),
        GoRoute(
          path: 'path_param/:id', //:뒤의 값을 변수로
          builder: (context, state) {
            return PathParamScreen();
          },
          routes: [
            GoRoute(
              path: ':name',
              builder: (context, state) {
                return PathParamScreen();
              },
            ),
          ],
        ),
        GoRoute(
          path: 'query_param',
          builder: (context, state) {
            return QueryParamScreen();
          },
        ),
        ShellRoute(
          //child - GoRoute builder에서 반환해주는 위젯
          builder: (context, state, child) {
            return NestedScreen(child: child);
          },
          routes: [
            GoRoute(
              path: 'nested/a',
              builder: (context, state) {
                return NestedChildScreen(routeName: '/nested/a',);
              }
            ),
            GoRoute(
                path: 'nested/b',
                builder: (context, state) {
                  return NestedChildScreen(routeName: '/nested/b',);
                }
            ),
            GoRoute(
                path: 'nested/c',
                builder: (context, state) {
                  return NestedChildScreen(routeName: '/nested/c',);
                }
            ),
          ],
        ),
        GoRoute(
          path: 'login',
          builder: (context, state) {
            return LoginScreen();
          },
          routes: [
            GoRoute(
              path: 'private',
              builder: (context, state) {
                return PrivateScreen();
              },
            ),
          ],
        ),
        GoRoute(
          path: 'login2',
          builder: (context, state) {
            return LoginScreen();
          },
          routes: [
            GoRoute(
              path: 'private',
              builder: (context, state) {
                return PrivateScreen();
              },
              //route level redirection
              //현재 이 route로 이동하려고 할 때 적용
              redirect: (context, state) {
                if(!authState) {
                  return '/login2';
                }
                return null;
              }
            ),
          ],
        ),
        GoRoute(
          path: 'transition',
          builder: (context, state) {
            return TransitionScreen1();
          },
          routes: [
            GoRoute(
              path: 'detail',
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  transitionDuration: Duration(seconds: 2),
                  child: TransitionScreen2(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation, //0 ~> 1
                      child: child,
                    );
                    // return ScaleTransition(
                    //   scale: animation,
                    //   child: child,
                    // );
                    // return RotationTransition(
                    //   turns: animation,
                    //   child: child,
                    // );
                  },
                );
              },
            ),
          ],
        ),
      ]
    ),
  ],
  errorBuilder: (context, state) { //error page
    return ErrorScreen(error: state.error.toString(),);
  },
  debugLogDiagnostics: true, //logging
);

bool authState = false;