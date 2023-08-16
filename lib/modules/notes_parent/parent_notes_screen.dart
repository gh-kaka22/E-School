import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_school/language/language_constants.dart';
import 'package:e_school/modules/attendance/cubit/attendance_cubit.dart';
import 'package:e_school/modules/notes/cubit/notes_cubit.dart';
import 'package:e_school/modules/notes_parent/cubit/parent_notes_cubit.dart';
import 'package:e_school/modules/notes_parent/cubit/parent_notes_state.dart';
import 'package:e_school/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/components/attendance_notes.dart';

class ParentNotesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;
    double h=MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (BuildContext context) => ParentNotesCubit()..getNoticesParent(kidID),
      child: BlocConsumer<ParentNotesCubit, ParentNotesState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(translation(context).notices),
            ),
            body: ShowNotesBuilder(
              w,
              h,
              ParentNotesCubit
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
