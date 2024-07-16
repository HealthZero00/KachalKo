import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Trizeps extends StatefulWidget {
  const Trizeps({super.key});
  @override
  State<Trizeps> createState() => _TrizepsState();
}
String exercises = '''
1.Жим штанги узким хватом
Выполнение: Лягте на горизонтальную скамью, возьмитесь за штангу узким хватом. Опустите штангу к середине груди, затем выжмите её вверх.

2.Французский жим с гантелями
Выполнение: Лягте на скамью, держите гантели над головой. Сгибая локти, опустите гантели к ушам, затем выжмите их обратно.

3.Разгибания рук на блоке
Выполнение: Встаньте перед блоком, возьмитесь за рукоятку. Разгибайте руки вниз, затем медленно возвращайтесь в исходное положение.

4.Отжимания на брусьях
Выполнение: Встаньте на брусья, опуститесь вниз, сгибая локти, затем выжмите тело вверх.

5.Отжимания от скамьи с обратным хватом
Выполнение: Встаньте спиной к скамье, руки на краю скамьи. Опустите тело вниз, сгибая локти, затем поднимитесь обратно.

''';

class _TrizepsState extends State<Trizeps> {

  final videoURL = "https://www.youtube.com/watch?v=UhAt45tuirk&t=185s";
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
                    Image.asset("assets/images/zitata5.jpg",),
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
