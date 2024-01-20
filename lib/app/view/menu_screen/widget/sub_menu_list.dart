import 'package:flutter_apps/app/core/utils/common_functions.dart';
import 'package:flutter_apps/app/provider/menu_provider.dart';
import 'package:flutter_apps/app/view/menu_screen/widget/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SubMenuList extends StatelessWidget {
  const SubMenuList({
    super.key,
    required this.labels,
    required this.routes,
    required this.isSelectedSubMenuItem,
    required this.selectedSubMenuItemIndex, required this.maxWidth,
  });

  final List<String> labels;
  final List<String> routes;
  final bool isSelectedSubMenuItem;
  final int selectedSubMenuItemIndex;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List<Widget>.generate(
        labels.length,
            (index) {
          final bool isSelectedItem = isSelectedSubMenuItem && (selectedSubMenuItemIndex == index);
          return Container(
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap: () {
                CommonFunctions().clearALLData(context: context);
                MenuProvider menuProvider = Provider.of<MenuProvider>(context, listen: false);
                menuProvider.setSelectedSubMenuIndex = index;
                GoRouter.of(context).go(routes[index]);
              },
              child: MenuItem(
                label: labels[index],
                isSelectedItem: isSelectedItem,
                margin: EdgeInsets.only(
                  left: (maxWidth >= 700 && maxWidth <= 940) ? 0 : 40,
                  top: 4,
                  bottom: 4,
                ),
                textStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
