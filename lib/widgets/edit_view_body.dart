import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

import '../models/note_model.dart';
import 'add_note_form.dart';
import 'colors_list_view.dart';
import 'consts.dart';
import 'edit_note_color.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({Key? key, required this.note}) : super(key: key);

  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {

   String ? title,subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          const  SizedBox(height: 50,),
            CustomAppBar(
            onPressed: (){
              widget.note.title=title ?? widget.note.title;
              widget.note.title=subtitle ?? widget.note.subTitle;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);

            },
            title:"Edit Note" ,
            icon: Icons.check,
          ),
          const SizedBox(height: 50,),
           CustomTextField(
              onChange: (val){
                title=val;
              },
              hint: widget.note.title),
          const  SizedBox(height: 20,),
             CustomTextField(
            onChange: (val){
              subtitle=val;
            },
            hint: widget.note.subTitle,maxLines: 5,),
          const  SizedBox(height: 20,),
          EditViewColorsLIst(
            note: widget.note,
          ),

        ],
      ),
    );
  }
}



