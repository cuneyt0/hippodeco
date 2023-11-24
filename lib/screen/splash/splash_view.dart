import 'package:flutter/material.dart';
import 'package:hippodeco/screen/hidden_drawer/hidden_drawer_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late WebViewController controller;

  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    controller = WebViewController();
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: onProgress,
          onPageStarted: onPageStarted,
          onPageFinished: onPageFinished,
          onWebResourceError: onWebResourceError,
        ),
      )
      ..loadRequest(
        Uri.parse('https://hippodeco.com/'),
      );
  }

  void onWebResourceError(WebResourceError error) {
    print(error.description);
    debugPrint('''
  Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
          ''');
  }

  void onPageStarted(String url) async {
    print('Hippodeco Page started loading: $url');
  }

  void onProgress(int progress) {
    print('Hippodeco WebView is loading (progress : $progress%)');
  }

  void onPageFinished(String url) {
    isLoading = true;

    debugPrint('Hippodeco Page finished loading: $url');
    setState(() {});
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => HiddenDrawerMenuView(
          controller: controller,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/images/hippodeco_logo.png",
            color: Colors.green,
          ),
          const Center(
            child: CircularProgressIndicator.adaptive(
              backgroundColor: Colors.green,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
