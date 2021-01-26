import 'package:flutter/material.dart';

class MyDoctorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      child: Center(
        child: Text('MY DOCTOR'),
      ),
    );
  }
}
