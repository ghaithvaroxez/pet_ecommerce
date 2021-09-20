import 'package:get/get.dart';
import 'package:pets/screens/filter/model/type_model.dart';

class FilterType extends GetxController {
  List<AnimalTypeModel> types = [
    AnimalTypeModel(
      type: "قطط",
      typeNames: [
        "قطط1",
        "قطط2",
        "قطط3",
        "قطط4",
        "قطط5",
        "قطط6",
        "قطط7",
      ],
    ),
    AnimalTypeModel(
      type: "كلاب",
      typeNames: [
        "كلاب1",
        "كلاب2",
        "كلاب3",
        "كلاب4",
        "كلاب5",
        "كلاب6",
        "كلاب7",
      ],
    ),
    AnimalTypeModel(
      type: "أسماك",
      typeNames: [
        "أسماك1",
        "أسماك2",
        "أسماك3",
        "أسماك4",
        "أسماك5",
        "أسماك6",
        "أسماك7",
      ],
    ),
    AnimalTypeModel(
      type: "خيول",
      typeNames: [
        "خيول1",
        "خيول2",
        "خيول3",
        "خيول4",
        "خيول5",
        "خيول6",
        "خيول7",
      ],
    ),
    AnimalTypeModel(
      type: "دواجن",
      typeNames: [
        "دواجن1",
        "دواجن2",
        "دواجن3",
        "دواجن4",
        "دواجن5",
        "دواجن6",
        "دواجن7",
      ],
    ),
    AnimalTypeModel(
      type: "عصافير",
      typeNames: [
        "عصافير1",
        "عصافير2",
        "عصافير3",
        "عصافير4",
        "عصافير5",
        "عصافير6",
        "عصافير7",
      ],
    ),
  ];

  AnimalTypeModel selectedType;

  int index = 0;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    selectedType = types[index];
    types[index].selectedTypeIndex = 0;
  }

  changeType(int typeIndex) {
    selectedType = types[typeIndex];
    update();
  }

  changeTypename(int selectedTypeIndexName) {
    types[index].selectedTypeIndex = selectedTypeIndexName;
    update();
  }

  int getIndex() {
    return index;
  }
}
