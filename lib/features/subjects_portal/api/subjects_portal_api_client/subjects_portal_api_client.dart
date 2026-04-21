import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:team_5_examapp/config/shared_models/get_all_subjects_response/all_subjects_response_model/all_subjects_response_model.dart';
import 'package:team_5_examapp/core/constants/app_end_points.dart';

part 'subjects_portal_api_client.g.dart';

@RestApi()
@injectable
abstract class SubjectsPortalApiClient {
  @GET(AppEndPoints.getAllSubjects)
  Future<AllSubjectsResponseModel> getAllSubjects({
    @Header('token') required String token,
  });

  // factory method to create an instance of the api client using dio to allow injectable to see it and inject it where needed
  @factoryMethod
  factory SubjectsPortalApiClient(Dio dio) = _SubjectsPortalApiClient;
}
