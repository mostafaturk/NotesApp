import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/add_notes_cubit/add_notes_cubit.dart';
import 'consts.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({Key? key, required this.isActive, required this.color}) : super(key: key);

  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
      radius: 38,
      backgroundColor:Colors.red,
      child: CircleAvatar(
        radius: 34,
        backgroundColor: color,
      ),
    )
        : CircleAvatar(
      radius: 38,
      backgroundColor: color,
    );
  }
}
class ColorsListView extends StatefulWidget {
  const ColorsListView({Key? key}) : super(key: key);

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {

  int currentIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
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
                  BlocProvider.of<AddNoteCubit>(context).color=kcolors[index];
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