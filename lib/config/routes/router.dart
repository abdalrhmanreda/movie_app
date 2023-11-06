import 'package:flutter/material.dart';
import 'package:movie_app/config/routes/routes_path.dart';
import 'package:movie_app/ui/features/authentication/presentation/screens/login_screen/presentation/screens/login_screen.dart';
import 'package:movie_app/ui/features/authentication/presentation/screens/register_screen/presentation/screens/register_screen.dart';
import 'package:movie_app/ui/features/movie_details/screens/movie_details_.dart';
import 'package:movie_app/ui/intro_screen/components/splash_screen_.dart';
import 'package:movie_app/ui/layout/screens/layout.dart';

Route? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RoutePath.splash:
      return MaterialPageRoute(builder: (context) => const SplashScreenView());
    case RoutePath.layout:
      return MaterialPageRoute(builder: (context) => const LayoutScreen());
    case RoutePath.movieDetails:
      return MaterialPageRoute(
          builder: (context) => const MovieDetailsScreen());
    case RoutePath.register:
      return MaterialPageRoute(builder: (context) => const RegisterScreen());
    case RoutePath.login:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
  }
}
