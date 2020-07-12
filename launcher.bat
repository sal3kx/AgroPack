:: Script pour automatiser le lancement de l'application AgroPack sur windows
:: Auteurs : Saliou Lo, Lionel Barra, Alassane Ndoye, Saliou Toure
:: commande pour lancer l'application en y ajoutant les modules javafx requis
java --module-path .\javafx-sdk-11.0.2\lib --add-modules javafx.controls,javafx.fxml -jar .\AgroPack.jar