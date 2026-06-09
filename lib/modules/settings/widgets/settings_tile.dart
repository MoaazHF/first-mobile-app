import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SettingsTile extends StatelessWidget{
  const SettingsTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });
final String title;
final IconData icon;
final VoidCallback onTap;

@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      leading: Icon(icon),
      title:Text(title),
      trailing:const Icon(Icons.arrow_forward_ios,size:14) ,
      onTap: onTap,

    );
  }

}