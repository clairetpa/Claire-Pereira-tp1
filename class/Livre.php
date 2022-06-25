<?php
class Livre extends Crud {
    protected $table = 'Livre';
    protected $primaryKey = 'idLivre'; 

    /* Avec Jointure */
    public function select($champOrdre = null, $ordre = null){
        $sql= "SELECT * FROM $this->table 
               JOIN Auteur ON Auteur.idAuteur = $this->table.idAuteur 
               JOIN Editeur ON Editeur.idEditeur = $this->table.idEditeur
               JOIN Genre ON Genre.idGenre = $this->table.idGenre";
        $query = $this->query($sql);
        return $query->fetchAll();
    }

    /* Avec Jointure */
    public function selectId($champ, $id){
        $sql = "SELECT * FROM $this->table 
                JOIN Auteur ON Auteur.idAuteur = $this->table.idAuteur 
                JOIN Editeur ON Editeur.idEditeur = $this->table.idEditeur 
                JOIN Genre ON Genre.idGenre = $this->table.idGenre 
                WHERE $this->table.$champ = :$champ";
        $query = $this->prepare($sql);
        $query->bindValue(":$champ", $id);
        $query->execute();
        return $query->fetch();
    }
}

?>