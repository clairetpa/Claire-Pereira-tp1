<?php
require_once("class/Crud.php");
require_once("class/Livre.php");
$livre = new Livre();
/* la liste des livres */
$data = $livre->select();
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
            <a href="livre-detail.php" class="btn">Ajouter un livre</a>
        </div>
        <h2>liste des livres</h2>
        <div class="grid-list">

        <?php
             foreach($data as $row) {
        ?>
            <div class="livre">
                <div class="livre__image">
                    <img src="images/generic-cover.jpg" alt="couverture livre">
                </div>
                <div class="livre__detail">
                    <div class="livre__title"><?php echo $row["titre"]?></div>
                    <div class="livre__auteur"><?php echo $row["prenomAuteur"]." ".$row["nomAuteur"]?></div>
                    <div class="livre__annee"><?php echo $row["dateParution"]?></div>
                    <div class="livre__editeur"><?php echo $row["nomEditeur"]?></div>
                    <div class="livre__genre"><?php echo $row["genre"]?></div>
                    <div class="livre__editer">
                        <a href="livre-detail.php?id=<?php echo $row["idLivre"]?>" class="btn">Modifier</a>
                    </div>
                </div>
            </div>
        <?php
            }
        ?>
        </div>
    </main>
</body>

</html>