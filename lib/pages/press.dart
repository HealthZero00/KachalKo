import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Press extends StatefulWidget {
  const Press({super.key});
  @override
  State<Press> createState() => _PressState();
}
String exercises = '''
1.Кранчи
Выполнение: Лягте на спину, согните колени, руки за головой. Поднимите верхнюю часть тела к коленям, затем вернитесь в исходное положение.

2.Скручивания
Выполнение: Лягте на спину, согните колени, руки за головой. Поднимите верхнюю часть тела, скручивая корпус влево, затем вернитесь в исходное положение и повторите в другую сторону.

3.Подъем ног
Выполнение: Лягте на спину, руки вдоль тела. Поднимайте ноги вверх, держа их прямыми, затем опускайте обратно.

4.Повороты корпуса с гантелью
Выполнение: Сядьте, ноги слегка согнуты, держите гантель перед собой. Поворачивайте корпус влево и вправо, держа гантель.

5.Планка
Выполнение: Встаньте в упор лежа на локтях, держите тело прямым. Удерживайте это положение как можно дольше.
''';

class _PressState extends State<Press> {

  final videoURL = "https://www.youtube.com/watch?v=VSzEycJUBaY";
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
                    Image.asset("assets/images/zitata7.jpg",),
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
