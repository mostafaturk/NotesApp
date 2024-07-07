import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/Edit_Note_View.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({Key? key, required this.note}) : super(key: key);


  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return EditNoteView(
            note: note,
          );
        }));
      },
      child: Container(
        padding: EdgeInsets.only(top: 25,bottom: 25,left: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(note.color)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title:Text(note.title,
                style: TextStyle(color: Colors.black,fontSize: 26),),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16,bottom: 16),
                child: Text(note.subTitle,
                    style: TextStyle(color: Colors.black.withOpacity(0.5),fontSize: 18)),
              ),
              trailing: IconButton(
                onPressed: (){
                  note.delete();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                },
                icon: Icon(
                  FontAwesomeIcons.trash,
                  size: 25,
                  color: Colors.black,
                ),),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Text(note.date,style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),),
            )
          ],
        ),
      ),
    );
  }
}