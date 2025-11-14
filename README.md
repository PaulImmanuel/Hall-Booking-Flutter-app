# Book My Wedding Hall 

This is a Flutter-based mobile application prototype for a wedding and matrimonial hall booking service. The app provides a complete, high-fidelity user flow from login to booking, built to match a set of design screenshots.

This project was built as a rapid prototype to demonstrate UI/UX and core application flow.

<br>

<!-- ## Screenshots


| Login | Home Page | Hall Details |
| :---: | :---: | :---: |
| <img src="[LINK_TO_LOGIN_SCREENSHOT]" width="250"> | <img src="[LINK_TO_HOME_SCREENSHOT]" width="250"> | <img src="[LINK_TO_DETAILS_SCREENSHOT]" width="250"> |
| **Booking Flow** | **Profile Page** | **Bookings Page** |
| <img src="[LINK_TO_BOOKING_SCREENSHOT]" width="250"> | <img src="[LINK_TO_PROFILE_SCREENSHOT]" width="250"> | <img src="[LINK_TO_BOOKINGS_SCREENSHOT]" width="250"> |

<br> -->

## Features

* **Authentication:** Static login with hardcoded credentials.
    * **Email:** `tamil@gmail.com`
    * **Password:** `123456`
* **Bottom Navigation:** A 4-tab main screen for:
    * **Home:** Browse all wedding halls from a dummy data source.
    * **Bookmarks:** A static page showing saved halls.
    * **Bookings:** A static page showing upcoming and completed bookings.
    * **Profile:** A page with user info, a wallet card, menu options, and a "Sign Out" button.
* **Hall Details:** A detailed screen for each hall, showing its image, description, and list of facilities.
* **Complete Booking Flow:** A multi-step booking screen that includes:
    * Payment option selection (Advance/Full)
    * Service selection (Catering, DJ, etc.)
    * A functional Date Picker (Calendar)
    * Time slot selection.
* **Custom Theme:** A professional app-wide theme using a premium blue (`kPrimaryColor`) and custom fonts (`google_fonts`).

<br>

## Technical Specifications

* **Framework:** Flutter
* **Language:** Dart
* **Key Packages:**
    * `google_fonts`: For custom app-wide fonts.
    * `intl`: For date formatting.

<br>

## How to Run

1.  Clone this repository:
    ```bash
    git clone [[https://github.com/PaulImmanuel/Hall-Booking-Flutter-app.git]]([https://github.com/PaulImmanuel/Hall-Booking-Flutter-app.git])
    ```
2.  Navigate to the project directory:
    ```bash
    cd Hall-Booking-Flutter-app
    ```
3.  Install the dependencies:
    ```bash
    flutter pub get
    ```
4.  Run the app:
    ```bash
    flutter run
    ```

<br>

## 📦 APK Release

You can find the latest installable `.apk` file for Android in the [**Releases**]((https://github.com/PaulImmanuel/Hall-Booking-Flutter-app/releases/tag/v1.0.0) section of this repository.
