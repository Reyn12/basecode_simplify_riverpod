import 'package:go_router/go_router.dart';

import '../features/auth/screens/login_page.dart';
import '../features/products/pages/products_page.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ProductsPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
  ],
);
