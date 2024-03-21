import 'package:flutter/material.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ProductsService())],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Products App',
        initialRoute: 'home',
        routes: {
          'login': (_) => const LoginScreen(),
          'home': (_) => const HomeScreen(),
          'product': (_) => const ProductScreen()
        },
        theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: Colors.grey[300],
            appBarTheme: const AppBarTheme(
                elevation: 0,
                color: Colors.indigo,
                titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
                centerTitle: true),
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.deepPurple)));
  }
}
