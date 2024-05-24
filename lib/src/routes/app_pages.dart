enum AppPages {
  signIn(name: 'signIn', path: '/'),
  signUp(name: 'signUp', path: '/signUp'),
  category(name: 'categories', path: '/categories'),
  products(name: 'products', path: '/products/category/:categoryName'),
  productDetails(name: 'productDetail', path: '/product/:id'),
  cart(name: 'cart', path: '/cart'),
  home(name: 'home', path: '/home'),
  dummyA(name: 'dummyA', path: '/dummyA'),
  dummyB(name: 'dummyB', path: '/dummyB'),
  dummyC(name: 'dummyC', path: '/dummyC'),
  detailScreen(name: 'detail', path: 'detail');

  const AppPages({
    required this.name,
    required this.path,
  });

  final String name;
  final String path;

  static List<AppPages> get bottomPages {
    return [dummyA, dummyB, dummyC];
  }
}
