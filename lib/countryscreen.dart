import 'package:flutter/material.dart';

const textfield = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: 'Enter Country Name',
  hintStyle: TextStyle(
    color: Colors.grey
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide.none
  )
);

class CountryScreen extends StatefulWidget {
  @override
  _CountryScreenState createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  late String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/page_bg.jpg'),
              fit: BoxFit.cover,
            )),
            constraints: BoxConstraints.expand(),
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: FlatButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back, size: 30.0, color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.black
                      ),
                      decoration: textfield,
                      onChanged: (value){
                        cityName = value;
                      },
                    ),
                  ),
                  RaisedButton(
                    onPressed: (){
                      Navigator.pop(context, cityName);
                    },
                    padding: EdgeInsets.all(0),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Colors.blue,
                            Colors.blue[300]!,
                            Colors.blue[100]!,
                          ]
                        )
                      ),
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Get Country',
                        style: TextStyle(
                          fontSize: 20.0
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
      ),
    );
  }
}