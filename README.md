# Flash-Chat :e-mail: 


#### Uno de los componentes m谩s fundamentales de las aplicaciones iOS modernas es `table view` y se utilizan en todas partes, desde la aplicaci贸n Correo hasta la aplicaci贸n Mensajes. En este proyecto, nos familiarizaremos con `table view`, crearemos celdas personalizadas y crearemos nuestra propia base de datos de back-end basada en la nube. 



------------



##proyecto 馃搵

###### Flash Chat es una aplicaci贸n de mensajer铆a basada en Internet similar a WhatsApp, la popular aplicaci贸n de mensajer铆a que fue comprada por Facebook por $ 22 mil millones. Usaremos un servicio llamado Firebase Firestore como base de datos de back-end para almacenar y recuperar nuestros mensajes de la nube.


------------



### Patr贸n de dise帽o 鈿欙笍
##### Model View Controller (MVC).

#### Model 馃摌

###### Esta estructura "Message" nos permite darle las propiedades que un mensaje deber铆a tener, sera el modelo para crear mensajes.
```swift

struct Message {
    let sender: String
    let body: String
}

```

#### View 馃捇
- C贸mo crear Segues directos para la navegaci贸n.
- Obtener informaci贸n sobre el ciclo de vida de la aplicaci贸n y c贸mo usar `viewWillAppear` o `viewWillDisappear`.
- C贸mo crear vistas personalizadas usando archivos .xib para modificar componentes de dise帽o nativos.
```swift
  //registro de tableView XIB
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
        loadMessages()
    }
```

#### Controller 鈱笍
- C贸mo incrustar controladores de vista en un controlador de navegaci贸n y comprender la pila de navegaci贸n.
- C贸mo crear un archivo de constantes y usar propiedades est谩ticas para almacenar cadenas y otras constantes.
- Aprenda sobre los bucles de Swift y cree animaciones usando bucles.
- C贸mo trabajar con UITableViews y c贸mo configurar sus fuentes de datos y delegados.

```swift
 // tableView.delegate = self
        tableView.dataSource = self
        title = K.appTitle
        navigationItem.hidesBackButton = true
```





## Pods utilizados 馃洜锔?
##### aprendimos 
1. C贸mo integrar bibliotecas de terceros en la aplicaci贸n utilizando Cocoapods y Swift Package Manager.
[![Cocoapods & SPM](https://miro.medium.com/max/970/1*inPWoPOH82PnlrpI5A_DJw.png "Cocoapods & SPM")](https://www.google.com/url?sa=i&url=https%3A%2F%2Fblog.devgenius.io%2Fios-library-support-both-cocoapods-and-swift-package-manager-983c81b35080&psig=AOvVaw3Tj0W9Z1RIYu6hiEQkpbyZ&ust=1677935635579000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCIDk3L3rv_0CFQAAAAAdAAAAABAE "Cocoapods & SPM")

2. C贸mo almacenar datos en la nube usando Firebase Firestore.
3. C贸mo consultar y ordenar la base de datos de Firebase.
4. C贸mo usar Firebase para la autenticaci贸n, el registro y el inicio de sesi贸n de los usuarios.

#### Para la instalaci贸n de los pods se utilizo CocoaPods.
- [CLTypingLabel ](https://cocoapods.org/pods/CLTypingLabel "CLTypingLabel ")
- [Firebase Firestore ](https://cocoapods.org/pods/FirebaseAuth "Firebase Firestore ")
- [FirebaseAuth](https://cocoapods.org/pods/FirebaseFirestore "FirebaseAuth")
- [IQKeyboardManagerSwift](https://cocoapods.org/pods/IQKeyboardManagerSwift "IQKeyboardManagerSwift")
