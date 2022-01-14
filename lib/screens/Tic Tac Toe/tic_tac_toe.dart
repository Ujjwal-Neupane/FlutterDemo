import 'package:flutter/material.dart';

class TicTacToe extends StatefulWidget {
  const TicTacToe({Key? key}) : super(key: key);

  @override
  _TicTacToeState createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  List<int> boxStatusList = [0, 0, 0, 0, 0, 0, 0, 0, 0];
  bool check = true;
  bool gameOver = false;
  int tapCount = 0;
  String title = 'Tic Tac Toe';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40,
              ),
              GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  semanticChildCount: 9,
                  children: [
                    setBox(0),
                    setBox(1),
                    setBox(2),
                    setBox(3),
                    setBox(4),
                    setBox(5),
                    setBox(6),
                    setBox(7),
                    setBox(8),
                  ]),
              SizedBox(height: 20),
              if (gameOver) ...[
                ElevatedButton(
                    onPressed: () => resetBox(), child: Text('RESET'))
              ],
            ],
          ),
        ),
      ),
    );
  }

//box widget
  Widget setBox(int i) {
    print('inside setBox method $i and count: $tapCount');
    return Card(
      color: setBoxColor(i),
      child: InkWell(
        onTap: () => updateBox(i),
        child: setIcon(i),
      ),
    );
  }

  dynamic setIcon(int i) {
    switch (boxStatusList[i]) {
      case 1:
        return Icon(Icons.check, size: 30, color: Colors.white);
      case 2:
        return Icon(Icons.close, size: 30, color: Colors.white);
      default:
        return SizedBox.shrink();
    }
  }

  void updateBox(int i) {
    if (boxStatusList[i] == 0 && gameOver == false) {
      //if not 0 then already tapped
      check ? boxStatusList[i] = 1 : boxStatusList[i] = 2;
      check = !check;
      tapCount++;
      checkForWin();
      setState(() {});
    }
  }

  void checkForWin() {
    if (tapCount == 9) {
      endGame(0);
    }

    if (boxStatusList[0] == boxStatusList[1] &&
        boxStatusList[1] == boxStatusList[2] &&
        boxStatusList[0] != 0) {
      boxStatusList[0] == 1 ? endGame(1) : endGame(2);
    } else if (boxStatusList[3] == boxStatusList[4] &&
        boxStatusList[4] == boxStatusList[5] &&
        boxStatusList[3] != 0) {
      boxStatusList[3] == 1 ? endGame(1) : endGame(2);
    } else if (boxStatusList[6] == boxStatusList[7] &&
        boxStatusList[7] == boxStatusList[8] &&
        boxStatusList[6] != 0) {
      boxStatusList[6] == 1 ? endGame(1) : endGame(2);
    }
    if (boxStatusList[0] == boxStatusList[3] &&
        boxStatusList[3] == boxStatusList[6] &&
        boxStatusList[0] != 0) {
      boxStatusList[0] == 1 ? endGame(1) : endGame(2);
    } else if (boxStatusList[1] == boxStatusList[4] &&
        boxStatusList[4] == boxStatusList[7] &&
        boxStatusList[1] != 0) {
      boxStatusList[1] == 1 ? endGame(1) : endGame(2);
    } else if (boxStatusList[2] == boxStatusList[5] &&
        boxStatusList[5] == boxStatusList[8] &&
        boxStatusList[2] != 0) {
      boxStatusList[2] == 1 ? endGame(1) : endGame(2);
    } else if (boxStatusList[0] == boxStatusList[4] &&
        boxStatusList[4] == boxStatusList[8] &&
        boxStatusList[0] != 0) {
      boxStatusList[0] == 1 ? endGame(1) : endGame(2);
    } else if (boxStatusList[2] == boxStatusList[4] &&
        boxStatusList[4] == boxStatusList[6] &&
        boxStatusList[2] != 0) {
      boxStatusList[2] == 1 ? endGame(1) : endGame(2);
    }

    //check for draw
  }

  endGame(int i) {
    gameOver = true;
    title = (i == 0) ? 'Draw' : 'player $i has won the game';
    print('player $i has won the game');
  }

  resetBox() {
    resetBoxStatusList();
    gameOver = false;
    check = true;
    title = "Tic Tac Toe";
    tapCount = 0;
    print(boxStatusList);
    setState(() {});
  }

  void resetBoxStatusList() {
    for (int i = 0; i < 9; i++) {
      boxStatusList[i] = 0;
    }
  }

  Color setBoxColor(int i) {
    switch (boxStatusList[i]) {
      case 1:
        return Colors.red;
      case 2:
        return Colors.blue;
      default:
        return Colors.white;
    }
  }
}
