import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class IOSHomeView extends StatefulWidget {
  const IOSHomeView({super.key, required this.controller});
  final WebViewController controller;

  @override
  State<IOSHomeView> createState() => _IOSHomeViewState();
}

class _IOSHomeViewState extends State<IOSHomeView> {
  @override
  void dispose() {
    super.dispose();
    // isLoading = false;
    // controller.clearCache();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          /* drawer: Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                  child: Align(
                    child: Image.asset(
                      "assets/images/hippodeco_logo.png",
                      color: Colors.green,
                    ),
                  ),
                ),
                const ExpansionTile(
                  leading: Icon(Icons.perm_device_information),
                  title: Text('Kurumsal'),
                  trailing: Icon(Icons.arrow_drop_down),
                )
              ],
            ),
          ),*/
          /**
          *  appBar: Platform.isIOS
              ? AppBar(
                  title: const Text("123"),
                )
              : null,
          */
          body: WebViewWidget(controller: widget.controller)),
    );
  }
}
