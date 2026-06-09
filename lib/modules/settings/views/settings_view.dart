import 'package:flutter/material.dart';
import 'package:robin_food_practice/modules/settings/widgets/settings_tile.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
    child: ListView(
      children: [
        SettingsTile(title: 'Settings',icon:Icons.arrow_forward_ios,onTap: ()=>{},)
      ],
    ),
    );
 }

}
