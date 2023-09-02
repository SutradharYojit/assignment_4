import 'package:assignment_4/routes/routes_name.dart';
import 'package:go_router/go_router.dart';
import '../view/view.dart';

GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: RoutesName.splashScreen,
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: RoutesName.dashboardScreen,
      builder: (context, state) {
        return DashBoardScreen();
      },
    ),
    GoRoute(
      path: RoutesName.homeScreen,
      builder: (context, state) {
        return const MyHomePage();
      },
    ),
  ],
);
