# FRC Crescendo Scout Mobile App

## Project Overview

Crescendo Scout is a mobile application designed to empower FIRST Robotics Competition (FRC) Team 9450 (Velocity Raptors) during the Crescendo Season (2024). It streamlines scouting data collection by allowing users to input team data directly on their mobile devices, addressing the challenge of efficient data management in resource-constrained competition environments.

## Features

* **Offline Scouting:** Users can input comprehensive scouting data for various teams directly on their mobile devices, eliminating dependence on internet connectivity at competition venues.

* **Local Data Storage:** The app securely stores all collected scouting data locally on the device, ensuring data privacy and accessibility even in offline scenarios.

* **QR Code Generation:** Each team's collected data is transformed into a unique QR code, facilitating seamless and secure wireless data transfer to a centralized receiver.

## Key Benefits

* **Enhanced Collaboration:** Multiple team members can collect scouting data simultaneously on their devices, fostering efficient and distributed data collection efforts.

* **Offline Accessibility:** Scouting data remains fully accessible and manageable even without an internet connection, crucial for competition environments with limited or unreliable connectivity.

* **Increased Efficiency:** The app streamlines the data collection process, allowing teams to focus on observing robot performance and strategy rather than manual recording.

## Technologies Used

* **Dart:** Primary programming language for the mobile application.

* **Flutter:** Framework used for building the cross-platform mobile user interface.

* **QR Code Libraries:** `qr_flutter` (for QR code generation).

* **Data Persistence:** `shared_preferences` (for local data storage).

* **UI Components:** `dropdown_search` (for enhanced dropdown functionalities).

## My Contributions

* Designed and implemented the mobile application's intuitive user interface and core data entry functionalities.

* Developed the logic for secure offline data collection and local data storage management.

* Integrated robust QR code generation capabilities to enable efficient data transfer.

## Associated Team

* **FRC Team 9450 (Velocity Raptors)**

---

## Related Project: Crescendo Receiver

This mobile application is part of a larger scouting system. The collected data is transferred via QR codes to a companion **Crescendo Receiver** application, which compiles, stores, and displays the scouting data in a centralized table for comprehensive analysis.

You can find the repository for the Crescendo Receiver here:
<https://github.com/kridos/ScoutingReceiver2024>
