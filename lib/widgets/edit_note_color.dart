import 'package:flutter/material.dart';

import '../models/note_model.dart';
import 'colors_list_view.dart';
import 'consts.dart';

class EditViewColorsLIst extends StatefulWidget {
  const EditViewColorsLIst({Key? key, required this.note}) : super(key: key);

  final NoteModel note;

  @override
  State<EditViewColorsLIst> createState() => _EditViewColorsLIstState();
}

class _EditViewColorsLIstState extends State<EditViewColorsLIst> {
  late int currentIndex;

  @override
  void initState() {
    currentIndex = kcolors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38*2,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: kcolors.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: GestureDetector(
                onTap: (){
                  currentIndex = index;
                  widget.note.color=kcolors[index].value;
                  setState(() {

                  });
                },
                child: ColorItem(
                  color: kcolors[index],
                  isActive: currentIndex ==index,
                ),
              ),
            );

          }),
    );
  }
}
