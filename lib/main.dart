import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: first(),
  ));

}

class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  List<String> l = List.filled(9,"");
  String p1="O",p2="X";
  int cnt=0;
  String msg="Game is Running...";
  int w=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tik Tac Toe"),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            child: Text(
              msg,
              style: TextStyle(fontSize: 40,color: Colors.black),
            ),
          ),
          Expanded(
              child: Row(
            children: [abc(0),abc(1),abc(2)],
          )),
          Expanded(
              child: Row(
            children: [abc(3),abc(4),abc(5)],
          )),
          Expanded(
              child: Row(
            children: [abc(6),abc(7),abc(8)],
          )),
          ElevatedButton(onPressed: () {
            l = List.filled(9, "");
            cnt = 0;
            w=0;
            msg="";
            setState((){});
          }, child: Text("Reset"))
        ],
      ),
    );
  }
  Widget abc(int i)
  {
    return Expanded(child:InkWell(
      onTap: () {
        if(l[i]==""&&w==0)
          {
            if(cnt%2==0)
              {
                l[i]=p1;
              }
            else
              {
                l[i]=p2;
              }
            cnt++;
            win();
              setState((){});
          }
      },
      child: Container(
        color: Colors.teal,
        margin: EdgeInsets.all(10),
        child: Center(
          child: Text(
            l[i],
            style: TextStyle(fontSize: 100,color: Colors.white),
          ),
        ),
      ),
    )
    );
  }
  win()
  {
    if((l[0]==p1&&l[1]==p1&&l[2]==p1)||
        (l[3]==p1&&l[4]==p1&&l[5]==p1)||
          (l[6]==p1&&l[7]==p1&&l[8]==p1)||
          (l[0]==p1&&l[3]==p1&&l[6]==p1)||
          (l[1]==p1&&l[4]==p1&&l[7]==p1)||
          (l[2]==p1&&l[5]==p1&&l[8]==p1)||
          (l[0]==p1&&l[4]==p1&&l[8]==p1)||
          (l[2]==p1&&l[4]==p1&&l[6]==p1))
      {
        msg="$p1 is Winner.";
        w=1;
      }
    else if((l[0]==p2&&l[1]==p2&&l[2]==p2)||
        (l[3]==p2&&l[4]==p2&&l[5]==p2)||
        (l[6]==p2&&l[7]==p2&&l[8]==p2)||
        (l[0]==p2&&l[3]==p2&&l[6]==p2)||
        (l[1]==p2&&l[4]==p2&&l[7]==p2)||
        (l[2]==p2&&l[5]==p2&&l[8]==p2)||
        (l[0]==p2&&l[4]==p2&&l[8]==p2)||
        (l[2]==p2&&l[4]==p2&&l[6]==p2))
    {
      msg="$p2 is Winner.";
      w=1;
    }
    else if(l[0]!=""&&l[1]!=""&&l[2]!=""&&l[3]!=""&&l[4]!=""&&l[5]!=""&&l[6]!=""&&l[7]!=""&&l[8]!="")
    {
      msg="Mach is Drow.";
    }
  }
}
