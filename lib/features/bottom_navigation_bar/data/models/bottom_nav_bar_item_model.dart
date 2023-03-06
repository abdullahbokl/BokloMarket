import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:boklo_mart/core/utils/app_colors.dart';

class BottomNavBarItemModel extends PersistentBottomNavBarItem {
  BottomNavBarItemModel({
    required super.icon,
    super.title,
    super.activeColorPrimary = AppColors.secondaryColor,
    super.inactiveColorPrimary = AppColors.blackHintColor,
  });
}