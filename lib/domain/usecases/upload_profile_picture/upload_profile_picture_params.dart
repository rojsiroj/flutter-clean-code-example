import 'dart:io';

import 'package:flix_id/domain/entities/user.dart';

class UploadProfilePictureParams {
  final File imageFile;
  final User user;

  UploadProfilePictureParams({required this.imageFile, required this.user});
}
