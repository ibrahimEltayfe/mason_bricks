import 'package:flutter/material.dart';
import 'core/constants/app_routes.dart';
import 'features/auth/presentation/pages/decide_page.dart';
import 'features/auth/presentation/pages/login.dart';
import 'features/home/presentation/pages/home_base.dart';

class RoutesManager{

  static Route<dynamic> routes(RouteSettings settings){
    switch(settings.name){
      case AppRoutes.homeRoute:
        return MaterialPageRoute(
            builder: (_)=> HomeBase(),
            settings: settings
        );

      case AppRoutes.loginRoute:
        return MaterialPageRoute(
            builder: (_)=> LoginPage(),
            settings: settings
        );

      case AppRoutes.decideRoute:
        return MaterialPageRoute(
            builder: (_)=> DecidePage(),
            settings: settings
        );


      default: return MaterialPageRoute(
          builder: (_)=> UnExcepectedErrorPage(),
          settings: settings
      );
    }

  }
}

//todo:
class UnExcepectedErrorPage extends StatelessWidget {
  const UnExcepectedErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('UnExcepected Error'),
      ),
    );
  }
}
