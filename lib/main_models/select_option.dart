class SelectOption {
  final dynamic value;
  final String label;
  final String? subLabel;
  final int? id;
  bool isSelected = false;
  SelectOption(this.value, this.label, {this.subLabel,this.isSelected = false, this.id});
}
