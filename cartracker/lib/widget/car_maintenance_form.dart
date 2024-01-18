import 'package:flutter/material.dart';

import 'package:cartracker/car_manager.dart';
import 'package:cartracker/views/car.dart';

class CarMaintenanceForm extends StatefulWidget{
  @override
  State<CarMaintenanceForm> createState() => _CarMaintenanceFormState();
}

class _CarMaintenanceFormState extends State<CarMaintenanceForm> {

  final formKey = GlobalKey<FormState>();
  final TextEditingController textEditingController = TextEditingController();

  String? make, model, year;

  Widget _buildMake() {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(labelText: 'Make'),
      validator: (String? value) {
        if (value != null && value.isEmpty) {
          return 'Make is Required';
        }
        return null;
      },
      onSaved: (String? value) {
        make = value;
      },
    );
  }
  Widget _buildModel() {
    return TextFormField(
      //controller: textEditingController,
      decoration: InputDecoration(labelText: 'Model'),
      validator: (String? value) {
        if (value != null && value.isEmpty) {
          return 'Model is Required';
        }
        return null;
      },
      onSaved: (String? value) {
        model = value;
      },
    );
  }
  Widget _buildYear() {
    return TextFormField(
      //controller: textEditingController,
      decoration: InputDecoration(labelText: 'Year'),
      validator: (String? value) {
        if (value != null && value.isEmpty) {
          return 'Year is Required';
        }
        return null;
      },
      onSaved: (value) {
        year = value;
      },
    );
  }

  void createCar() {
    Car car = Car();
    car.make = make;
    car.model = model;
    car.year = year;

    CarManager().addCar(car);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: SingleChildScrollView(
          child: Column (
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildMake(),
              _buildModel(),
              _buildYear(),
              SizedBox(height: 100),
              ElevatedButton(child: Text("Submit"),
                onPressed: () => {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save(),
                    createCar(),
                    setState(() => {}),
                  }
                },
              ),
              Text('$make $model $year')
            ],
            ),
        ),
      )
    );
  }
}