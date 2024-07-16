import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Predpleshya extends StatefulWidget {
  const Predpleshya({super.key});
  @override
  State<Predpleshya> createState() => _PredpleshyaState();
}
String exercises = '''
1.Сгибание запястий с гантелями
Выполнение: Сядьте на скамью, предплечья на коленях, ладони вверх. Сгибайте запястья, поднимая гантели, затем опускайте обратно.

2.Обратное сгибание запястий с гантелями
Выполнение: Сядьте на скамью, предплечья на коленях, ладони вниз. Поднимайте гантели, сгибая запястья, затем опускайте обратно.

3.Молотковое сгибание на бицепс
Выполнение: Встаньте, держите гантели в каждой руке, ладони смотрят друг на друга. Поднимайте гантели, сгибая локти, затем опускайте обратно.

4.Вращение запястий с гантелями
Выполнение: Встаньте, держите гантели в каждой руке. Вращайте запястья, двигая гантели по кругу.

5.Статическое удержание гантелей
Выполнение: Встаньте, держите гантели в каждой руке. Удерживайте гантели в фиксированном положении как можно дольше.

6.Сгибание запястий с гантелями за спиной
Выполнение: Встаньте, держите гантели за спиной, ладони вверх. Сгибайте запястья, поднимая гантели, затем опускайте обратно.

7.Обратное сгибание запястий с гантелями за спиной
Выполнение: Встаньте, держите гантели за спиной, ладони вниз. Поднимайте гантели, сгибая запястья, затем опускайте обратно.
''';

class _PredpleshyaState extends State<Predpleshya> {

  final videoURL = "https://www.youtube.com/watch?v=_Le7cqsyiSA";
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
                    Image.asset("assets/images/zitata6.jpeg",),
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
