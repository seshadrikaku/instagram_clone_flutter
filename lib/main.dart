import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/firebase_options.dart';
import 'package:instagram_clone/ui/screen/home_navigator/home_navigator.dart';
import 'package:instagram_clone/ui/screen/login/login_screen.dart';
import 'package:instagram_clone/ui/screen/profile/profile.dart';
// import 'package:instagram_clone/ui/screen/signup/signup_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      ),
      home: HomeNavigatorScreen(),
    );
    // home: StreamBuilder(
    //   stream: FirebaseAuth.instance.authStateChanges(),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.active) {
    //       if (snapshot.hasData) {
    //         return const HomeNavigatorScreen();
    //       } else if (snapshot.hasError) {
    //         return const Center(
    //           child: Text("Something went wrong"),
    //         );
    //       }
    //     }

    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const Center(
    //         child: CircularProgressIndicator(
    //           color: Colors.white,
    //         ),
    //       );
    //     }
    //     return const LoginScreen();
    //   },
    // ));
  }
}
