import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: BottomTabbarExample(),
      ),
    );
  }
}

class BottomTabbarExample extends StatefulWidget {
  const BottomTabbarExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomTabbarExampleState();
}

class _BottomTabbarExampleState extends State<BottomTabbarExample>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  static const _kTabPages = <Widget>[
    Center(
      child: Icon(Icons.cloud, size: 64.0, color: Colors.teal),
    ),
    Center(
      child: Icon(Icons.alarm, size: 64.0, color: Colors.cyan),
    ),
    Center(
      child: Icon(Icons.forum, size: 64.0, color: Colors.blue),
    ),
    Center(
      child: Icon(Icons.account_circle, size: 64.0, color: Colors.tealAccent),
    ),
  ];
  static const _kTabs = <Tab>[
    Tab(icon: Icon(Icons.cloud), text: 'Tab1'),
    Tab(icon: Icon(Icons.alarm), text: 'Tab2'),
    Tab(icon: Icon(Icons.forum), text: 'Tab3'),
    Tab(icon: Icon(Icons.account_circle), text: 'Tab4'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _kTabPages.length,
      vsync: this,
    );
  }

  // @override
  // void dispose() {
  //   _tabController?.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: TabBarView(
        children: _kTabPages,
        controller: _tabController,
      ),
      bottomNavigationBar: Material(
        color: Colors.blue,
        child: TabBar(
          tabs: _kTabs,
          controller: _tabController,
        ),
      ),
    );
  }
}
