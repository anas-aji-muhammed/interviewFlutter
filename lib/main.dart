import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  TextEditingController uname = new TextEditingController();
  TextEditingController pass = new TextEditingController();
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
            TextField(
              controller: uname,
              decoration: InputDecoration(
                  labelText: 'Enter User Name'
              ),
            ),
            TextField(
              controller: pass,
              decoration: InputDecoration(
                  labelText: 'Enter Password'
              ),
            ),
            Builder(
              builder:(context) => FlatButton(
                onPressed: () async {
                  if(uname.text == 'Test' && pass.text == 'Test'){
                    print("Okay");
                    Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text("Username and Password Okay")));
                    var url = 'https://demo.outlogics.com/test/test_login.php?username=Test&password=Test';
                    Response response = await post(url , body: {
                      "username" : 'Test',
                      "password" : 'Test'
                    });
                    Map map = jsonDecode(response.body);
                    print(map['user']['name']);
                    print(map['color']['color1']);
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SecondPage(map)));

                  }
                  if(uname.text.isEmpty || pass.text.isEmpty){
                    Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text("Enter all fields")));
                        print("Type something");
                  }
                  if(uname.text != 'Test' && pass.text != 'Test'){
                    print("Okay");
                    Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text("Username or Password Wrong")));
                  }


                },
                child: Text("Login"),
                color: Colors.blue,
              ),
            )


          ],
        ),
      ),
    );

  }
}

class SecondPage extends StatelessWidget {
  Map apiResponse;
  String name;
  var col1, col2, col3;
  List<String> splitted;
  SecondPage(apiresponseMap){
    this.apiResponse = apiresponseMap;
    name = apiresponseMap['user']['name'] as String;
    col1 = "#" + apiresponseMap['color']['color1'];
    col2 = "#" + apiresponseMap['color']['color2'];
    col3 = "#" + apiresponseMap['color']['color3'];
  }

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
            Text("$name",
              style: TextStyle(
                fontSize: 30.00,
                letterSpacing: 2.0,
              ),),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 150.00,
                    width: 150.00,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Hexcolor(col1),
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
                      color: Hexcolor(col2),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 150.0,
                    width: 150.00,
                    decoration: BoxDecoration(
                      color: Hexcolor(col3),
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

