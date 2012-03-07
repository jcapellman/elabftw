<?php
/********************************************************************************
*                                                                               *
*   Copyright 2012 Nicolas CARPi (nicolas.carpi@gmail.com)                      *
*   http://www.elabftw.net/                                                     *
*                                                                               *
********************************************************************************/

/********************************************************************************
*  This file is part of eLabFTW.                                                *
*                                                                               *
*    eLabFTW is free software: you can redistribute it and/or modify            *
*    it under the terms of the GNU Affero General Public License as             *
*    published by the Free Software Foundation, either version 3 of             *
*    the License, or (at your option) any later version.                        *
*                                                                               *
*    eLabFTW is distributed in the hope that it will be useful,                 *
*    but WITHOUT ANY WARRANTY; without even the implied                         *
*    warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR                    *
*    PURPOSE.  See the GNU Affero General Public License for more details.      *
*                                                                               *
*    You should have received a copy of the GNU Affero General Public           *
*    License along with eLabFTW.  If not, see <http://www.gnu.org/licenses/>.   *
*                                                                               *
********************************************************************************/
/* addtag.php - for adding tags */
require_once('inc/common.php');

// Check expid is valid and assign it to $expid
if (filter_var($_POST['item_id'], FILTER_VALIDATE_INT)) {
    $item_id = $_POST['item_id'];
} else {
    die("The experiment id parameter in the URL isn't a valid experiment ID");
}
// Sanitize tag
$tag = filter_var($_POST['tag'], FILTER_SANITIZE_STRING);

// Tag for experiment or protocol ?
if ($_POST['type'] == 'exp' ){

// Check expid is owned by connected user
$sql = "SELECT userid FROM experiments WHERE id = ".$item_id;
$req = $bdd->prepare($sql);
$req->execute();
$data = $req->fetch();
if ($data['userid'] == $_SESSION['userid']) {
    // SQL for addtag
    $sql = "INSERT INTO experiments_tags (tag, item_id, userid) VALUES(:tag, :item_id, :userid)";
    $req = $bdd->prepare($sql);
    $result = $req->execute(array(
        'tag' => $tag,
        'item_id' => $item_id,
        'userid' => $_SESSION['userid']
    ));
    if ($result) {
        header("location: experiments.php?mode=edit&id=$item_id&tagadded=1");
    } else {
        die('Something went wrong in the database query. Check the flux capacitor.');
    }
}
}elseif ($_POST['type'] == 'prot'){
    // SQL for add tag to protocol
    $sql = "INSERT INTO protocols_tags (tag, item_id) VALUES(:tag, :item_id)";
    $req = $bdd->prepare($sql);
    $result = $req->execute(array(
        'tag' => $tag,
        'item_id' => $item_id));
    if ($result) {
        header("location: protocols.php?mode=edit&id=$item_id&tagadded=1");
    } else {
        die('Something went wrong in the database query. Check the flux capacitor.');
    }
}else{
    die('taggle');
}