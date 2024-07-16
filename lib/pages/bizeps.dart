import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Bizeps extends StatefulWidget {
  const Bizeps({super.key});
  @override
  State<Bizeps> createState() => _BizepsState();
}
String exercises = '''
1.Подъем штанги на бицепс
Выполнение: Встаньте, держите штангу хватом снизу на уровне бедер. Поднимите штангу, сгибая локти, затем медленно опустите её обратно.

2.Подъем гантелей на бицепс сидя
Выполнение: Сядьте на скамью, держите гантели в каждой руке. Поднимайте гантели поочередно, сгибая локоть, затем медленно опускайте.

3.Молотковый подъем гантелей
Выполнение: Встаньте, держите гантели в каждой руке, ладони смотрят друг на друга. Поднимайте гантели, сгибая локти, затем медленно опускайте.

4.Концентрированный подъем гантели
Выполнение: Сядьте, наклонитесь вперед, уперев локоть рабочей руки в колено. Поднимайте гантель, сгибая локоть, затем медленно опускайте.

5.Подъем на бицепс на тренажере
Выполнение: Сядьте на тренажер для бицепса, поставьте руки на подушки. Поднимайте рукоятки, сгибая локти, затем медленно опускайте их обратно.

''';

class _BizepsState extends State<Bizeps> {

  final videoURL = "https://www.youtube.com/watch?v=ptEo-oUW3Tc";
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
                    Image.asset("assets/images/zitata2.jpg",),
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
