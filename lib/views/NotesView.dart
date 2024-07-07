import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_notes_cubit/add_notes_cubit.dart';

import '../cubits/notes_cubit/notes_cubit.dart';
import '../widgets/add_note_bottomsheet.dart';
import '../widgets/notes_views_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
            isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)
              ),
              context: context, builder: (context){
           return Bottomsheet();
          });
        },
        child: Icon(Icons.add,color: Colors.red,),
      backgroundColor: Colors.black,
      ),
      body: NotesViewBody(),
    );
  }
}


