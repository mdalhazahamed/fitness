import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';


class DetailsScreen extends StatefulWidget {
  var data;
  DetailsScreen(this.data);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  //final player = AudioPlayer();

  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  String? time(Duration duration) {
    String twodigits(int n) => n.toString().padLeft(2, '0');
    final hours = twodigits(duration.inHours);
    final minutes = twodigits(duration.inMinutes.remainder(60));
    final seconds = twodigits(duration.inSeconds.remainder(60));

    return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
  }

  addtoFavourite() async {
    FirebaseFirestore.instance
        .collection('favourite_items')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("items")
        .doc()
        .set(
      {
        'img': widget.data['img'],
        'profile_img': widget.data['profile_img'],
        'videos': widget.data['videos'],
        'date': widget.data['date'],
        'like': widget.data['like'],
        'rating': widget.data['rating'],
        'position': widget.data['position'],
         'music': widget.data['music'],
      },
    ).whenComplete(() {
      Fluttertoast.showToast(
          msg: "Added to favourite",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.deepOrange,
          textColor: Colors.white,
          fontSize: 13.0);
    }).catchError((error) => print("Failed to add user: $error"));
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> checkFav(
      BuildContext context) async* {
    yield* FirebaseFirestore.instance
        .collection("favourite_items")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("items")
        .where("img", isEqualTo: widget.data['img'])
        .snapshots();
  }

  Future setAudio(data) async {
    audioPlayer.setReleaseMode(ReleaseMode.STOP);
    
    audioPlayer.setUrl(
       data);
  }

  @override
  void initState() {
    setAudio(widget.data['music']);
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.PLAYING;
      });
    });
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
          "  AppString.recentlyPlayed",
            
          ),
          centerTitle: true,
          actions: [
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: checkFav(context),
              builder: (context, snapshot) {
                if (snapshot.data == null) return Text("");
                return IconButton(
                  icon: snapshot.data!.docs.length == 0
                      ? Icon(
                          Icons.favorite_outline,
                        )
                      : Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                  onPressed: () {
                    snapshot.data!.docs.length == 0
                        ? addtoFavourite()
                        : Fluttertoast.showToast(
                            msg: "Already Added",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.SNACKBAR,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.deepOrange,
                            textColor: Colors.white,
                            fontSize: 13.0);
                  },
                );
              },
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(12.h),
          child: Column(
            children: [
              Container(
                height: 300.h,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(widget.data['img'],fit: BoxFit.fill,)),
              ),
               SizedBox(
                height: 20.h,
              ),
              Text(widget.data['name'],),
              SizedBox(
                height: 20.h
              ),
              Slider(
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(),
                  onChanged: (value) async {
                    final position = Duration(seconds: value.toInt());
                    await audioPlayer.seek(position);
                    await audioPlayer.resume();
                  }),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(time(position) ?? ''),
                  Text(time(duration) ?? ''),
                ],
              ),
              CircleAvatar(
                radius: 30,
                child: IconButton(
                  onPressed: () async {
                    if (isPlaying) {
                      await audioPlayer.pause();
                    } else {
                      await audioPlayer.resume();
                    }
                  },
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                  iconSize: 40,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
