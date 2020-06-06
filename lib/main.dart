import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:hexcolor/hexcolor.dart';

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
                    var url = 'https://demo.outlogics.com/test/test_login.php';
                    Response response = await post(url);
                    print(response.body);
                    String apiresponse = "John, #000000, #B00020, #6200EE";
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SecondPage(apiresponse)));

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
  String apiResponse = "initial";
  String name;
  var col1, col2, col3;
  List<String> splitted;
  SecondPage(apiresponse){
    this.apiResponse = apiresponse;
    splitted = apiResponse.split(', ');
    name = splitted[0];
    col1 = splitted[1];
    col2 = splitted[2];
    col3 = splitted[3];
    print(name);
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

