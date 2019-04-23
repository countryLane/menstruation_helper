import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      semanticLabel: 'Drawer',
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            margin: const EdgeInsets.fromLTRB(6, 0, 6, 0),
            child: Align(
              alignment: Alignment.center,
              child: FlutterLogo(
                size: 50,
              ),
            ),
          ),
          ListTile(
            title: Text('皮肤'),
            leading: Icon(Icons.color_lens),
          ),
          ListTile(
            title: Text('语言'),
            leading: Icon(Icons.language),
          ),
          ListTile(
            title: Text('分享'),
            leading: Icon(Icons.share),
          )
        ],
      ),
    );
  }
}
