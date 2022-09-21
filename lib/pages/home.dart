import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};





  @override
  Widget build(BuildContext context) {

    var argument = ModalRoute.of(context)?.settings.arguments;
    if(argument is Map) {
      data = data.isNotEmpty? data: argument;
      // print(data);
    }


    // print('counter is $counter');


    //set background image
    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png' ;

    Color bgColor = (data['isDaytime']??true) ? Colors.blue : Colors.indigo.shade700;

    return Scaffold(
     backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
             decoration: BoxDecoration(
               image: DecorationImage(
                 image: AssetImage('assets/$bgImage'),
                  fit: BoxFit.cover,
               ),
               ),

            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
              child: Column(
                     children: <Widget>[

                        IconButton(

                          onPressed: ()  async {

                            Navigator.pushNamed(context, '/location').then((result) {
                              var popData = result;
                              if (popData is Map){
                                data = popData;
                                print(data);
                              }
                              setState((){



                              });
                            });



                          },
                          icon: Icon(
                            Icons.edit_location,
                            color: Colors.grey[300],
                          ),
                        ),

                       SizedBox(height: 20.0),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget> [

                          Text(
                            data['location'],
                            style: TextStyle(
                              fontSize: 28.0,
                              letterSpacing: 2.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                   SizedBox(height: 20.0),

                   Text(
                       data['time'],
                       style: TextStyle(
                         fontSize: 67.0,
                         color: Colors.white,

                   ),

                       ),

                     ],

      ),
            ),
          )),


    );
  }
}
