import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:videos_lists/Features/Videos_lists/domain/entites/items/items_entity.dart';

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

  static loadingPage({required context}) => showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Center(
          child: circleLoading(color: Colors.white),
        ),
      );

  static circleLoading({required color}) {}
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

void updateValuesAndClearBox(
    {required List<ItemsEntity> newData, required String boxName}) async {
  final box = await Hive.openBox<ItemsEntity>(boxName);

  // Retrieve and update the data
  const int dataIndexToUpdate = 1; // Replace with the index you want to update
  if (box.containsKey(dataIndexToUpdate)) {
    final ItemsEntity? data = box.get(dataIndexToUpdate);
    // data?.title = '';
    // data?.id = 40;
    // data?.mediaPath = '';
    // data?.videoUrl = '';
    box.put(dataIndexToUpdate, data!); // Update the data in the box
  }

  // Clear the box
  await box.clear();

  // Close the box when done
  await box.close();
}
