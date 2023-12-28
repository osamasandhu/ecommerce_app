import 'package:ecommerce_app/src/components/auth/view/sign_in_page.dart';
import 'package:ecommerce_app/src/components/auth/view/sign_up_page.dart';
import 'package:ecommerce_app/src/components/cart/page/cart_page.dart';
import 'package:ecommerce_app/src/components/category/views/categories_page.dart';
import 'package:ecommerce_app/src/components/product/model/product_model.dart';
import 'package:ecommerce_app/src/components/product/page/product_detail_page.dart';
import 'package:ecommerce_app/src/components/product/page/products_list_page.dart';
import 'package:ecommerce_app/src/widgets/page_not_found.dart';
import 'package:ecommerce_app/src/helpers/route_names.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRoutes = GoRouter(
  errorBuilder: (c, i) => const PageNotFound(),
  routes: [
    ///SignIn Page
    GoRoute(
      path: '/',
      name: AppRoute.signIn,
      builder: (context, state) => const SignInPage(),
    ),

    ///SignUp Page
    GoRoute(
      path: '/signUp',
      name: AppRoute.signup,
      builder: (context, state) => const SignUpPage(),
    ),

    ///Categories Page
    GoRoute(
      path: '/category',
      name: AppRoute.category,
      builder: (context, state) => const CategoriesPage(),
    ),

    ///Showing the ProductDetail on the base of product id

    GoRoute(
      path: '/products/:id',
      name: AppRoute.productDetail,
      builder: (c, s) => ProductDetailPage(
        ///Passing Model
        // productModel: s.extra as ProductModel,

        id: int.parse(s.pathParameters['id']!),
      ),
    ),

    ///Showing the Products on the base of category name
    GoRoute(
      path: '/category/:categoryName',
      name: AppRoute.productList,
      builder: (c, s) => ProductsPage(
        categoryName: s.pathParameters['categoryName']!,
      ),
    ),

    ///Cart Page
    GoRoute(
      path: '/cart',
      builder: (c, s) => const CartPage(),
      name: AppRoute.cart,
    )
  ],
);
