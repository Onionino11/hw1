<?php
// add_to_cart.php
// Aggiunge un prodotto al carrello dell'utente loggato

session_start();

// Connessione al database
$conn = mysqli_connect('localhost', 'root', '', 'malu');
if (!$conn) {
    die('Connessione al database fallita');
}

// Recupera dati dal GET (o POST, se preferisci)
$id = isset($_GET['id']) ? intval($_GET['id']) : 0;
$nome = isset($_GET['nome']) ? mysqli_real_escape_string($conn, $_GET['nome']) : '';
$descrizione = isset($_GET['descrizione']) ? mysqli_real_escape_string($conn, $_GET['descrizione']) : '';
$prezzo = isset($_GET['prezzo']) ? floatval($_GET['prezzo']) : 0.0;

// Recupera l'id utente dalla sessione/cookie
if (isset($_COOKIE['loggato'])) {
    $user_id = intval($_COOKIE['loggato']);
} else {
    // Non loggato
    header('Location: ../php/login_cookie.php');
    exit;
}

// Trova o crea il carrello per l'utente
$carrello_id = 0;
$res = mysqli_query($conn, "SELECT id FROM carrelli WHERE user_id = $user_id");
if ($row = mysqli_fetch_assoc($res)) {
    $carrello_id = $row['id'];
} else {
    mysqli_query($conn, "INSERT INTO carrelli (user_id, totale) VALUES ($user_id, 0.00)");
    $carrello_id = mysqli_insert_id($conn);
}

// Controlla se il prodotto è già nel carrello
$res = mysqli_query($conn, "SELECT id, quantita FROM carrello_prodotti WHERE carrello_id = $carrello_id AND prodotto_id = $id");
if ($row = mysqli_fetch_assoc($res)) {
    $quantita = $row['quantita'] + 1;
    mysqli_query($conn, "UPDATE carrello_prodotti SET quantita = $quantita WHERE id = " . $row['id']);
} else {
    mysqli_query($conn, "INSERT INTO carrello_prodotti (carrello_id, prodotto_id, nome, descrizione, prezzo, quantita) VALUES ($carrello_id, $id, '$nome', '$descrizione', $prezzo, 1)");
}

// Aggiorna il totale del carrello
$res = mysqli_query($conn, "SELECT SUM(prezzo * quantita) as totale FROM carrello_prodotti WHERE carrello_id = $carrello_id");
if ($row = mysqli_fetch_assoc($res)) {
    $totale = $row['totale'] ? $row['totale'] : 0.00;
    mysqli_query($conn, "UPDATE carrelli SET totale = $totale WHERE id = $carrello_id");
}

mysqli_close($conn);

// Redirect alla pagina del carrello o dove preferisci
header('Location: index.php');
exit;
?>
