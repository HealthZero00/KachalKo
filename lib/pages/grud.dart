import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Grud extends StatefulWidget {
  const Grud({super.key});
  @override
  State<Grud> createState() => _GrudState();
}
String exercises = '''
1.Жим штанги на наклонной скамье
Выполнение: Лягте на наклонную скамью, возьмитесь за штангу широким хватом. Опустите штангу к верхней части груди, затем выжмите её вверх.

2.Жим гантелей на горизонтальной скамье
Выполнение: Лягте на горизонтальную скамью, держите гантели на уровне груди. Выжмите гантели вверх, затем опустите обратно.

3.Разведение гантелей на горизонтальной скамье
Выполнение: Лягте на горизонтальную скамью, держите гантели над грудью. Разведите гантели в стороны, затем верните их в исходное положение.

4.Тяга верхнего блока к груди
Выполнение: Сядьте на тренажер, возьмитесь за рукоятку широким хватом. Тяните рукоятку вниз к груди, сводя лопатки.

5. на брусьях
Выполнение: Встаньте на брусья, опуститесь вниз, сгибая локти, затем выжмите тело вверх.

6.Кроссоверы на тренажере
Выполнение: Встаньте между блоками, возьмитесь за рукоятки. Сводите руки перед собой, затем медленно разводите их обратно.
''';

class _GrudState extends State<Grud> {

  final videoURL = "https://www.youtube.com/watch?v=y91cEJH5au8";
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
                    Image.asset("assets/images/zitata3.jpg",),
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
