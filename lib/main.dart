import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Flutter Demo',
      theme: ThemeData(

      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  VideoPlayerController playerController;
  VideoPlayerController playerController1;
  VoidCallback listener;
  void initState() {
    super.initState();

    listener= () {
      setState(() {

      });
    };
  }
  void createVideo()
  {
  if(playerController == null )
    {


      playerController = VideoPlayerController.asset('assets/video/demo.mp4')


      ..addListener(listener)
      ..setVolume(1.0)
      ..initialize()
      ..play();
    }
  else {
    if (playerController.value.isPlaying ) {
      playerController.pause();
      //playerController1.pause();
    } else {
      playerController.initialize();
      playerController.play();
     // playerController1.initialize();
      //playerController1.play();
    }
  }
  }
  void createVideo1()
  {
    if(playerController1 == null )
    {


     // playerController1 = VideoPlayerController.asset('assets/video/demo.mp4')
       playerController1 = VideoPlayerController.network('https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4')

        ..addListener(listener)
        ..setVolume(1.0)
        ..initialize()
        ..play();
    }
    else {
      if (playerController1.value.isPlaying ) {
        playerController1.pause();

      } else {
        playerController1.initialize();
        playerController1.play();

      }
    }
  }

  @override
  void deactivate() {
    playerController.setVolume(0.0);
    playerController.removeListener(listener);
    playerController1.setVolume(0.0);
    playerController1.removeListener(listener);
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Video Player"),

      ),
      body: Container(
        color: Colors.grey.shade400,
        margin: EdgeInsets.all(25.0),
        child: Center(

          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(

                  child: (playerController != null  ? VideoPlayer
                    ( playerController,
                  ) : Container()  ),


                ),

              ),
              Container(
                  width: 95,
                  height: 60,
                margin: EdgeInsets.fromLTRB(20, 50, 20, 20),
                child: RaisedButton(

                  onPressed: (){
                    createVideo();
                    playerController.play();
                  },
                  child: Card(
                    child: Text('PLAY'),
                    color: Colors.green,
                    elevation: 6,

                  ),
                )
                
                
              ),
              
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(

                  child: (playerController1 != null  ? VideoPlayer
                    ( playerController1,
                  ) : Container()  ),


                ),

              ),
              Container(
                  width: 95,
                  height: 60,
                  margin: EdgeInsets.fromLTRB(20, 50, 20, 20),
                  child: RaisedButton(

                    onPressed: (){
                      createVideo1();
                      playerController1.play();
                    },
                    child: Card(
                      child: Text('PLAY'),
                      color: Colors.green,
                      elevation: 6,

                    ),
                  )


              ),

            ]
          ),
          ),
      ),

      );


  }
}
