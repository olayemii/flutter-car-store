class AnimationItem {
  final String id;
  final int entry;
  final int entryDuration;
  bool visible;

  AnimationItem({
    this.id,
    this.entryDuration,
    this.entry,
    this.visible,
  });
}

bool getItemVisibility(String id, List<AnimationItem> items) {
  AnimationItem item = items.firstWhere((element) => element.id == id);

  return item != null ? item.visible : false;
}

int getSlideDuration(String id, List<AnimationItem> items) {
  AnimationItem item = items.firstWhere((element) => element.id == id);

  return item != null ? item.entryDuration : 0;
}

List<AnimationItem> updateVisibleState(
    List<AnimationItem> items, double animationValue) {
  return items.map((item) {
    // if (item.visible && animationValue > item.exit) {
    //   item.visible = false;
    //   return item;
    // } else

    if (!item.visible && animationValue >= item.entry) {
      item.visible = true;
      return item;
    }
    return item;
  }).toList();
}
