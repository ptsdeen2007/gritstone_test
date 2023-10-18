import 'package:flutter/material.dart';
import 'package:gritstone_task_shamsu/provider/route_provider.dart';
import 'package:gritstone_task_shamsu/screens/route_list.dart';
import 'package:gritstone_task_shamsu/screens/route_map.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Home"),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.route),
                child: Text("Routes"),
              ),
              Tab(
                icon: Icon(Icons.map),
                child: Text("Map"),
              ),

            ],
          ),
        ),
        body:  TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            const RouteListScreen(),
             RouteMap()
          ],
        ),
      ),
    );
  }
}
