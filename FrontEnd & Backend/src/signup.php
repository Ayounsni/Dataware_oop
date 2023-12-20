<?php

class Personne {
    
    protected $nom;
    protected $prenom;
    protected $email ;
    protected $mot_de_passe;
    

    public function __construct($nom,$prenom,$email, $mot_de_passe){
        $this->$nom = $nom;
        $this->$prenom = $prenom;
        $this->$email = $email;
        $this->$mot_de_passe = $mot_de_passe;
    }

  
}



?>