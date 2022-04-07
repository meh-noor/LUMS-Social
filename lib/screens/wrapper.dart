import 'package:flutter/material.dart';
import 'package:lums_social_app2/screens/auth/authenticate.dart';
import 'package:lums_social_app2/screens/home/home.dart';
import 'package:lums_social_app2/screens/event/Add_event.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return either Home or Authenticate Widget
    return add_event();
  }
}
