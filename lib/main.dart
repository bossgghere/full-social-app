import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/app.dart';
import 'package:social_media_app/config/firebase_options.dart';


void main() async {
  //fire base
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //runapp
  runApp( MyApp());
}


