import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes_app/cubits/add_notes_cubit/add_notes_states.dart';
import 'package:notes_app/models/note_model.dart';

import 'colors_list_view.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({Key? key}) : super(key: key);

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {

  AutovalidateMode autovalidateMode =AutovalidateMode.disabled;

  final GlobalKey <FormState> formkey = GlobalKey();

  String? title ,subtitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(height: 32,),
          CustomTextField(
            onSaved:(val){
              title=val;
            } ,
            hint: "Title",
          ),
          const SizedBox(height: 16,),
          CustomTextField(
            onSaved:(val){
              subtitle=val;
            } ,

            hint: "content",
            maxLines: 5,
          ),
          const SizedBox(height: 32,),

          ColorsListView(),

          const SizedBox(
            height: 35,
          ),
          BlocBuilder<AddNoteCubit,AddNoteState>(
            builder: (context,state){
             return CustomButton(
                isLoading: state is AddNoteLoading? true : false,
                onTap: (){
                  if(formkey.currentState!.validate()){
                    formkey.currentState!.save();

                    var Currentday=DateTime.now();

                    var formattedCurrentDate = DateFormat('dd-mm-yyyy').format(Currentday);

                    var noteModel= NoteModel(
                        title: title!,
                        subTitle: subtitle!,
                        date: formattedCurrentDate,
                        color: Colors.grey.value);

                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);

                  }else{
                    autovalidateMode=AutovalidateMode.always;
                  }
                },
              );
            },

          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}




