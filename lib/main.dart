import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Contador de  pessoas",
    home: Home()));
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _infoText = "Pode entrar!";
  void _changepeople(int delta){
    setState(() {
      _people += delta;

      if(_people<0){
         _infoText = "Mundo invertido?";
      }
      else if(_people<=10){
        _infoText = "Pode entrar!";
      }
      else{
        _infoText = "Lotado!";
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.network(
          "https://upload.wikimedia.org/wikipedia/commons/6/62/Barbieri_-_ViaSophia25668.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Pessoas: $_people",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                      child: Text("+1",
                          style:
                          TextStyle(fontSize: 40.0, color: Colors.white)),
                      onPressed: () {
                        _changepeople(1);
                      }),
                ),
                FlatButton(
                    child: Text("-1",
                        style: TextStyle(fontSize: 40.0, color: Colors.white)),
                    onPressed: () {
                      _changepeople(-1);
                    }),
              ],
            ),
            Text("$_infoText",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0))
          ],
        )
      ],
    );
  }
}