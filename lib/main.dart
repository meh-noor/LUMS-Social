import 'package:flutter/material.dart';
import 'package:lums_social_app2/firebase_options.dart';
import 'package:lums_social_app2/models/user.dart';
import 'package:lums_social_app2/screens/Admin/adminDashboard.dart';
import 'package:lums_social_app2/screens/auth/forgetPasswordRedirect.dart';
import 'package:lums_social_app2/screens/auth/registerUserDetails.dart';

import 'package:lums_social_app2/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lums_social_app2/services/auth.dart';
import 'package:lums_social_app2/splash.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      initialData: null,
      value: AuthService().user,
      child:  MaterialApp(
        // home: Wrapper(),
        home: Splash(),
        // home: admin(),
        // home: RegisterDetails(),
        // home: forgetPasswordRedirect(myEmail:"fawaz@gmail.com"),
      ),
    );
  }
}
