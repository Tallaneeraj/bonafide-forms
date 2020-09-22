import 'package:flutter/material.dart';
import 'package:forms/DATA.dart';
import 'package:validators/validators.dart' as validator;

class Forms extends StatefulWidget {
  @override
  _FormsState createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  GlobalKey formkey1= GlobalKey<FormState>();
  Data newdata=Data();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BONAFIDE'),
        ),
        body: Form(
          key: formkey1,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'NAME',
                ),
                validator: (value){
                  if(value.isEmpty){
                    return 'no data';
                  }
                  return null;
                },
                onSaved: (String value ){
                newdata.name=value;
                }
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'PARENT NAME',
                ),
                validator: (value){
                  if(value.isEmpty){
                    return 'no data';
                  }
                  return null;
                },
                 onSaved: (String value ){
                  newdata.parentname=value;
                }
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'YEAR',
                ),
                validator: (value){
                  if(value.isEmpty){
                    return 'no data';
                  }
                  return null;
                },
                  onSaved: (String value ){
                  newdata.year=value;
                  }
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'PROGRAMME',
                ),
                validator: (value){
                  if(value.isEmpty){
                    return 'no data';
                  }
                  return null;
                },
                  onSaved: (String value ){
                  newdata.programme=value;
                }
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'DISCIPLINE',
                ),
                validator: (value){
                  if(value.isEmpty){
                    return 'no data';
                  }
                  return null;
                },
                     onSaved: (String value ){
                  newdata.branch=value;
                  }
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'ACADEMIC YEAR',
                ),
                validator: (value){
                  if(value.isEmpty){
                    return 'no data';
                  }
                  return null;
                },
                  onSaved: (String value ){
                  newdata.academicyear=value;
                 }
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'ROLL NO',
                ),
                validator: (value){
                  if(value.isEmpty){
                    return 'no data';
                  }
                  return null;
                },
                 onSaved: (String value ){
                 newdata.rollno=value;
                }
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'PURPOSE',
                ),
                validator: (value){
                  if(value.isEmpty){
                    return 'no data';
                  }
                  return null;
                },
                  onSaved: (String value ){
                     newdata.purpose=value;
                    }
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'EMAIL',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                  onSaved: (String value ){
                    newdata.email=value;
                }
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RaisedButton(
                  onPressed: () {
                    if(formkey1.currentState.validate()) {
                      Scaffold.of(context).showSnackBar(SnackBar(content: Text('SUBMITTED')));
                    }
                  },
                  child: Text('SUBMIT'),
                ),
              )
            ],
          ),
        ),

      );
  }
}
