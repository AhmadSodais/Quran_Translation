import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_translation/view_models/bottom_nav_vm.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottom_nav_vm = Provider.of<BottomNavViewModel>(context);
    String title = bottom_nav_vm.screensTitles[bottom_nav_vm.currentIndex];
    return AppBar(
    
      title: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: Text(
           tr(title),
            key: ValueKey<String>(title),
          ),
        ),
      ),
      
      // centerTitle: centerTitle,
      // actions: actions,
      // leading: leading,
      // elevation: 0,
      // backgroundColor: Colors.transparent,
      // foregroundColor: Theme.of(context).colorScheme.onBackground,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
