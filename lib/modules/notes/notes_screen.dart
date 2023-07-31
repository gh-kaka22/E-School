
import 'package:e_school/modules/notes/cubit/notes_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/components/attendance_notes.dart';

class NotesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;
    double h=MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (BuildContext context) => NotesCubit()..getNotices(),
      child: BlocConsumer<NotesCubit, NotesState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Notes'),
            ),
            body: ShowNotesBuilder(
              w,
              h,
              NotesCubit
                  .get(context)
                  .notesModel
                  ?.data,
              context,
              state,

            ),
          );
        },
      ),
    );
  }
}
