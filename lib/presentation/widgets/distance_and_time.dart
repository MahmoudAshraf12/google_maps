import 'package:flutter/material.dart';

import '../../constants/my_colors.dart';
import '../../data/models/place_direction.dart';

class DistanceAndTime extends StatelessWidget {
  final PlaceDirections? placeDirections;
  final isTimeAndDistanceVisible;

  const DistanceAndTime(
      {Key? key, this.placeDirections, required this.isTimeAndDistanceVisible})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isTimeAndDistanceVisible,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 420),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                //margin: EdgeInsets.fromLTRB(20, 50, 20, 0),
                color: Colors.white,
                child: ListTile(
                  dense: true,
                  horizontalTitleGap: 0,
                  leading: Icon(
                    Icons.access_time_filled,
                    color: MyColors.blue,
                    size: 30,
                  ),
                  title: Text(
                    placeDirections!.totalDuration,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Flexible(
              flex: 1,
              child: Card(
                //elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                //margin: EdgeInsets.fromLTRB(50, 100, 50, 0),
                color: Colors.white,
                child: ListTile(
                  dense: true,
                  //horizontalTitleGap: 0,
                  leading: Icon(
                    Icons.directions_car_filled,
                    color: MyColors.blue,
                    size: 30,
                  ),
                  title: Text(
                    placeDirections!.totalDistance,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
