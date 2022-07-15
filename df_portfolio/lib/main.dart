// import 'package:flutter_web/material.dart';
// import 'package:portfolio/ui/home.dart';

// import 'package:portfolio/utils/screen/screen_utils.dart';

import 'package:df_portfolio/ui/home.dart';
import 'package:df_portfolio/utils/screen/screen_utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DigifiniteApp());
}

class DigifiniteApp extends StatelessWidget {
  const DigifiniteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      home: const RootApp(),
    );
  }
}

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  @override
  Widget build(BuildContext context) {
    // instantiating ScreenUtil singleton instance, as this will be used throughout
    // the app to get screen size and other stuff
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    return HomePage();
  }
}
