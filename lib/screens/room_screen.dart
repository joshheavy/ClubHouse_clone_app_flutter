import 'dart:math';

import 'package:clubhome/models/models.dart';
import 'package:clubhome/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomScreen extends StatelessWidget {
  final Room room;

  const RoomScreen({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 120.0,
        leading: TextButton.icon(
          style: TextButton.styleFrom(
            primary: Colors.black
          ),
          onPressed: () => Navigator.of(context).pop(), 
          icon: Icon(CupertinoIcons.chevron_down), 
          label: Text(
            "All rooms",
          )
        ),
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.doc), 
            onPressed: (){}
          ), 
           GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 10.0, 20.0, 10.0),
              child:
                UserProfileImage(imageUrl: currentUser.imageUrl, size: 36.0),
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(12.0),
        height: MediaQuery.of(context).size.height,
        width: double.infinity, 
        decoration: BoxDecoration(
          color: Colors.white, 
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${room.club} 🏠'.toUpperCase(),
                        style: Theme.of(context).textTheme.overline!.copyWith(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.0,
                        ),
                      ), 
                      GestureDetector(
                        onTap: (){},
                        child: const Icon(CupertinoIcons.ellipsis),
                      )
                    ],
                  ),
                  Text(
                    room.name, 
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 16.0, 
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  )
                ],
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(20.0),
              sliver: SliverGrid.count(
                crossAxisCount: 3, 
                mainAxisSpacing: 20.0,
                children: room.speakers.map((e) => RoomUserProfile(
                    imageUrl: e.imageUrl,
                    size: 66.0,
                    name: e.givenName,
                    isMuted: Random().nextBool(),
                    isNew: Random().nextBool(),
                  )
                ).toList(),
              ),
            ), 
            SliverToBoxAdapter(
              child: Text(
                'Followed by speakers', 
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: Colors.grey[400], 
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(20.0),
              sliver: SliverGrid.count(
                crossAxisCount: 4,
                mainAxisSpacing: 20.0,
                childAspectRatio: 0.8,
                children: room.followedBySpeakers
                    .map((e) => RoomUserProfile(
                          imageUrl: e.imageUrl,
                          size: 66.0,
                          name: e.givenName,
                          isNew: Random().nextBool(),
                        ))
                    .toList(),
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                'Others in room',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(20.0),
              sliver: SliverGrid.count(
                crossAxisCount: 4,
                mainAxisSpacing: 20.0,
                childAspectRatio: 0.8,
                children: room.others
                    .map((e) => RoomUserProfile(
                          imageUrl: e.imageUrl,
                          size: 66.0,
                          name: e.givenName,
                          isNew: Random().nextBool(),
                        ))
                    .toList(),
              ),
            ),
            SliverPadding(padding: EdgeInsets.only(bottom: 100.0),),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0, 
          vertical: 12.0,
        ),
        height: 110.0, 
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 6.0, 
                  horizontal: 16.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[300], 
                  borderRadius: BorderRadius.circular(24.0), 
                ),
                child: const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '✌',
                        style: TextStyle(fontSize: 20.0)
                      ), 
                      TextSpan(
                        text: 'Leave quietly', 
                        style: TextStyle(
                          fontSize: 16.0, 
                          fontWeight: FontWeight.w600, 
                          letterSpacing: 1.0
                        )
                      )
                    ]
                  ),
                ),
              ),
            ), 
            Row(
              children: [
              GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                    ),
                    child: const Icon(
                      CupertinoIcons.add,
                      size: 30.0,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                    ),
                    child: const Icon(
                      CupertinoIcons.hand_raised,
                      size: 30.0,
                    ),
                  ),
                ),
              ],
            )
          ],
        ), 
      ),
    );
  }
}
