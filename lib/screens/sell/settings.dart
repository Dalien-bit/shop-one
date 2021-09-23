import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopone/screens/login_screen.dart';
import 'package:shopone/widgets/add_product_bill.dart';

class Settings extends StatelessWidget {
  static const routeName = '/settings';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        //color: Colors.black45,
        padding: EdgeInsets.all(8),
        child: ListView(
          children: <Widget>[
            const ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.black,
              ),
              title: Text('Profile'),
              //tileColor: Colors.grey,
            ),
            const Divider(
              height: 10,
              color: Colors.black,
            ),
            ListTile(
              leading: Icon(
                Icons.format_list_bulleted,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.of(context).restorablePush(_dialogBuilder);
              },
              title: Text("Options"),
              //tileColor: Colors.grey,
            ),
            const Divider(
              height: 10,
              color: Colors.black,
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.black,
              ),
              title: Text('Log Out'),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (Route<dynamic> route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}

Route<Object?> _dialogBuilder(BuildContext context, Object? arguments) {
  return DialogRoute<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: TryingTypeAhead(),
      );
    },
  );
}
