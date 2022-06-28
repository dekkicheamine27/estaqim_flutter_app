import 'package:flutter/material.dart';
import '../models/level.dart';

class LevelsList extends StatelessWidget {

  List<Level> levels;

  LevelsList(this.levels);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          itemCount: levels.length,
          itemBuilder: (BuildContext context, int position ){
            return MaterialButton(
                 child: Text(levels[position].name!),
                onPressed: (){}
            );
          }

      ),
    );
  }
}
