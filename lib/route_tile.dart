import 'package:flutter/material.dart';
import 'package:gritstone_task_shamsu/route_model.dart';

class RouteTile extends StatelessWidget {
  RouteModel item;
   RouteTile(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('From Location'),Text('to Location')],),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('From Time'),Text('to Time')],),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('total distance travelled'),Text('0.0')],),Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Battery usage'),Text('0.0')],),


          ],
        ),
      ),
    );
  }
}
