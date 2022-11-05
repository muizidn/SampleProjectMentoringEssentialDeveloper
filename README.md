# SampleProjectMentoringEssentialDeveloper

This project contains sample for these issues:


1. Tight coupling with Objective-C interop. It means the interop work two ways because new feature will be implemented in Swift and the programmer will add interop if it is used in Objective-C. Whole project.

2. Webview everywhere. Need to refactor to native or crossplatform solution. StoreViewController & NotificationViewController

3. MVVM approach that access array element directly from backing store, causes nil checking everywhere. SecondViewController

4. Tight third party integration. ProfileViewController

We aim to modularize it with team of 4.