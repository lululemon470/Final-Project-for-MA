import 'dart:io';

void main(){
  stdout.write("Enter String: ");
  String? inputText = stdin.readLineSync();
  dynamic a = countString(inputText.toString().trim());

  for(var items in a){
    print(items);
  }
  print("========================================================");
  print("Map: {$a}");
}

dynamic countString(String listText){
  List<String> list = listText.split("");
  Set listSet = list.toSet();
  dynamic characterCount = [];

  for (var characters in listSet){
    int count = 0;
    for (var item in list){
      if (item == characters){
        count++;
      }
    }
    if(characters != " "){
      characterCount.add({
        characters: count,
      });
    }
  }
  return characterCount;
}