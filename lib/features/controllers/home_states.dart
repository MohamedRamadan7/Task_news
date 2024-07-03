abstract class HomeStates {
  const HomeStates();
}

class HomeInitialStates extends HomeStates {}


///======================= Search1 States =======================///

class Search1LoadingState extends HomeStates {}

class Search1SuccessState extends HomeStates {}

class Search1ErrorState extends HomeStates {
  final String error;
  Search1ErrorState(this.error);
}

///============== Search1  States ================///

class Search2LoadingState extends HomeStates {}

class Search2SuccessState extends HomeStates {}

class Search2ErrorState extends HomeStates {
  final String error;
  Search2ErrorState(this.error);
}


