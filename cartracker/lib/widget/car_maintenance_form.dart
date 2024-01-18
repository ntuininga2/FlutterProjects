import 'package:flutter/material.dart';

class CarMaintenanceForm extends StatefulWidget{
  @override
  State<CarMaintenanceForm> createState() => _CarMaintenanceFormState();
}

class _CarMaintenanceFormState extends State<CarMaintenanceForm> {

  final formKey = GlobalKey<FormState>();
  final TextEditingController textEditingController = TextEditingController();

  String? make, model;
  int? year;

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

      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(100.0),
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
                  setState(() => {})
                }
              },
            ),
            Text('$make')
          ],
          ),
      )
    );
  }
}