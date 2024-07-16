import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Plechi extends StatefulWidget {
  const Plechi({super.key});
  @override
  State<Plechi> createState() => _PlechiState();
}
String exercises = '''
1. Жим гантелей сидя:
Выполнение: Сядьте на скамью, держите гантели на уровне плеч. Выжмите гантели вверх, затем опустите обратно.

2. Подъем гантелей через стороны:
Выполнение: Встаньте, держите гантели у бедер. Поднимите гантели через стороны до уровня плеч, затем опустите обратно.

3. Подъем гантелей перед собой:
Выполнение: Встаньте, держите гантели перед бедрами. Поднимите гантели перед собой до уровня плеч, затем опустите обратно.

4. Подъемы гантелей в наклоне (на задние дельты):
Выполнение: Наклонитесь вперед, спина прямая, гантели свисают вниз. Поднимите гантели через стороны до уровня плеч, затем опустите.
''';

class _PlechiState extends State<Plechi> {

  final videoURL = "https://www.youtube.com/watch?v=ckC-P2xUPPc";
  late  YoutubePlayerController _controller;

  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoURL);

    _controller = YoutubePlayerController(
        initialVideoId: videoID!,
        flags: YoutubePlayerFlags(
          autoPlay: false
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color(0xff006363),
          appBar: AppBar(
            backgroundColor: Color(0xff1D7373),
            title: Text(
              "KachalKo",
              style: TextStyle(fontSize: 24, color: Color(0xffFFAA00)),
            ),
            centerTitle: true,
          ),
        body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child:
              Column(
                children: [
                  Image.asset("assets/images/zitata1.jpg",),
                  Padding(padding: EdgeInsets.all(15)),
                  Text(exercises, style: TextStyle(
                      height: 1.1 ,
                      color: Color(0xffFFAA00),
                      fontSize: 24
                  ),),
                  YoutubePlayer(controller: _controller,
                    showVideoProgressIndicator: true,
                    onReady:() => debugPrint("Ready"),
                    bottomActions: [
                      CurrentPosition(),
                      ProgressBar(
                        isExpanded: true,
                        colors: ProgressBarColors(
                            playedColor: Colors.amber,
                            handleColor: Colors.amberAccent
                        ),
                      ),
                      PlaybackSpeedButton(),
                    ],)
                ],
              ),
            )
        )
      ),
    );
  }
}
