import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:hippodeco/screen/about/about_view.dart';
import 'package:hippodeco/screen/home/ios_home_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HiddenDrawerMenuView extends StatefulWidget {
  const HiddenDrawerMenuView({super.key, required this.controller});
  final WebViewController controller;

  @override
  State<HiddenDrawerMenuView> createState() => _HiddenDrawerMenuViewState();
}

class _HiddenDrawerMenuViewState extends State<HiddenDrawerMenuView> {
  List<ScreenHiddenDrawer> _screens = [];

  @override
  void initState() {
    super.initState();
    _screens = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
            name: "Anasayfa",
            baseStyle: const TextStyle(),
            selectedStyle: const TextStyle()),
        IOSHomeView(
          controller: widget.controller,
        ),
      ),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: "Hakkımızda",
              baseStyle: const TextStyle(),
              selectedStyle: const TextStyle()),
          const AboutView()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: "Çıkış Yap",
              onTap: () {
                if (Platform.isAndroid) {
                  SystemNavigator.pop();
                } else if (Platform.isIOS) {
                  exit(0);
                }
              },
              baseStyle: const TextStyle(),
              selectedStyle: const TextStyle()),
          const SizedBox()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: HiddenDrawerMenu(
        disableAppBarDefault: false,
        backgroundColorAppBar: Colors.green,
        tittleAppBar: const SizedBox(),
        backgroundColorMenu: Colors.green.shade300,
        screens: _screens,
        initPositionSelected: 0,
      ),
    );
  }
}
