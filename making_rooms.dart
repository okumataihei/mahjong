// 中身の記述
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_app/game.dart';


class MakingRoom extends StatefulWidget {
  const MakingRoom({super.key, required this.title});

  // 初期化
  final String title;

  @override
  State<MakingRoom> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MakingRoom> {
  int _counter = 0;
  String message = 'uuu';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    // 土台
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoomForm(title:widget.title),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class RoomForm extends StatefulWidget{
  const RoomForm({super.key, required this.title});
  final String title;

  @override
  State<RoomForm> createState() {
    return _RoomForm();
  }
}

class _RoomForm extends State<RoomForm>{
  final GlobalKey<FormState>  _formkey = GlobalKey<FormState>();
  int initPoints = 25000;
  List<({int playerId, String playerName, int points, int result})> playerList = [];

  String player1name = 'Player 1';
  String player2name = 'Player 2';
  String player3name = 'Player 3';
  String player4name = 'Player 4';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: SizedBox(
        width: MediaQuery.of(context).size.width*0.5,
        height: MediaQuery.of(context).size.height*0.9,
        child :Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'プレイヤー名を入力してください',
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 4.0),),
            TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Player 1'
              ),
              initialValue: player1name,
              validator: (String? name){
                if(name==null || name.isEmpty){
                  return 'Please enter some name';
                }
                if(name==player2name||name==player3name||name==player4name){
                  return 'same name players exist';
                }
                return null;
              },
              onChanged: (newValue) {
                player1name = newValue;
              },
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 4.0),),
            TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Player 2'
              ),
              initialValue: player2name,
              validator: (String? name){
                if(name==null || name.isEmpty){
                  return 'Please enter some name';
                }
                if(name==player3name||name==player4name||name==player1name){
                  return 'same name players exist';
                }
                return null;
              },
              onChanged: (newValue) {
                player2name = newValue;
              },
            ),

            const Padding(padding: EdgeInsets.symmetric(vertical: 4.0),),
            TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Player 3'
              ),
              initialValue: player3name,
              validator: (String? name){
                if(name==null || name.isEmpty){
                  return 'Please enter some name';
                }
                if(name==player4name||name==player1name||name==player2name){
                  return 'same name players exist';
                }
                return null;
              },
              onChanged: (newValue) {
                player3name = newValue;
              },
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 4.0),),
            TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Player 4'
              ),
              initialValue: player4name,
              validator: (String? name){
                if(name==null || name.isEmpty){
                  return 'Please enter some name';
                }
                if(name==player1name||name==player2name||name==player3name){
                  return 'same name players exist';
                }
                return null;
              },
              onChanged: (newValue) {
                player4name = newValue;
              },
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 0.0),),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Text('初期持ち点'),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  width: MediaQuery.of(context).size.width*0.3,
                  child: TextFormField(
                    key: const ValueKey('initialPoints'),
                    initialValue: initPoints.toString(),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (value) => {
                      setState(() {
                        initPoints = value as int;
                      })
                    },
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical:  16.0),),
            Center(
              child:ElevatedButton(
                onPressed: () {
                  if(_formkey.currentState!.validate()){
                    //   TODO : data process
                    ({int playerId, String playerName, int points, int result}) player1 = (playerId: 1, playerName: player1name, points: initPoints, result: 0);
                    ({int playerId, String playerName, int points, int result}) player2 = (playerId: 2, playerName: player2name, points: initPoints, result: 0);
                    ({int playerId, String playerName, int points, int result}) player3 = (playerId: 3, playerName: player3name, points: initPoints, result: 0);
                    ({int playerId, String playerName, int points, int result}) player4 = (playerId: 4, playerName: player4name, points: initPoints, result: 0);
                    playerList.add(player1);
                    playerList.add(player2);
                    playerList.add(player3);
                    playerList.add(player4);
                    Navigator.push(
                      context,
                      MaterialPageRoute<void> (
                          builder: (BuildContext context) => Game(title: widget.title, playerList: playerList)
                      ),
                    );
                  }
                },
                child: const Text('完了'),
              ),
            )
          ],
        ),
      )
    );
  }
}