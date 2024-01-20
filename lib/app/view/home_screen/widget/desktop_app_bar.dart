import 'package:flutter_apps/app/core/utils/assets_path.dart';
import 'package:flutter_apps/app/core/utils/screen_sizes.dart';
import 'package:flutter_apps/app/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class DesktopAppBar extends StatefulWidget {
  const DesktopAppBar({Key? key}) : super(key: key);

  @override
  State<DesktopAppBar> createState() => _DesktopAppBarState();
}

class _DesktopAppBarState extends State<DesktopAppBar> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: themeProvider.colorScheme?.background,
      alignment: Alignment.center,
      child: SizedBox(
        width: getCardWidth(screenWidth: screenWidth) + 20,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: SvgPicture.asset(
                Assets.karkinosLogo,
                fit: BoxFit.contain,
                width: 60,
                height: 20,
                colorFilter: ColorFilter.mode(themeProvider.colorScheme!.primary, BlendMode.srcIn),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
