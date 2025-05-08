import 'package:flutter/material.dart';

class LanguageOptionEnglish extends StatelessWidget {
  const LanguageOptionEnglish({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          child: Text(
            "English",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        SizedBox(width: 10),
        SizedBox(
          width: 30,
          height: 30,
          child: Image.asset(
            'icons/flags/png100px/us.png',
            package: 'country_icons',
          ),
        ),
      ],
    );
  }
}
