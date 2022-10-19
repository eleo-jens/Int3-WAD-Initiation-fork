<?php
session_start();

include "./connexion/db.php";

try {
    $cnx = new PDO(DBDRIVER . ':host=' . DBHOST . ';port=' . DBPORT . ';dbname=' . DBNAME . ';charset=' . DBCHARSET, DBUSER, DBPASS);
} catch (Exception $e) {
    // jamais en production car ça montre des infos sensibles
    // echo $e->getMessage();
    die();
}

$idFilm = $_POST['id'];
$login = $_SESSION['loginConnecte'];

$sql = "SELECT * FROM utilisateur WHERE login = :login";
$stmt = $cnx->prepare($sql);
$stmt->bindValue(':login', $login);
$stmt->execute();
$result = $stmt->fetchAll(PDO::FETCH_ASSOC);

$id = $result[0]['id'];

$sql = "SELECT * FROM favori 
         INNER JOIN utilisateur
         ON utilisateur.id = favori.idUtilisateur
         WHERE favori.idFilm = :idFilm
         AND utilisateur.login = :login";
$stmt = $cnx->prepare($sql);
$stmt->bindValue(":idFilm", $idFilm);
$stmt->bindValue(":login", $login);
$stmt->execute();

$resultat = $stmt->fetchAll(PDO::FETCH_ASSOC);

if(count($resultat) > 0){
    // on supprime le lien
    $sql = "DELETE FROM favori
    WHERE idFilm = :idFilm
    AND idUtilisateur = :idUtilisateur";

    $stmt = $cnx->prepare($sql);
    $stmt->bindValue("idFilm", $idFilm);
    $stmt->bindValue("idUtilisateur", $id);
    $stmt->execute();

    $reponse = ["statut" => "off"];

    echo json_encode($reponse);
}

else {
    // on rajoute dans les favoris
    $sql = "INSERT INTO favori
    (id, idFilm, idUtilisateur)
    VALUES
    (null, :idFilm, :idUtilisateur)";

    $stmt = $cnx->prepare($sql);
    $stmt->bindValue("idFilm", $idFilm);
    $stmt->bindValue("idUtilisateur", $id);
    $stmt->execute();

    $reponse = ["statut" => "on"];

    echo json_encode($reponse);
}
?>



