import 'package:flutter/material.dart';

import 'package:cartracker/widget/car_maintenance_form.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Tracker'),
      ),
      body: Row(
        children: [
          SafeArea(
            child: NavigationRail(
              extended: false,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.home), 
                  label: Text('Home')
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.home), 
                  label: Text('Home')
                ),
              ],
              selectedIndex: 0
              ),
          ),
          Expanded(
            child: Container(
              child: Column (
                children: [
                  const Expanded(child: Center(child: Text("Box 1")),),
                  CarMaintenanceForm()
                ],
                )
              )
            )
        ],
      ),
    );
  }
}