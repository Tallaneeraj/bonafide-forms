import 'package:flutter/material.dart';
import 'package:forms/DATA.dart';
import 'package:forms/FORM.dart';
import 'package:validators/validators.dart' as validator;

void main() {
  runApp(MaterialApp(
    home: Loading(),
    routes: {
      '/main': (context) => Loading(),
      '/fill':(context)=> Forms(),
  },
  ));
}
class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text('GRIET FORMS'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('WELCOME TO GRIET FORMS',style: TextStyle(
              fontSize: 30.0,color: Colors.red
          ),),
          Text('APPLY FOR BONAFIDE ',style: TextStyle(
              fontSize: 18.0,color: Colors.black
          ),),
          Center(

            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: RaisedButton(
                onPressed: (){
                    Navigator.pushNamed(context, '/fill');
                },
                child: Text('START'),
              ),

            ),
          ),
        ],
      ),
    );
  }
}





