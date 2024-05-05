import 'package:flutter/material.dart';
import 'package:instagram_clone/ui/router/auth_resolver.dart';
import 'package:instagram_clone/ui/router/routes.dart';
import 'package:instagram_clone/ui/screen/home/home_screen.dart';

class AppRouter {
  MaterialPageRoute onGenarateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      default:
        return MaterialPageRoute(builder: (_) => AuthResolverWidget());
    }
  }
}
