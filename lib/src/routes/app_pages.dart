enum AppPages {
  signIn(name: 'signIn', path: '/'),
  signUp(name: 'signUp', path: '/signUp'),
  category(name: 'categories', path: '/categories'),
  products(name: 'products', path: '/products/category/:categoryName'),
  productDetails(name: 'productDetail', path: '/product/:id'),
  cart(name: 'cart', path: '/cart');

  const AppPages({
    required this.name,
    required this.path,
  });

  final String name;
  final String path;
}
