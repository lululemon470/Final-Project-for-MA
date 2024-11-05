import 'dart:io';
void main(){
  stdout.write("Enter String: ");
  String? inputText = stdin.readLineSync();
  String listText = inputText.toString().trim();

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
  print("Char Count:");
  for(var item in characterCount){
    print(item);
  }
}