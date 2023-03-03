# Flash-Chat :e-mail: 


#### Uno de los componentes más fundamentales de las aplicaciones iOS modernas es `table view` y se utilizan en todas partes, desde la aplicación Correo hasta la aplicación Mensajes. En este tutorial, nos familiarizaremos con `table view`, crearemos celdas personalizadas y crearemos nuestra propia base de datos de back-end basada en la nube. 



------------



##proyecto 📋

###### Flash Chat es una aplicación de mensajería basada en Internet similar a WhatsApp, la popular aplicación de mensajería que fue comprada por Facebook por $ 22 mil millones. Usaremos un servicio llamado Firebase Firestore como base de datos de back-end para almacenar y recuperar nuestros mensajes de la nube.


------------



### Patrón de diseño ⚙️
##### Model View Controller (MVC).

#### Model 📘

###### Esta estructura "Message" nos permite darle las propiedades que un mensaje debería tener, sera el modelo para crear mensajes.
```swift

struct Message {
    let sender: String
    let body: String
}

```

#### View 💻
- Cómo crear Segues directos para la navegación.
- Obtenga información sobre el ciclo de vida de la aplicación y cómo usar viewWillAppear o viewWillDisappear.
- Cómo crear vistas personalizadas usando archivos .xib para modificar componentes de diseño nativos.
```swift
  //registro de tableView XIB
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
        loadMessages()
    }
```

#### Controller ⌨️
- Cómo incrustar controladores de vista en un controlador de navegación y comprender la pila de navegación.
- Cómo crear un archivo de constantes y usar propiedades estáticas para almacenar cadenas y otras constantes.
- Aprenda sobre los bucles de Swift y cree animaciones usando bucles.
- Cómo trabajar con UITableViews y cómo configurar sus fuentes de datos y delegados.

```swift
 // tableView.delegate = self
        tableView.dataSource = self
        title = K.appTitle
        navigationItem.hidesBackButton = true
```





## Pods utilizados 🛠️
##### aprendimos 
1. Cómo integrar bibliotecas de terceros en la aplicación utilizando Cocoapods y Swift Package Manager.
[![Cocoapods & SPM](https://miro.medium.com/max/970/1*inPWoPOH82PnlrpI5A_DJw.png "Cocoapods & SPM")](https://www.google.com/url?sa=i&url=https%3A%2F%2Fblog.devgenius.io%2Fios-library-support-both-cocoapods-and-swift-package-manager-983c81b35080&psig=AOvVaw3Tj0W9Z1RIYu6hiEQkpbyZ&ust=1677935635579000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCIDk3L3rv_0CFQAAAAAdAAAAABAE "Cocoapods & SPM")


2. Cómo almacenar datos en la nube usando Firebase Firestore.
3. Cómo consultar y ordenar la base de datos de Firebase.
4. Cómo usar Firebase para la autenticación, el registro y el inicio de sesión de los usuarios.

#### Para la instalación de los pods se utilizo CocoaPods.
- [CLTypingLabel ](https://cocoapods.org/pods/CLTypingLabel "CLTypingLabel ")
- [Firebase Firestore ](https://cocoapods.org/pods/FirebaseAuth "Firebase Firestore ")
- [FirebaseAuth](https://cocoapods.org/pods/FirebaseFirestore "FirebaseAuth")
- [IQKeyboardManagerSwift](https://cocoapods.org/pods/IQKeyboardManagerSwift "IQKeyboardManagerSwift")
