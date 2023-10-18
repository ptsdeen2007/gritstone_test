import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gritstone_task_shamsu/route_tile.dart';
import 'package:provider/provider.dart';

import '../provider/route_provider.dart';

class RouteListScreen extends StatelessWidget {
  const RouteListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RouteProvider>(context);
    return !provider.isLoading
        ? ListView.builder(
            itemCount: provider.routeModels.length,
            itemBuilder: (context, position) {
              var item = provider.routeModels[position];
              return RouteTile(item);
            })
        : const Center(
            child: CupertinoActivityIndicator(),
          );
  }
}
