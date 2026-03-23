import 'package:go_router/go_router.dart';

import '../features/auth/screens/login_page.dart';
import '../features/products/pages/product_detail_page.dart';
import '../features/products/pages/products_page.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/products',
      builder: (context, state) => const ProductsPage(),
    ),
    GoRoute(
      path: '/product/:id',
      builder: (context, state) => ProductDetailPage(
        id: int.parse(state.pathParameters['id']!),
      ),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
  ],
);
