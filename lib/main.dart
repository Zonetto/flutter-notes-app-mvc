import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'view/home_layout_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          titleSpacing: 20.0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
          titleTextStyle: TextStyle(
            color: Color(0xFFEF5B0C),
            fontSize: 20.0,
          ),
          iconTheme: IconThemeData(
            color: Color(
              0xFFEF5B0C,
            ),
          ),
          centerTitle: false,
          backgroundColor: Colors.white,
          elevation: 1.0,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFFEF5B0C),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showSelectedLabels: true,
          showUnselectedLabels: false,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          elevation: 20.0,
          selectedItemColor: Color(0xFFEF5B0C),
          unselectedItemColor: Colors.grey,
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      home: const HomeLayoutScreen(),
    );
  }
}
