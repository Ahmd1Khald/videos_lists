import 'package:hive/hive.dart';

import '../constance/variables.dart';

class AppFunctions {
  static int getVideoLink(
      {required String bookName, required int selectedCat}) {
    int index = -1;
    if (selectedCat == 0) {
      for (int i = 0; i < AppVariable.phonicsVideosNames.length; i++) {
        if (AppVariable.phonicsVideosNames[i] == bookName) {
          index = i;
        }
      }
    } else if (selectedCat == 1) {
      for (int i = 0; i < AppVariable.mathsVideosNames.length; i++) {
        if (AppVariable.mathsVideosNames[i] == bookName) {
          index = i;
        }
      }
    } else if (selectedCat == 2) {
      for (int i = 0; i < AppVariable.programmingVideosNames.length; i++) {
        if (AppVariable.programmingVideosNames[i] == bookName) {
          index = i;
          print('2222222222222222222--$index');
        }
      }
    } else if (selectedCat == 3) {
      for (int i = 0; i < AppVariable.storiesVideosNames.length; i++) {
        if (AppVariable.storiesVideosNames[i] == bookName) {
          index = i;
        }
      }
    } else if (selectedCat == 4) {
      for (int i = 0; i < AppVariable.scienceVideosNames.length; i++) {
        if (AppVariable.scienceVideosNames[i] == bookName) {
          index = i;
        }
      }
    }
    return index;
  }
}

Future<void> saveData<T>(
    {required List<T> data, required String boxName}) async {
  try {
    // Open the Hive box for writing
    var box = await Hive.openBox<T>(boxName);

    // Clear the box to remove any existing data (optional)
    // box.clear();

    // Save the data to the box
    await box.addAll(data);

    // Close the box after the operation is complete
    await box.close();
  } catch (e) {
    print('Error while saving data to Hive: $e');
  }
}
