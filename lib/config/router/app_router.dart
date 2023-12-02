import 'package:go_router/go_router.dart';
import 'package:teslo_shop/features/auth/auth.dart';
import 'package:teslo_shop/features/products/presentation/screens/screens.dart';
import 'package:teslo_shop/features/products/presentation/widgets/product_card.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [

    ///* Auth Routes
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),

    ///* Product Routes
    GoRoute(
      path: '/',
      builder: (context, state) => const ProductsScreen(),
    ),
    GoRoute(
      path: '/product/:id',
      builder: (context, state) => ProductScreen(
        productId: state.params['id'] ?? 'no-id',
      ),
    ),
  ],
  ///! TODO: Bloquear si no se está autenticado de alguna manera
);