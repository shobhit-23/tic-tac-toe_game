import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AssetImage cross = AssetImage("assets/cross.png");
  AssetImage edit = AssetImage("assets/edit.png");
  AssetImage circle = AssetImage("assets/circle.png");

  bool isplayer1=true;
  late String message;
  late List<String> btnState;

  @override
  void initState()
  {
    super.initState();
    setState(() {
      this.btnState=[
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message="";
    });
  }
  playGame(int idx)
  {
    if(btnState[idx]=='empty')
    {
      setState(() {
        if(isplayer1==true)
        {
          btnState[idx]="cross";
        }
        else
        {
          btnState[idx]="circle";
        }
        isplayer1=!isplayer1;
        isGameOver();
      });
    }
  }
  getImage(String state)
  {

    if(state=='cross')
    {
      return cross;
    }
    else  if(state=='circle')
      return circle;
    else
      return edit;
  }
  isGameOver()
  {
    if((btnState[0]!='empty')&& btnState[0]==btnState[1] && btnState[1]==btnState[2])
    {
      setState(() {

        this.message = '${btnState[0]} Wins';
        dialog(message);
        resetGame();

      });
    }
    else if((btnState[3]!='empty')&& btnState[3]==btnState[4] && btnState[4]==btnState[5])
    {
      setState(() {

        this.message = '${this.btnState[3]} Wins';
        dialog(message);
        resetGame();

      });

    }
    else if((btnState[6]!='empty')&& btnState[6]==btnState[7] && btnState[7]==btnState[8])
    {
      setState(() {

        this.message = '${this.btnState[6]} Wins';
        dialog(message);
        resetGame();

      });

    }
    else if((btnState[0]!='empty')&& btnState[0]==btnState[3] && btnState[3]==btnState[6])
    {
      setState(() {

        this.message = '${this.btnState[0]} Wins';
        dialog(message);
        resetGame();

      });
    }
    else if((btnState[1]!='empty')&& btnState[1]==btnState[4] && btnState[4]==btnState[7])
    {
      setState(() {

        this.message = '${this.btnState[1]} Wins';
        dialog(message);
        resetGame();

      });

    }
    else if((btnState[2]!='empty')&& btnState[2]==btnState[5] && btnState[5]==btnState[8])
    {
      setState(() {

        this.message = '${this.btnState[2]} Wins';
        dialog(message);
        resetGame();

      });

    }
    else if((btnState[0]!='empty')&& btnState[0]==btnState[4] && btnState[4]==btnState[8])
    {
      setState(() {

        this.message = '${this.btnState[0]} Wins';
        dialog(message);
        resetGame();

      });

    }
    else if((btnState[2]!='empty')&& btnState[2]==btnState[4] && btnState[4]==btnState[6])
    {
      setState(() {

        this.message = '${this.btnState[2]} Wins';
        dialog(message);
        resetGame();

      });

    }else if(!btnState.contains('empty'))
    {
      setState(() {
        this.message = "It's a draw";
        dialog(message);
        resetGame();

      });
    }
  }
  resetGame()
  {
    setState(() {
      btnState=[
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message="";
    });
    isplayer1=true;
  }
  dialog(String msg)
  {
    showDialog(
        context: context,
        builder: (context)
        {
          return AlertDialog(
            title: Text('GameOver!!',textAlign: TextAlign.center,style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w800)),
            backgroundColor: Color(0xffF0DF87),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
            ),
            content: Container(
              child: Text(msg,textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 30.0)),

            ),
            actions: [
              ElevatedButton(
                child:Center(
                  child:new Text("OK",style:
                  TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                  ),
                ),

                onPressed: ()
                {
                  Navigator.pop(context);
                },
              )
            ],
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Tic-Tac-Toe"),
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Expanded(
                  child:new GridView.builder(
                    gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                    ),
                    itemCount: 9,
                    itemBuilder: (context,i)=>SizedBox(
                      height: 50,
                      width: 50,
                      child: MaterialButton(
                          onPressed:()=> playGame(i),
                          child: Image(
                            image:getImage(btnState[i]),
                          )
                      ),
                    )   ,
                  )
              ),
              MaterialButton(
                color: Color(0xffF9DDA4),
                minWidth: 300.0,
                height: 50.0,
                elevation: 5.0,
                child: new Text("Restart",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                onPressed: ()=>resetGame(),
              )
            ]
        )
    );
  }
}
