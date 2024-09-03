import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil_test/models/user_model.dart';
import 'package:meta/meta.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit() : super(UserDataInitial());

  static UserDataCubit get(context) => BlocProvider.of<UserDataCubit>(context);

  UserModel user = UserModel();

  updateData({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? userType,
    String? about,
    String? salary,
    String? bDate,
    String? gender,
    List<String>? skills,
    List? favMedia,
}){
    user.firstName = firstName?? user.firstName;
    user.lastName = lastName?? user.lastName;
    user.email = email?? user.email;
    user.password = password?? user.password;
    user.userType = userType?? user.userType;
    user.about = about?? user.about;
    user.salary = salary?? user.salary;
    user.bDate = bDate?? user.bDate;
    user.gender = gender?? user.gender;
    user.skills = skills?? user.skills;
    user.favMedia = favMedia?? user.favMedia;
    emit(UserDataIUpdate());
}
}
