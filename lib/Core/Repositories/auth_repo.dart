///This is a sample authentication Repository
///
/// The purpose of this repository is to list all authentication functions or
/// methods you wish to implement as well as their arguments and return types.
/// However all implementation will take place in the service file that calls this repository.
///
abstract class AuthRepo {
  //This is a sample login method that requires an argument named data of type
  // Map and returns a Future
  Future login({required Map data});

  //This is a sample signup method that requires an argument named data of type
  //Map and returns a Future
  Future signup({required Map data});
}
