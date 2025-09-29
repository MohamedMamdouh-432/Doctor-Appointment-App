plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    // END: FlutterFire Configuration
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.testing_app"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.testing_app"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
        // debug {
        //     signingConfig = signingConfigs.getByName("release")
        // }
    }
    
    flavorDimensions += "default"
    productFlavors {
        create("production") {
            dimension = "default"
            resValue(
                type="string", 
                name="app_name", 
                value="DocDoc Production"
            )
        }
        create("development") {
            dimension = "default"
            applicationIdSuffix = ".dev"
            resValue(
                type="string", 
                name="app_name", 
                value="DocDoc Development"
            )
        }
    }
}

flutter {
    source = "../.."
}
