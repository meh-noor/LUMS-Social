import 'package:flutter/material.dart';
import 'package:lums_social_app2/screens/settings/editmainProfile.dart';
import 'package:lums_social_app2/services/auth.dart';

import '../../widget/button_widget.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
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
          MaterialPageRoute(builder: (context) => const EditProfile()),
        );
      });
}
