# TP5 Supdeco - Application Web JSP/Servlet (MVC)

Ce projet est une application web Java développée dans le cadre du TP5 du cursus Supdeco. Il implémente une architecture de type Modèle-Vue-Contrôleur (MVC) pour gérer les cours.

##  Technologies utilisées
*   **Langage :** Java 
*   **Gestion de projet :** Maven
*   **Serveur d'application :** Apache Tomcat 10.1.57
*   **Technologies Web :** JSP, Servlets (Jakarta EE)

##  Installation et Configuration

### 1. Prérequis
*   JDK 25
*   Apache Tomcat 10.1.57 installé et configuré.
*   Maven installé.

### 2. Exécution du projet
1.  Ouvrez le projet dans votre IDE (IntelliJ IDEA recommandé).
2.  Ouvrez le fichier `pom.xml` et rechargez les dépendances Maven.
3.  Dans IntelliJ, ajoutez une configuration de serveur **Tomcat Local**.
    *   **URL de déploiement :** `/TP5_Supdeco_war_exploded`.
    *   **Port HTTP :** **8081** *(Le serveur Tomcat est configuré pour écouter sur ce port spécifique)*.
4.  Lancez le serveur.
5.  Ouvrez votre navigateur et accédez à l'adresse : [http://localhost:8081/cours](http://localhost:8081/cours/)

##  Structure du projet
*   `src/main/java/sn/supdeco/controller/` : Les Servlets (Contrôleurs).
*   `src/main/java/sn/supdeco/service/` : La logique métier.
*   `src/main/java/sn/supdeco/model/` : Les classes entités (ex: `Cours`).
*   `src/main/webapp/WEB-INF/vues/` : Les fichiers JSP (Vues : `index.jsp`, `form_cours.jsp`, etc.).
*   `pom.xml` : Gestion des dépendances du projet.

##  Auteur
*   **Madina Aidara**
*   **Promotion :** 2025/2026 / Supdeco