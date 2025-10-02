plugins {
    id("com.android.application")
    id("com.google.gms.google-services")
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
        minSdk = 23
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
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
            // applicationIdSuffix = ".dev"
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
