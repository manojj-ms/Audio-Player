import 'dart:convert';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Music extends StatefulWidget {
  @override
  _MusicState createState() => _MusicState();
}

List<String> value;
List<String> files;


class _MusicState extends State<Music> {
  List newTaskTitle;
  String path;
  Duration _duration = new Duration();
  Duration _position = new Duration();
  AudioPlayer audioPlayer;
  AudioCache audioCache;

  //Initialize the audio player’s property
  @override
  void initState(){
    super.initState();
    initPlayer();
  }

  // Initialize the audio player’s property
  void initPlayer(){
    audioPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: audioPlayer);

    audioPlayer.durationHandler = (d) => setState(() {
      _duration = d;
    });

    audioPlayer.positionHandler = (p) => setState(() {
      _position = p;
    });
  }

  //Slider Widget
  Widget slider() {
    return Slider(
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            seekToSecond(value.toInt());
            value = value;
          });});
  }

  //Seek Seconds
  void seekToSecond(int second){
    Duration newDuration = Duration(seconds: second);
    audioPlayer.seek(newDuration);
  }

  // Tab For the player is here
  Widget _tab(List<Widget> children) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: children
              .map((w) => Container(child: w, padding: EdgeInsets.all(6.0)))
              .toList(),
        ),
      ),
    );
  }

  //Local Asset widget
  Widget localAsset() {
    return _tab([
      Text(''),
      slider()
    ]);
  }

  //Audio Play Function
  playAudio(String track){
    return audioCache.play(track);
  }

//Audio pause Function
  pauseAudio(){
    return audioPlayer.pause();
  }

//Audio Stop Function
  stopAudio(){
    return audioPlayer.stop();
  }


  @override
  Widget build(BuildContext context) {
    const PrimaryColor = const Color(0xff7b1fa2);
    return Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(centerTitle: true,
        backgroundColor: PrimaryColor,
        title: Text('Audio Player',style: TextStyle(color: Color(0xffedf3ec))),
      ),
      body: Column(
        children: [
          FlatButton(
            child: Text("Let's start"),
            color: Colors.grey,
            onPressed: () async{
              value = await _initFiles();
              print(value);
              setState(() {
                newTaskTitle = value;
              });
            },
          ),
          Expanded(
            child: value == null ? SingleChildScrollView(child: Container()) : Padding(
              padding: const EdgeInsets.all(10.0),
              child: new ListView.builder(
                  itemCount: newTaskTitle.length,
                  itemBuilder: (BuildContext context, int position) {
                    return Card(
                      child: new ListTile(
                        title: new Text('${newTaskTitle[position]}'),
                        onTap: () {
                          //Call Audio Play Function
                          var trt = newTaskTitle[position].split('/');
                          path = trt[1].toString();
                        },
                      ),
                    );
                  }),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically
            children: [
              IconButton(
                icon: Icon(
                  Icons.play_arrow,
                ),
                iconSize: 40,
                color: Colors.blueAccent,
                onPressed: (){
                  playAudio(path);
                },
              ),
              SizedBox(width: 30.0,),
              IconButton(
                icon: Icon(
                  Icons.pause,
                ),
                iconSize: 40,
                color: Colors.blueAccent,
                onPressed: (){
                  pauseAudio();
                },
              ),
              SizedBox(width: 30.0,),
              IconButton(
                icon: Icon(
                  Icons.stop,
                ),
                iconSize: 40,
                color: Colors.blueAccent,
                onPressed: (){
                  stopAudio();
                },
              ),

            ],
          )
        ],
      ),
    );
  }
}

  //File paths retriving from the assets directory as list format
  // we have implemented a function named ‘_initFiles’ can read the file paths what is in json format, decode it in String and return a list named ‘files’ containing the file paths.
  _initFiles() async {
    String manifestContent = await rootBundle.loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    // >> To get paths you need these 2 lines


    final filePaths = manifestMap.keys
        .where((String key) => key.contains('assets/'))
        .where((String key) => key.contains('.mp3'))
        .toList();
    files = filePaths;
    return files;
  }


