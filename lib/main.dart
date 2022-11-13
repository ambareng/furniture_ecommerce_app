import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:furniture_ecommerce_app/core/auth/bloc/auth_bloc.dart';
import 'package:furniture_ecommerce_app/core/auth/repositories/auth_repo.dart';
import 'package:furniture_ecommerce_app/core/auth/screens/auth_loading_screen.dart';
import 'package:furniture_ecommerce_app/core/loading/screens/loading_screen.dart';
import 'package:furniture_ecommerce_app/features/auth/screens/login_screen.dart';
import 'package:furniture_ecommerce_app/features/auth/screens/signup_screen.dart';
import 'package:furniture_ecommerce_app/features/bottom_navbar/bloc/bottom_navbar_bloc.dart';
import 'package:furniture_ecommerce_app/features/favorites/screens/favorites_screen.dart';
import 'package:furniture_ecommerce_app/features/furniture/bloc/furniture_bloc.dart';
import 'package:furniture_ecommerce_app/features/furniture/bloc/furniture_order_quantity_bloc.dart';
import 'package:furniture_ecommerce_app/features/furniture/screens/furniture_screen.dart';
import 'package:furniture_ecommerce_app/features/home/repositories/furniture_repo.dart';
import 'package:furniture_ecommerce_app/features/home/screens/home_screen.dart';
import 'package:furniture_ecommerce_app/features/onboarding/screens/onboarding_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepo(),
        ),
        RepositoryProvider(
          create: (context) => FurnitureRepo(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AuthBloc(authRepo: RepositoryProvider.of<AuthRepo>(context))
                  ..add(AuthLoadAuthenticationEvent()),
          ),
          BlocProvider(
              create: (context) => FurnitureBloc(
                  repo: RepositoryProvider.of<FurnitureRepo>(context),
                  authRepo: RepositoryProvider.of<AuthRepo>(context))),
          BlocProvider(create: (context) => FurnitureOrderQuantityBloc()),
          BlocProvider(create: ((context) => BottomNavbarBloc()))
        ],
        child: MaterialApp(
            theme: ThemeData(
                textTheme:
                    GoogleFonts.gelasioTextTheme(Theme.of(context).textTheme)),
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: {
              '/': (context) => const AuthLoadingScreen(),
              '/onboarding': (context) => const OnboardingScreen(),
              '/login': (context) => const LoginScreen(),
              '/signup': (context) => const SignupScreen(),
              '/home': (context) => const HomeScreen(),
              '/furniture': (context) => const FurnitureScreen(),
              '/favorites': (context) => const FavoritesScreen(),
              '/loading': (context) => const LoadingScreen(),
            }),
      ),
    );
  }
}
