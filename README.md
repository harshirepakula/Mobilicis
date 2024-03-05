# Mobilicis



1. **ViewController Class**: This is a standard Swift class inheriting from `UIViewController`. It represents a view controller in our iOS app, which typically manages a portion of your app's user interface.

2. **viewDidLoad() Method**: This method is called automatically when the view controller's view is loaded into memory. In this method, `super.viewDidLoad()` is called first to ensure that any setup required by the superclass is completed.

3. **getDeviceInfo() Method**: This method is defined to retrieve various device information. It's called from `viewDidLoad()` to fetch device information when the view controller loads.

4. **Retrieving Device Information**:
   - **Model Name and Model Number**: `UIDevice.current` is used to retrieve the current device. `model` property provides the model name, and `localizedModel` property provides the model number.
   - **iOS Version**: `systemVersion` property of `UIDevice.current` gives the iOS version running on the device.
   - **Storage**: The code attempts to retrieve the total storage capacity of the device in bytes using `FileManager.default.attributesOfFileSystem(forPath:)`. It then converts this value to gigabytes (GB).
   - **Battery Health and Level**: The code enables battery monitoring using `UIDevice.current.isBatteryMonitoringEnabled` and retrieves battery health and level. Battery health is represented as a percentage.
   - **Camera MegaPixel and Aperture**: The code uses `AVCaptureDevice.DiscoverySession` to find available cameras. If a camera is found, it retrieves the maximum exposure duration (which might represent megapixels) and maximum ISO (which might represent aperture).
   - **Processor Information**: The code retrieves the number of processors available on the device using `ProcessInfo.processInfo.processorCount`.
   - **GPU Information**: The code gets GPU information using `UIDevice.current.model`. Note that this might not provide precise GPU information.
   - **IMEI**: The comment indicates that IMEI is not accessible through public APIs due to privacy and security reasons.

5. **Printing Device Information**: The code prints the retrieved device information using `print()` statements. This information can also be used further in the app as needed.

Overall, this code retrieves various device information using public APIs available in iOS SDKs and prints them for debugging or further processing within the app.
