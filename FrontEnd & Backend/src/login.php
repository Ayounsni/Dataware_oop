<?php

class Authentification {
    private $connexion;
    private $erreur; // Ajout de la propriété $erreur

    public function __construct(Connexion $connexion) {
        $this->connexion = $connexion;
        $this->erreur = ""; // Initialisez la propriété $erreur ici si nécessaire
    }

    // ... (autres méthodes)

    public function authentifierUtilisateur($email, $pass) {
        $connexion = $this->connexion->getConnection(); 
        
        
        // Utilisez des déclarations préparées pour éviter les injections SQL
        $stmt = $connexion->prepare("SELECT * FROM users WHERE email = :email AND password = :pass");
        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':pass', $pass);
        $stmt->execute();
        

        $row = $stmt->rowCount();
        // var_dump($row);
        // exit();
        $fetch = $stmt->fetch(PDO::FETCH_ASSOC);
        

        if ($row == 1) {
            $username = $fetch['Last_name'];
            $membre = $fetch['id_user'];
            $rol = $fetch['role'];
            $_SESSION['username'] = $username;
            $_SESSION['id'] = $membre;
            $_SESSION['role'] = $rol;
            $_SESSION['autoriser'] = "oui";
          
                header("Location: validation.php");
            
           
        } else {
            $this->erreur = "L’adresse e-mail ou le mot de passe que vous avez saisi(e) n’est pas associé(e) à un compte. ";
        }
    }

    private function redirigerEnFonctionDuRole($role) {
        if ($role == "user") {
            header("Location: DashboardUser.php");
        } elseif ($role == "scrum_master") {
            header("Location: DashboardScrum.php");
        } else {
            header("Location: DashboardM.php");
        }
        exit();
    }

    // Ajout de la méthode pour récupérer la propriété $erreur
    public function getErreur() {
        return $this->erreur;
    }
}

?>