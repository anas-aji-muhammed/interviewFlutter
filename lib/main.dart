import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Interview"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,

      ),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
                labelText: 'Enter User Name'
            ),
          ),
          TextField(
            decoration: InputDecoration(
                labelText: 'Enter Password'
            ),
          ),
          FlatButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SecondPage()));
            },
            child: Text("Login"),
            color: Colors.blue,
          )


        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Interview"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("Name"),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 150.00,
                    width: 150.00,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 150.0,
                    width: 150.00,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 150.0,
                    width: 150.00,
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      shape: BoxShape.circle,

                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

