import 'package:bubble/bubble.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:csp_mobile_app/constant.dart';
import 'package:csp_mobile_app/models/chat_model.dart';
import 'package:csp_mobile_app/models/clickable_bubble.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final ChatModel chatModel;
  ChatPage({
    Key? key,
    required this.chatModel,
  }) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // AudioPlayer audioPlayer = new AudioPlayer();
  late Map<String, String> data;
  late List<Widget> dataList;
  Duration duration = new Duration();
  Duration position = new Duration();
  bool isPlaying = false;
  bool isLoading = false;
  bool isPause = false;
  ScrollController _scrollController = ScrollController();
  bool _needsScroll = false;

  _scrollToEnd() async {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 1000), curve: Curves.easeIn);
  }

  @override
  void initState() {
    data = widget.chatModel.questions;
    dataList = data.entries.map((entry) {
      if (widget.chatModel.lastElement == entry.key) {
        return _senderWidget(entry, nip: true, clickable: true);
      }
      return _senderWidget(entry, clickable: true);
    }).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final now = new DateTime.now();
    if (_needsScroll) {
      WidgetsBinding.instance?.addPostFrameCallback((_) => _scrollToEnd());
      _needsScroll = false;
    }
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("أقدر أساعدك")),
      ),
      body: Container(
        color: kwhite,
        child: ListView.builder(
          controller: _scrollController,
          itemBuilder: (ctx, index) {
            if (index == dataList.length) {
              return Container(
                padding: EdgeInsets.only(bottom: 80),
              );
            }
            return dataList[index];
          },
          itemCount: dataList.length + 1,
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _senderWidget(MapEntry entry, {nip = false, clickable = false}) {
    return Align(
      alignment: Alignment.topRight,
      child: ClickableWidget(
        onTap: (e) {
          if (!clickable) {
            return;
          }
          setState(() {
            List<Widget> tempData = [...dataList];
            dataList.clear();
            dataList.addAll(
              [
                ...tempData,
                _replyWidget(e.value),
                ...data.entries.map((entry) {
                  if (widget.chatModel.lastElement == entry.key) {
                    return _senderWidget(entry, nip: true, clickable: true);
                  }
                  return _senderWidget(entry, clickable: true);
                }).toList(),
              ],
            );
          });
          _needsScroll = true;
          // _scrollController.animateTo(dataList.length * 600,
          //     duration: Duration(milliseconds: 1000), curve: Curves.ease);
        },
        data: entry,
        child: Container(
          margin: EdgeInsets.only(right: 15),
          width: 250,
          child: Bubble(
            style: BubbleStyle(
              radius: Radius.circular(15),
              borderWidth: 1,
              borderColor: kgrey,
              nipWidth: 5,
            ),
            margin: BubbleEdges.only(top: 10),
            nip: nip ? BubbleNip.rightBottom : null,
            color: kwhite,
            child: Text(
              entry.key,
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ),
    );
  }

  Widget _replyWidget(text) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.only(right: 15, left: 15),
        width: 250,
        child: Bubble(
          style: BubbleStyle(
            nipWidth: 5,
          ),
          margin: BubbleEdges.only(top: 10),
          nip: BubbleNip.leftBottom,
          color: Colors.green[200],
          child: Text(
            text,
            textAlign: TextAlign.right,
            style: TextStyle(color: kblack),
          ),
        ),
      ),
    );
  }

  void _changeSeek(double value) {
    setState(() {});
  }

  void _playAudio() async {
    // final url =
    //     'https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_700KB.mp3';
    // if (isPause) {
    //   await audioPlayer.resume();
    //   setState(() {
    //     isPlaying = true;
    //     isPause = false;
    //   });
    // } else if (isPlaying) {
    //   await audioPlayer.pause();
    //   setState(() {
    //     isPlaying = false;
    //     isPause = true;
    //   });
    // } else {
    //   setState(() {
    //     isLoading = true;
    //   });
    //   await audioPlayer.play(url);
    //   setState(() {
    //     isPlaying = true;
    //   });
    // }

    // audioPlayer.onDurationChanged.listen((Duration d) {
    //   setState(() {
    //     duration = d;
    //     isLoading = false;
    //   });
    // });
    // audioPlayer.onAudioPositionChanged.listen((Duration p) {
    //   setState(() {
    //     position = p;
    //   });
    // });
    // audioPlayer.onPlayerCompletion.listen((event) {
    //   setState(() {
    //     isPlaying = false;
    //     duration = new Duration();
    //     position = new Duration();
    //   });
    // });
  }
}
