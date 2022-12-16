import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_voucher/core/constants/app_colors.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'app_routers.dart';
import 'core/constants/app_routes.dart';
import 'initialize_app_services.dart';

void main() async {
  final container = ProviderContainer();
  await container.read(initializeAppServicesProvider).init();

  runApp(UncontrolledProviderScope(
    container: container,
    child: DevicePreview(
      enabled: false,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      theme: ThemeData(scaffoldBackgroundColor: AppColors.backgroundColor),

      builder: (context, child) {
        return ResponsiveWrapper.builder(
          Directionality(
            textDirection: TextDirection.rtl,
            child: child!
          ),

          defaultScale: true,
          breakpoints: [

            const ResponsiveBreakpoint.resize(350, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],

          breakpointsLandscape: [
            const ResponsiveBreakpoint.resize(500, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(812, name: MOBILE),
            const ResponsiveBreakpoint.resize(1024, name: TABLET),
            const ResponsiveBreakpoint.autoScale(1120, name: TABLET),
          ],
        );
      },

      onGenerateRoute: RoutesManager.routes,
      initialRoute: AppRoutes.dashboardRoute,

    );
  }
}