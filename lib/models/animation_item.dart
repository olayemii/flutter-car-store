class AnimationItem {
  // This class will manage multiple animations
  // using a single animation controller
  final String id; //id of individual animation item
  final int entry; //entry time of animation
  final int entryDuration; // how long animation runs in milliseconds
  bool visible; // bool when animation starts

  AnimationItem({
    this.entry,
    this.entryDuration,
    this.id,
    this.visible,
  });
}

bool getItemVisibility(String id, List<AnimationItem> items) {
  // A helper to check if an animation is in play mode
  AnimationItem item = items.firstWhere((element) => element.id == id);
  return item != null ? item.visible : false;
}

int getSlideDuration(String id, List<AnimationItem> items) {
  // A helper to find the duration for each animation
  AnimationItem item = items.firstWhere((element) => element.id == id);
  return item != null ? item.entryDuration : 0;
}

List<AnimationItem> updateVisibleState(
    List<AnimationItem> items, double animationValue) {
  // Get the state of all animations based on the current
  // animation value
  return items.map((item) {
    if (!item.visible && animationValue >= item.entry) {
      item.visible = true;
    }
    return item;
  }).toList();
}
