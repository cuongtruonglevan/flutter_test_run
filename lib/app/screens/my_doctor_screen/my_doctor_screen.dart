import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyDoctorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: _buildBody(context),
      ),
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
