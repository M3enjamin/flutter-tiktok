import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_tiktok/themes/colors.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          AppLocalizations.of(context).following,
          style: TextStyle(
            color: white.withOpacity(0.7),
            fontSize: 16,
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          "|",
          style: TextStyle(
            color: white.withOpacity(0.3),
            fontSize: 17,
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          AppLocalizations.of(context).for_you,
          style: TextStyle(
              color: white, fontSize: 17, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
