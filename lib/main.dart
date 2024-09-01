import 'package:ecommerce_application/firebase_options.dart';
import 'package:ecommerce_application/pages/others/splash_screen.dart';
import 'package:ecommerce_application/services/blocs/auth_bloc/auth_bloc.dart';
import 'package:ecommerce_application/services/blocs/cart_bloc/cart_bloc.dart';
import 'package:ecommerce_application/services/blocs/categories_bloc/categories_bloc.dart';
import 'package:ecommerce_application/services/blocs/home_bloc/home_bloc.dart';
import 'package:ecommerce_application/services/blocs/home_page_bloc/home_page_bloc.dart';
import 'package:ecommerce_application/services/blocs/wish_list_bloc/wish_list_bloc.dart';
import 'package:ecommerce_application/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          create: (context) => HomePageBloc(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => CategoriesBloc(),
        ),
        BlocProvider(
          create: (context) => WishListBloc(),
        ),
        BlocProvider(
          create: (context) => CartBloc(),
        ),
      ],
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return MaterialApp(
            title: "QuickMart",
            home: const SplashScreen(),
            themeMode: context.watch<HomeBloc>().themeMode,
            darkTheme: ThemeData(
              fontFamily: "PlusJakartaSans",
              brightness: Brightness.dark,
              appBarTheme:
                  const AppBarTheme(backgroundColor: BAppColors.blackColor),
              scaffoldBackgroundColor: BAppColors.blackColor,
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: BAppColors.blackColor,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: BAppColors.whiteColor,
                unselectedItemColor: BAppColors.grey150Color,
                landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
              ),
            ),
            theme: ThemeData(
              fontFamily: "PlusJakartaSans",
              brightness: Brightness.light,
              scaffoldBackgroundColor: BAppColors.whiteColor,
              appBarTheme:
                  const AppBarTheme(backgroundColor: BAppColors.whiteColor),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: BAppColors.whiteColor,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: BAppColors.blackColor,
                unselectedItemColor: BAppColors.grey150Color,
                landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
              ),
            ),
          );
        },
      ),
    );
  }
}
