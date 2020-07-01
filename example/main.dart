import 'package:wia_dart_package/wia.dart';

void main() async {
  var clientKey = "ck_HDUVdx2YZ2EqDNgD9vXR";
  // var accessToken = "your_wia_access_token";

  Wia wia = new Wia(clientKey: clientKey);

  // User class is exported from `main.dart` file
  try {
    AccessToken accessTokenRequest =
        await wia.login("test@wia.io", "deZ9vPn9YcTqLDd2");

    User userRequest = await wia.retrieveUserMe();
    print(userRequest.id);

    // List<Organisation> listOrganisationsRequest = await wia.listOrganisations();
    // // print(listSpacesRequest);
    // listOrganisationsRequest.forEach((org) {
    //   print(org.id);
    //   print(org.name);
    // });

    String spaceId = null;
    List<Space> listSpacesRequest = await wia.listSpaces();
    // print(listSpacesRequest);
    listSpacesRequest.forEach((space) {
      if (spaceId == null) {
        spaceId = space.id;
      }

      print(space.id);
      print(space.name);
      print(space.location);
      if (space.location != null) {
        print("Got location! Lat: " + space.location.latitude.toString());
      }

      // print(space.avatar);
      // print(space.avatar.url);
    });

    List<Device> listDevicesRequest = await wia.listDevices(spaceId: spaceId);
    listDevicesRequest.forEach((device) {
      // print(device.id);
      // print(device.name);
      print(device.location);
      print(device.events);
    });

    print("DONE!");
  } catch (err) {
    print(err);
  }
}
