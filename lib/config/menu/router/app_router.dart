import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/counter/counter_screen.dart';

import '../../../presentation/screens/screens.dart';

// GoRouter configuration
final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/counter',
    builder: (context, state) => const CounterScreen(),
  ),
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/buttons',
    builder: (context, state) => const ButtonsScreen(),
  ),
  GoRoute(
    path: '/cards',
    builder: (context, state) => const CardsScreen(),
  ),
  GoRoute(
    path: '/progress',
    builder: (context, state) => const ProgressScreen(),
  ),
  GoRoute(
    path: '/snackbars',
    builder: (context, state) => const SnackbarScreen(),
  ),
  GoRoute(
    path: '/animated',
    builder: (context, state) => const AnimatedScreen(),
  ),
  GoRoute(
    path: '/ui-controls',
    builder: (context, state) => const UiControlsScreen(),
  ),
  GoRoute(
    path: '/tutorial',
    builder: (context, state) => const AppTutorialScreen(),
  ),
  GoRoute(
    path: '/infinite',
    builder: (context, state) => const InfiniteScrollScreen(),
  ),
]);
