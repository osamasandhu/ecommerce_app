// import 'package:ecommerce_app/src/features/auth/view/sign_in_page.dart';
// import 'package:ecommerce_app/src/widgets/page_not_found.dart';
// import 'package:go_router/go_router.dart';
//
// const bool isLogin = true;
//
// final GoRouter routes = GoRouter(
//   errorBuilder: (_, s) => const PageNotFound(),
//   redirect: (c, s) {
//     if (isLogin) {
//       // return RouteNames.signup;
//       return '/sign_up';
//     } else {
//       return '/';
//     }
//   },
//   routes: [
//     GoRoute(
//       path: '/',
//       // name: RouteNames.signIn,
//       builder: (c, s) {
//         return const SignInPage();
//       },
//
//       ///Sub Routes
//       routes: [
//         ///Using Query Parameter
//         GoRoute(
//           path: 'sign_up',
//
//           ///Name is assigned to route
//           // name: RouteNames.signup,
//           builder: (context, state) {
//             ///Passing the parameters
//             return SignUpPage(
//                 // name: state.uri.queryParameters['name'],
//                 );
//           },
//         ),
//
//         ///Using Simple Parameter
//         // GoRoute(
//         //   path: 'sign_up/:name',
//         //
//         //   ///Name is assigned to route
//         //   name: RouteNames.signup,
//         //   builder: (context, state) {
//         //     ///Passing the parameters
//         //     return SignUpPage(
//         ///Exclamation Mark("!") used to define that the parameter will not be null
//         //     name: state.pathParameters['name']!
//         //     );
//         //   },
//         // ),
//       ],
//     ),
//
//     // GoRoute(
//     //   path: '/sign_up/:name',
//     //   name: 'signUp',
//     //   builder: (context, state) {
//     //     ///Passing the parameters
//     //     return SignUpPage(name: state.pathParameters['name']!);
//     //   },
//     // ),
//   ],
// );
