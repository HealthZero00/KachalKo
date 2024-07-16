import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Nogi extends StatefulWidget {
  const Nogi({super.key});
  @override
  State<Nogi> createState() => _NogiState();
}
String exercises = '''
1.Приседания
Выполнение: Встаньте, ноги на ширине плеч. Сгибайте колени, опускаясь вниз, затем вернитесь в исходное положение.

2.Выпады
Выполнение: Встаньте, сделайте шаг вперед и опустите тело вниз, сгибая колени. Вернитесь в исходное положение и повторите на другую ногу.

3.Приседания с прыжком
Выполнение: Встаньте, ноги на ширине плеч. Выполните приседание, а затем подпрыгните вверх.

4.Плие-приседания
Выполнение: Встаньте, ноги шире плеч, носки развернуты наружу. Сгибайте колени, опускаясь вниз, затем вернитесь в исходное положение.

5.Ягодичный мостик
Выполнение: Лягте на спину, согните колени, стопы на полу. Поднимайте бедра вверх, затем опускайте обратно.
''';

class _NogiState extends State<Nogi> {

  final videoURL = "https://www.youtube.com/watch?v=6xvb93e6PuA";
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
                    Image.asset("assets/images/zitata8.jpg",),
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
