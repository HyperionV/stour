// @dart=2.17
import 'package:flutter/material.dart';
import 'package:stour/util/const.dart';

class PlaceCard extends StatefulWidget {
  final String img;
  final String title;
  final String address;
  final String rating;
  final String time;

  const PlaceCard({
    super.key,
    required this.img,
    required this.title,
    required this.address,
    required this.rating,
    required this.time,
  });

  @override
  State<PlaceCard> createState() => _PlaceCardState();
}

class _PlaceCardState extends State<PlaceCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 2.9,
        width: MediaQuery.of(context).size.width / 1.2,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 3.0,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3.7,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                      child: Image.asset(
                        widget.img,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 6.0,
                    right: 6.0,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              color: Constants.ratingBG,
                              size: 10,
                            ),
                            Text(
                              " ${widget.rating} ",
                              style: const TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 6.0,
                    left: 6.0,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          " ${widget.time}",
                          style: const TextStyle(
                            fontSize: 10.0,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 7),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const SizedBox(height: 7),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    widget.address,
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}
