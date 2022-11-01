import robot
import Devices

logFile = open('mylog.txt', 'w')

iOS_deviceName = ["SMAPI", "iPhone 13"]
android_deviceName = ["emulator-5554", "emulator-5556"]

for name in android_deviceName:
    android_DN  = name
    robot.run("tests/android/android_SampleWebSession.test.robot",stdout=logFile)

# for name in iOS_deviceName:
#     iOS_DN  = name
#     robot.run("tests/iOS/ios_SampleTemplete.test.robot",stdout=logFile)