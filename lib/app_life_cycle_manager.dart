// ignore_for_file: lines_longer_than_80_chars, library_private_types_in_public_api

import 'package:flutter/material.dart';

class AppLifeCycleManager extends StatefulWidget {
  const AppLifeCycleManager({required Key key, required this.child}) : super(key: key);

  final Widget child;

  @override
  _AppLifeCycleManagerState createState() => _AppLifeCycleManagerState();
}

class _AppLifeCycleManagerState extends State<AppLifeCycleManager> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    debugPrint('AppLifeCycleManager: initState called');
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    debugPrint('AppLifecycleState: $state');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('AppLifeCycleManager: build called');
    return widget.child;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint('AppLifeCycleManager: didChangeDependencies called');
  }

  @override
  void didUpdateWidget(AppLifeCycleManager oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint('AppLifeCycleManager: didUpdateWidget called');
  }

  @override
  void dispose() {
    debugPrint('AppLifeCycleManager: dispose called');
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}

/* class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppLifeCycleManager(
      key: Key('appLifeCycleManager'),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}*/
