plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    // END: FlutterFire Configuration
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

import java.util.Properties
import java.io.FileInputStream

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

android {
    namespace = "portfolio.ai.prediction"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        applicationId = "portfolio.ai.prediction"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        create("release") {
            // key.properties 파일이 있을 때만 로드
            if (keystorePropertiesFile.exists()) {
                keyAlias = keystoreProperties["keyAlias"] as String
                keyPassword = keystoreProperties["keyPassword"] as String
                storeFile = file(keystoreProperties["storeFile"] as String)
                storePassword = keystoreProperties["storePassword"] as String
            }
        }
    }

    buildTypes {
        getByName("release") {
            signingConfig = signingConfigs.getByName("release")

            isMinifyEnabled = true
            isShrinkResources = true
            proguardFiles(getDefaultProguardFile("proguard-android.txt"), "proguard-rules.pro")
        }
    }

    // ✅ [1] Flavor Dimension 정의 (환경 그룹)
    flavorDimensions += "env"

    // ✅ [2] Product Flavors 설정 (Local, Dev, Prod)
    productFlavors {
        // 1. Local 환경(URL 정보만 다름)
        create("local") {
            dimension = "env"
            applicationIdSuffix = ".dev"   // 패키지명: ...prediction.dev
        }

        // 2. Dev 환경
        create("dev") {
            dimension = "env"
            applicationIdSuffix = ".dev"     // 패키지명: ...prediction.dev
        }

        // 3. Prod 환경 (운영)
        create("prod") {
            dimension = "env"
            applicationIdSuffix = ""         // 패키지명: ...prediction (변경 없음)
        }
    }
}

flutter {
    source = "../.."
}

