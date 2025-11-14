import 'package:finpro/view/signup/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppScreenState createState() => MyAppScreenState();
}

class MyAppScreenState extends State<MyApp> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      overlayColor: Colors.grey.withOpacity(0.5),
      overlayWidget: const Center(
        child: CircularProgressIndicator(
          color: Color.fromRGBO(27, 18, 175, 1.0),
        ),
      ),
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Finqy App',
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,

          ),
         // primaryColor: const Color(0xFF1449FF),

          scaffoldBackgroundColor: const Color.fromRGBO(250, 251, 252, 1),
          appBarTheme: const AppBarTheme(elevation: 0.0),
        ),
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: Container(
              color: Colors.white,
              child: SafeArea(
                top: false,
                bottom: true,
                child: child!,
              ),
            ),
          );
        },
        home:  SplashScreen(),
      ),
    );
  }
}
