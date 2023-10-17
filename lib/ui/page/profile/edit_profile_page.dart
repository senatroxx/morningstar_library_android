part of '../page.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  File? _image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      showAction: false,
      showBottomNav: false,
      title: "Edit Profile",
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            profilePicture(),
            const SizedBox(
              height: 20,
            ),
            const CustomTextField(
              "Full Name",
              formName: "formName",
              initialValue: "Jane Doe",
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTextField(
              "Email",
              formName: "formName",
              initialValue: "janedoe@gmail.com",
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomDropdownField(
              "Gender",
              formName: "formName",
              hint: "Choose Gender",
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonPrimary(title: "Save Changes", callbackfunc: () {})
          ],
        ),
      ),
    );
  }

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    await _cropImage(pickedFile!.path);
  }

  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    await _cropImage(pickedFile!.path);
  }

  Future _cropImage(filePath) async {
    final croppedImage = await ImageCropper().cropImage(
      sourcePath: filePath,
      maxWidth: 1080,
      maxHeight: 1080,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: kPrimaryColor,
          toolbarWidgetColor: kWhiteColor,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: true,
        )
      ],
    );

    setState(() {
      _image = File(croppedImage!.path);
    });
  }

  Future showOptions() async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: const Text('Photo Gallery'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from gallery
              getImageFromGallery();
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Camera'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from camera
              getImageFromCamera();
            },
          ),
        ],
      ),
    );
  }

  Widget profilePicture() {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: GestureDetector(
        onTap: () async => await showOptions(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 150,
              height: 150,
              child: FittedBox(
                fit: BoxFit.cover,
                child: CircleAvatar(
                  radius: 20,
                  // backgroundColor: Colors.transparent,
                  backgroundImage: _image == null
                      ? const AssetImage('assets/images/profile.png')
                      : null,
                  child: _image != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.file(
                            _image!,
                            fit: BoxFit.scaleDown,
                          ),
                        )
                      : null,
                ),
              ),
            ),
            Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black45,
              ),
            ),
            const Text(
              "Change Photo",
              style: TextStyle(
                color: kWhiteColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
