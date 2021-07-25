import 'package:demo1/routes/NavDrawerRoutes.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          _createHeader(),
          _createItem(
              text: "CounterPage",
              onTap: () =>
                  Navigator.of(context).pushNamed(NavDrawerRoutes.counterpage)),
          _createItem(
              text: "PageB",
              onTap: () =>
                  Navigator.of(context).pushNamed(NavDrawerRoutes.pageb))
        ],
      ),
    );
  }

  Widget _createHeader() {
    return UserAccountsDrawerHeader(
      accountName: Text("Freds Drawer"),
      accountEmail: Text("Freds E-Mail"),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.green,
        child: Text("F"),
      ),
    );
  }

  Widget _createItem(
      {required String text, required GestureTapCallback onTap}) {
    return ListTile(
      title: Text(text),
      trailing: Icon(Icons.arrow_forward),
      onTap: onTap,
    );
  }
}
