import 'dart:developer';

import 'package:flutter_apps/app/core/utils/assets_path.dart';
import 'package:flutter_apps/app/core/utils/common_functions.dart';
import 'package:flutter_apps/app/core/utils/constants.dart';
import 'package:flutter_apps/app/core/utils/screen_sizes.dart';
import 'package:flutter_apps/app/provider/menu_provider.dart';
import 'package:flutter_apps/app/provider/theme_provider.dart';
import 'package:flutter_apps/app/view/menu_screen/widget/menu_item.dart';
import 'package:flutter_apps/app/view/menu_screen/widget/sub_menu_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key, required this.maxWidth});
  final double maxWidth;

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> with TickerProviderStateMixin {
  List<AnimationController> _animationControllers = [];
  List<Animation<double>> _animationList = [];
  Map<String, dynamic> menuList = {
    "Movies": {
      "icon": Assets.moviesIcon,
      "labels": ["Popular", "Top Rated", "Now Playing"],
      "mainRoutes": "/dashboard/movies/popular",
      "routes": ["/dashboard/movies/popular", "/dashboard/movies/topRated", "/dashboard/movies/nowPlaying"],
    },
    "TV Series": {
      "icon": Assets.tvSeriesIcon,
      "labels": ["Popular", "Top Rated", "Now Playing"],
      "mainRoutes": "/dashboard/tvSeries/popular",
      "routes": ["/dashboard/tvSeries/popular", "/dashboard/tvSeries/topRated", "/dashboard/tvSeries/nowPlaying"],
    },
    "Celebrities": {
      "icon": Assets.celebritiesIcon,
      "labels": ["Popular", "Top Rated"],
      "mainRoutes": "/dashboard/celebrities/popular",
      "routes": ["/dashboard/celebrities/popular", "/dashboard/celebrities/topRated"],
    }
  };

  @override
  void initState() {
    super.initState();
    generateControllers();
  }

  generateControllers() {
    /// Create animation controllers for each main menu
    _animationControllers = List.generate(
        menuList.length,
            (index) => AnimationController(
          duration: const Duration(milliseconds: 600),
          vsync: this,
        ));

    _animationList = List.generate(
        menuList.length,
            (index) => CurvedAnimation(
          parent: _animationControllers[index],
          curve: Curves.fastOutSlowIn,
        ));
  }

  @override
  void dispose() {
    /// Dispose controllers to avoid memory leaks
    for (AnimationController controller in _animationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    bool isDesktopScreen = isDesktop(screenWidth: widget.maxWidth);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "ABHA",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontFamily: Constants.montserratSemiBold),
            ),
            Visibility(
              visible: !isDesktopScreen,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SvgPicture.asset(
                    Assets.closeIcon,
                    fit: BoxFit.contain,
                    width: 30,
                    height: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Consumer<MenuProvider>(builder: (context, menuProvider, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List<Widget>.generate(
              menuList.length,
                  (index) {
                final String menuLabel = menuList.keys.elementAt(index);

                final Map<String, dynamic> itemMapObject = menuList.values.elementAt(index);
                final String icon = itemMapObject["icon"];

                /// Converting List<dynamic> to List<String>
                List<dynamic> dynamicSubMenuList = itemMapObject["labels"];
                List<String> subMenuList = dynamicSubMenuList.map((element) => element.toString()).toList();
                List<dynamic> dynamicRoutesList = itemMapObject["routes"];
                List<String> routesList = dynamicRoutesList.map((element) => element.toString()).toList();
                String mainScreen = itemMapObject["mainRoutes"];
                bool isSelectedItem = menuProvider.selectedMenuIndex == index;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () async {
                        log("Main URL: $mainScreen");
                        CommonFunctions().clearALLData(context: context);
                        GoRouter.of(context).go(mainScreen);
                        for (int i = 0; i < _animationControllers.length; i++) {
                          if (i != index) {
                            _animationControllers[i].reverse();
                          }
                        }
                        _animationControllers[index].isDismissed ? _animationControllers[index].forward() : _animationControllers[index].reverse();
                        menuProvider.setSelectedMenuIndex = index;
                        menuProvider.setSelectedSubMenuIndex = 0;
                      },
                      child: MenuItem(
                        label: menuLabel,
                        isSelectedItem: isSelectedItem,
                        icon: icon,
                        textStyle: themeProvider.titleMedium!,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizeTransition(
                      sizeFactor: _animationList[index],
                      axis: Axis.vertical,
                      axisAlignment: 1,
                      child: SubMenuList(
                        labels: subMenuList,
                        maxWidth: widget.maxWidth,
                        routes: routesList,
                        isSelectedSubMenuItem: isSelectedItem,
                        selectedSubMenuItemIndex: menuProvider.selectedSubMenuIndex,
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        }),
        const SizedBox(height: 20),
      ],
    );
  }
}
