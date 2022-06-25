<?php
require_once("class/Crud.php");
require_once("class/Livre.php");
require_once("class/Genre.php");
require_once("class/Auteur.php");
require_once("class/Editeur.php");

$livre = new Livre();
$genre = new Genre();
$auteur = new Auteur();
$editeur = new Editeur();

/* les genres de livres */
$genreData = $genre->select();

/* Dans le cas de modifier on recupere l'id dans l'url */
if(isset($_GET["id"])){
    $id = $_GET["id"];
    $livreData = $livre->selectId("idLivre", $id);
}

/* on recupere l'action dans l'url */
if(isset($_GET["action"])){

    $action = $_GET["action"];

    /* supprimer un livre avec son id */
    if($action == "supprimer"){
        $idSupprimer = $_GET["id"];
        $livre->delete($idSupprimer);
    } else {

        $titre = $_POST["titre"];
        $date = $_POST["date"];
        $genre = $_POST["genre"];
        $resume = $_POST["resume"];
        $prenomAuteur = $_POST["prenomAuteur"];
        $nomAuteur = $_POST["nomAuteur"];
        $nomEditeur = $_POST["nomEditeur"];

        /* creer un livre avec son auteur son editeur */
        if($action == "creer"){
            /* Pour auteur */
            $auteurArray = array("prenomAuteur" => $prenomAuteur, "nomAuteur" => $nomAuteur);
            $auteurId = $auteur->insert($auteurArray);

            /* Pour Editeur */
            $editeurArray = array("nomEditeur" => $nomEditeur);
            $editeurId = $editeur->insert($editeurArray);

            /* Pour Livre */
            $LivreArray = array("titre" => $titre, "dateParution" => $date, "idGenre" => $genre, 
                                "resume" =>$resume, "idAuteur" =>$auteurId, "idEditeur" =>$editeurId);
            $livre->insert($LivreArray);
        }

        /* modifier un livre, son auteur et son editeur */
        if($action == "sauvegarder"){
            $idLivre = $_POST["idLivre"];
            $idAuteur = $_POST["idAuteur"];
            $idEditeur = $_POST["idEditeur"];

            /* Pour auteur */
            $auteurArray = array("idAuteur" => $idAuteur, "prenomAuteur" => $prenomAuteur, "nomAuteur" => $nomAuteur);
            $auteur->update($auteurArray,"idAuteur", $idAuteur);

            /* Pour Editeur */
            $editeurArray = array("idEditeur" => $idEditeur, "nomEditeur" => $nomEditeur);
            $editeur->update($editeurArray, "idEditeur", $idEditeur);

            /* Pour Livre */
            $LivreArray = array("idLivre" => $idLivre, "titre" => $titre, "dateParution" => $date, "idGenre" => $genre, 
                                "resume" =>$resume, "idAuteur" =>$idAuteur, "idEditeur" =>$idEditeur);
            $livre->update($LivreArray, "idLivre", $idLivre);

        }
    }
    
    /* redirection vers la liste des livres */
    header("Location: livre-list.php");
    exit;
}
?>



<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tp1 Claire Pereira Tortajada 2194800| Librairie </title>

    <!-- le lien vers le css -->
    <link rel="stylesheet" type="text/css" href="styles/styles.css">
</head>

<body>
    <header>
        <h1 class="hero-title">My favorites books</h1>
    </header>
    <main>
        <div class="livre__editer">
            <a href="livre-list.php" class="btn">Retour a la liste</a>
        </div>

        <!-- Si il y a l'id on fera une modification sinon cèst une creation -->
        <?php if(isset($id)){?>
            <h2>Modifier</h2>
            <form method="POST" action="livre-detail.php?action=sauvegarder">
        <?php } else {?>
            <h2>Créer</h2>
            <form method="POST" action="livre-detail.php?action=creer">
        <?php }?>
        
            <!-- les inputs cachés pour les ids -->
            <input type="hidden" name="idLivre" value="<?php if(isset($livreData)) {echo $livreData["idLivre"];}?>" >
            <input type="hidden" name="idAuteur" value="<?php if(isset($livreData)) {echo $livreData["idAuteur"];}?>" >
            <input type="hidden" name="idEditeur" value="<?php if(isset($livreData)) {echo $livreData["idEditeur"];}?>" >
            <div class="grid-detail">  
                <div>
                    <h3>Livre</h3>
                    <div class="form">
                        <div class="form__item">
                            <div class="label">Titre:</div>
                            <div class="input"><input type="text" name="titre" value="<?php if(isset($livreData)) {echo $livreData["titre"];}?>" required></div>
                        </div>
                        <div class="form__item">
                            <div class="label">Date:</div>
                            <div class="input"><input type="text" name="date" placeholder="ex: 2022-05-21" value="<?php if(isset($livreData)) {echo $livreData["dateParution"];}?>" required></div>
                        </div>
                        <div class="form__item">
                            <div class="label">Genre:</div>
                            <div class="input">
                                <select name="genre">
                                    <?php foreach($genreData as $genre){?>
                                        <option value="<?php echo $genre["idGenre"]?>"><?php echo $genre["genre"]?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                        <div class="form__item">
                            <div class="label">Résumé:</div>
                            <div class="input">
                                <textarea name="resume" rows="12" cols="36"  required><?php if(isset($livreData)) {echo $livreData["resume"];}?></textarea>
                            </div>
                        </div>
                    </div>
                </div>


                <div>
                    <h3>Auteur</h3>
                    <div class="form">
                        <div class="form__item">
                            <div class="label">Prénom:</div>
                            <div class="input"><input type="text" name="prenomAuteur" value="<?php if(isset($livreData)) {echo $livreData["prenomAuteur"];}?>" required></div>
                        </div>
                        <div class="form__item">
                            <div class="label">Nom:</div>
                            <div class="input"><input type="text" name="nomAuteur" value="<?php if(isset($livreData)) {echo $livreData["nomAuteur"];}?>" required></div>
                        </div>
                    </div>

                    <div class="spacing"></div>

                    <h3>Editeur</h3>
                    <div class="form">
                        <div class="form__item">
                            <div class="label">Nom:</div>
                            <div class="input"><input type="text" name="nomEditeur" value="<?php if(isset($livreData)) {echo $livreData["nomEditeur"];}?>" required></div>
                        </div>
                    </div>

                    <div class="spacing"></div>

                    <div class="submit-container">
                        <!-- si on a l'id on affiche le bouton supprimer -->
                        <?php if(isset($id)){?>
                            <a href="livre-detail.php?action=supprimer&id=<?php echo $id?>" class="supprimer">Supprimer</a>
                        <?php } ?>
                        <input class="submit" type="submit" value="<?php if(isset($id)){echo "Sauvegarder"; }else{echo "Créer";}?>">
                    </div>
                </div>
            
            </div>
        </form>
    </main>
</body>

</html>