import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:stour/screens/trending.dart';
import 'package:stour/util/const.dart';
import 'package:stour/util/places.dart';
import 'package:stour/widgets/place_card.dart';
// import 'package:stour/model/place.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:stour/widgets/search_card.dart';
import 'package:stour/screens/home_app_bar.dart';
import 'package:flutter/services.dart';

class GoogleMapsController extends StatefulWidget {
  const GoogleMapsController({Key? key}) : super(key: key);

  @override
  State<GoogleMapsController> createState() => _GoogleMapsControllerState();
}

class _GoogleMapsControllerState extends State<GoogleMapsController> {
  late GoogleMapController mapController;

  LatLng _center = const LatLng(10.870051045334415, 106.80301118465547);
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    determinePosition().then(
      (position) {
        getUserAddress(position);
        setState(
          () {
            _center = LatLng(position.latitude, position.longitude);
            _markers.add(
              (Marker(
                markerId: const MarkerId('user_location'),
                position: _center,
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRed),
              )),
            );
          },
        );
      },
    );
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<List<String>> getAddressInfoFromPosition(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark placemark = placemarks.first;
    String country = placemark.country ?? "";
    String district = (placemark.subAdministrativeArea) ?? "";
    String city = placemark.administrativeArea ?? "";
    return [district, city, country];
  }

  void getUserAddress(Position src) async {
    currentLocationDetail = await getAddressInfoFromPosition(src);
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 11.0,
      ),
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Constants.lightBG,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: HomeAppBar(),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SafeArea(
            child: ListView(
              children: <Widget>[
                const SizedBox(height: 10),
                const Text(
                  'Vị Trí Hiện Tại',
                  style: TextStyle(
                    color: Color.fromARGB(255, 35, 52, 10),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                    height: 200, width: 300, child: GoogleMapsController()),
                const SizedBox(height: 20.0),
                buildPlaceRow('Địa Điểm Văn Hóa', places, context),
                const SizedBox(height: 3.0),
                buildPlaceList(context, places),
                const SizedBox(height: 5.0),
                buildPlaceRow('Đặc Sản', food, context),
                const SizedBox(height: 3.0),
                buildPlaceList(context, food),
                const SizedBox(height: 30),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
        //bottomNavigationBar: HomeBottomBar(),
      ),
    );
  }
}

Widget buildPlaceList(BuildContext context, List<Place> source) {
  return SizedBox(
    height: MediaQuery.of(context).size.height / 2.4,
    width: MediaQuery.of(context).size.width,
    child: ListView.builder(
      primary: false,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      // itemCount: places == null ? 0 : places.length,
      itemCount: source.length,
      itemBuilder: (BuildContext context, int index) {
        Place place = source[index];
        return Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: PlaceCard(place: place),
        );
      },
    ),
  );
}

Widget buildPlaceRow(String place, List<Place> source, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text(
        place,
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w800,
        ),
      ),
      TextButton(
        child: Text(
          "Xem tất cả (${source.length})",
          style: TextStyle(
            color: Constants.text,
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return Trending(source: source);
              },
            ),
          );
        },
      ),
    ],
  );
}

Widget buildSearchBar(BuildContext context) {
  return Container(
      margin: const EdgeInsets.fromLTRB(10, 5, 10, 0), child: SearchCard());
}
