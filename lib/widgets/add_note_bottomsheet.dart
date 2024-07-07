import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/cubits/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes_app/cubits/add_notes_cubit/add_notes_states.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/widgets/consts.dart';

import 'add_note_form.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class Bottomsheet extends StatefulWidget {
  const Bottomsheet({Key? key}) : super(key: key);

  @override
  State<Bottomsheet> createState() => _BottomsheetState();
}

class _BottomsheetState extends State<Bottomsheet> {

  bool isLoading =false;
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context)=>AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit,AddNoteState>(

        listener: (context,state){
        if(state is AddNoteFailure){

        }
        if(state is AddNoteSuccess){
        BlocProvider.of<NotesCubit>(context).fetchAllNotes();
        Navigator.pop(context);
        }
        },
       builder: (context,state){
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ? true: false,
            child: Padding(
              padding:  EdgeInsets.only(left: 16,right: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const   SingleChildScrollView(
                  child: AddNoteForm()),
            ),
          );
       },
        ),
    );
  }
}

