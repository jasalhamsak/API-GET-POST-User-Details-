import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../Resources/Models/DetailsModel.dart';
part 'homescreen_state.dart';

class HomescreenCubit extends Cubit<HomescreenState> {
  HomescreenCubit(this.token) : super(HomescreenInitial()){
    getDetails();
  }

  final String token;

  getDetails() async {
    emit(HomescreenLoading());
    const url = "https://crm-beta-api.vozlead.in/api/v2/lead/lead_list/";
    final response = await http.get(Uri.parse(url), headers: {
      "Authorization": "Token $token", // Example: Bearer token for authentication
      "Accept": "application/json", // Example: Accept JSON responses
    });

    if (response.statusCode == 200) {
      final data = detailsModelFromJson(response.body);
      emit(HomescreenLoaded(data: data));
    } else {
      emit(HomescreenError());
    }
  }
}
