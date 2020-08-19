import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:instagram_redesign/core/theme/theme_dark.dart';
import 'package:instagram_redesign/core/theme/theme_light.dart';

class DialogConfig extends StatefulWidget {
  @override
  _DialogConfigState createState() => _DialogConfigState();
}

class _DialogConfigState extends State<DialogConfig> {
  bool activeThemeDark = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              color: Colors.transparent,
              child: Text(
                'Visualização',
                style: GoogleFonts.robotoCondensed(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                _configOptions('Largo', '1'),
                SizedBox(width: 5),
                _configOptions('Limpo', '2'),
                SizedBox(width: 5),
                _configOptions('Antigo', '3'),
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _configSwitchs('Horizontal', isActive: false),
              _configSwitchs('Chat Rápido', isActive: false),
              GestureDetector(
                onTap: () {
                  setState(() {
                    activeThemeDark = !activeThemeDark;

                    print(activeThemeDark);
                  });
                  activeThemeDark
                      ? Get.changeTheme(AppThemeDark().getTheme())
                      : Get.changeTheme(AppThemeLight().getTheme());
                },
                child: _configSwitchs(
                  'Dark Mode',
                  isActive: activeThemeDark,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Row _configSwitchs(String nameConfig, {Function onChanged, bool isActive}) {
    print(isActive);
    return Row(
      children: [
        Material(
          color: Colors.transparent,
          child: Text(
            nameConfig,
            style: GoogleFonts.robotoCondensed(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        CupertinoSwitch(
          value: isActive,
          activeColor: Colors.white.withOpacity(0.7),
          trackColor: Colors.grey[600].withOpacity(0.7),
          onChanged: (value) => onChanged,
        ),
      ],
    );
  }

  Column _configOptions(String nameConf, String numberConf) {
    return Column(
      children: [
        Container(
          width: 55,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            border: Border.all(
              color: Colors.white,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          child: Center(
            child: Material(
              color: Colors.transparent,
              child: Text(
                numberConf,
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        Material(
          color: Colors.transparent,
          child: Text(
            nameConf,
            style: GoogleFonts.robotoCondensed(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
