import 'package:clubhome/models/models.dart';
import 'package:clubhome/screens/room_screen.dart';
import 'package:clubhome/widgets/user_profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomCard extends StatelessWidget {
  final Room room;

  const RoomCard({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> Navigator.push(
        context, 
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (_) => RoomScreen(room: room)
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${room.club} 🏠'.toUpperCase(),
                  style: Theme.of(context).textTheme.overline!.copyWith(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.0,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  room.name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        height: 100.0,
                        child: Stack(
                          children: [
                            Positioned(
                                left: 28.0,
                                top: 28.0,
                                child: UserProfileImage(
                                  imageUrl: room.speakers[1].imageUrl,
                                  size: 49.0,
                                )),
                            UserProfileImage(
                              size: 48.0,
                              imageUrl: room.speakers[0].imageUrl,
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...room.speakers.map(
                              (e) => Text(
                                '${e.givenName} ${e.familyName} 💭', 
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                  fontSize: 16.0,
                                ),
                              )
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '${
                                        room.speakers.length + room.followedBySpeakers.length + room.others.length
                                      }'
                                    ),
                                    WidgetSpan(
                                      child: Icon(
                                        CupertinoIcons.person_fill, 
                                        size: 18.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' / ${room.speakers.length}'
                                    ), 
                                    WidgetSpan(
                                      child: Icon(
                                        CupertinoIcons.chat_bubble_fill, 
                                        size: 18.0, 
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ]
                                ), 
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
