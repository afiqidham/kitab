
import 'package:get/get.dart';


class ProfileViewModel extends GetxController {
  var profilePicture = "false".obs;
  var profilePicturePath = false.obs;
  final RxBool isVisible = false.obs;
  final RxBool selected = false.obs;

  void setProfilePicture(String path) {
    profilePicture.value = path;
    profilePicturePath.value = true;
  }

  void showProfileDetails() {
    isVisible.value = !isVisible.value;
  }

  void changeAlignment() {
    selected.value = !selected.value;
  }
}
