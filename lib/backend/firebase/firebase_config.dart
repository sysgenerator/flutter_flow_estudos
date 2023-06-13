import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBcHrK_-33DolAeXjnTqtNmA26LhCYstts",
            authDomain: "dbmeuappcomlogin.firebaseapp.com",
            projectId: "dbmeuappcomlogin",
            storageBucket: "dbmeuappcomlogin.appspot.com",
            messagingSenderId: "753419047539",
            appId: "1:753419047539:web:337515faf54d36c02b1006"));
  } else {
    await Firebase.initializeApp();
  }
}
