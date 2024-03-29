import 'package:flutter/material.dart';
import 'package:lums_social_app2/screens/Admin/addEvent.dart';
import 'package:lums_social_app2/screens/settings/editmainProfile.dart';
import 'package:lums_social_app2/models/user.dart';
import 'package:lums_social_app2/screens/auth/sign_in.dart';
import 'package:lums_social_app2/services/auth.dart';
import 'package:provider/provider.dart';

import '../../widget/button_widget.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    // print("reacherrrrrrrr");
    // print(user);

    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        title: const Text('LUMS Social'),
        backgroundColor: Colors.black,
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
              onPressed: () async {
                await _auth.signOut();
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignIn()));
              },
              icon: const Icon(Icons.person),
              label: const Text('Logout'))
        ],
      ),
      body: bismahTestButton(context),
    );
  }

  Widget bismahTestButton(context) => ButtonWidget(
      //  0xFF5DCAD1
      text: 'Test Button',
      onClicked: () async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddEvent()),
        );
      });
}
