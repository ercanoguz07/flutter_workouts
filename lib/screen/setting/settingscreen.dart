import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../constants.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: linearBoxDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: kDefaultSize * 2),
            SettingHeader(),
            Expanded(
              child: Container(
                decoration: borderTopLRBoxDec,
                child: SettingsList(
                  platform: DevicePlatform.android,
                  sections: [
                    SettingsSection(
                      title: Text('Common'),
                      tiles: <SettingsTile>[
                        SettingsTile.navigation(
                          leading: Icon(Icons.language),
                          title: Text('Language'),
                          value: Text('English'),
                        ),
                        SettingsTile.switchTile(
                          onToggle: (value) {},
                          initialValue: true,
                          leading: Icon(Icons.format_paint),
                          title: Text('Enable custom theme'),
                        ),
                      ],
                    ),
                    SettingsSection(
                      margin: EdgeInsetsDirectional.only(top: 80),
                      title: Text('Thema'),
                      tiles: <SettingsTile>[
                        SettingsTile.navigation(
                          leading: Icon(Icons.theater_comedy),
                          title: Text('Theme'),
                          value: Text('Default'),
                        ),
                        SettingsTile.switchTile(
                          onToggle: (value) {},
                          initialValue: true,
                          leading: Icon(Icons.format_paint),
                          title: Text('Enable custom theme'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SettingHeader extends StatelessWidget {
  const SettingHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kDefaultSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios,
                      color: Colors.white, size: kDefaultSize * 1.7)),
              Text(
                AppLocalizations.of(context)!.setting,
                style:
                    TextStyle(color: Colors.white, fontSize: kDefaultSize * 2),
              ),
            ],
          ),
          SizedBox(height: kDefaultSize / 2),
        ],
      ),
    );
  }
}
