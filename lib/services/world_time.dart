import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime {

  String location; //location name for the UI
  String time = '';   // the time in that location
  String flag;  //url to an asset flag icon
  String url; //location url for api end point
  bool isDaytime = true; //true or false if daytime or night time

  WorldTime({required this.location , required this.flag , required this.url});


  Future <void> getTime() async {

    try{

      Response response = await get(
          Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      // print(data);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // print(datetime);
      // print(offset);

      //creating a DateTime object.

      DateTime now = DateTime.parse(datetime);
      // print('${now.day}-${now.month}-${now.year}');
      // print(now);

      now = now.add(Duration(hours: int.parse(offset)));
      // print(now);

      //time format
      isDaytime = now.hour>6 && now.hour<20  ? true : false;
      time = DateFormat.jm().format(now);

    }

    catch (e) {
      print('caught error $e');
      // time = 'could not get time';
    }

  }
}



