extension ShortenCapitalize on String {

  /// Convert the first letter of each [word] in the [sentence] to upper case
  /// EX: United Arab Emirates => [UAE]
  String toShortenCapitalize() {
    if(this.isEmpty) return "";

    // String output = this[0].toUpperCase();
    // for(int i = 0; i < this.length; i++) {
    //   if(this[i].contains(" ")){
    //     output += this[i+1].toUpperCase();
    //   }
    // }

    String output = "";
    final words = this.split(" ");
    for (var word in words) {
      output += word[0].toUpperCase();
    }
    return output;
  }

}