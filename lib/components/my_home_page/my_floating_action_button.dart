import 'package:flutter/material.dart';
import 'package:project2_mobile/pages/create_team_page.dart';


// Widget myFloatingActionButton =  = FloatingActionButton(
//                                   onPressed: () {
//                                     Navigator.push(context, MaterialPageRoute(builder: (context) => CreateTeamPage()));
//                                   },
//                                   child: const Icon(Icons.face_retouching_natural_outlined),
//                                 )

Widget myFloatingActionButton(BuildContext context) {
  return FloatingActionButton(
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => CreateTeamPage()));
    },
    child: const Icon(Icons.face_retouching_natural_outlined),
  );
}

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CreateTeamPage()));
      },
      child: const Icon(Icons.face_retouching_natural_outlined),
    );
  }
}