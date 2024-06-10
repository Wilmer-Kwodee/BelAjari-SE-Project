import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app_testing/screens/components/auth/otp_page.dart';
import 'package:flutter_app_testing/screens/components/user/tutor/upload_documents.dart';
import 'package:flutter_app_testing/screens/main/home_screen.dart';
import 'package:flutter_app_testing/screens/wrapper/auth_wrapper.dart';
import 'package:flutter_app_testing/screens/wrapper/route_wrapper.dart';
import 'firebase_options.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomeScreen(),
      // home: const PhoneOTPVerification(), 
      home: AuthWrapper(), 
      // home: UploadDocuments(),
      routes: RouteWrapper.routes,
    );
  }
}
