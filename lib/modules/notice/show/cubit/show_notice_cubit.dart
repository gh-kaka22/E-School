import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'show_notice_state.dart';

class ShowNoticeCubit extends Cubit<ShowNoticeState> {
  ShowNoticeCubit() : super(ShowNoticeInitial());
}
