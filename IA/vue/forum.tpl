<table>
<?php
for ($i = 0; $i < count($article); $i++) {
	echo '<thead>';
		echo '<tr>';
			echo '<th>Titre : ' . $article[$i]['titre'] . ' - ' . $article[$i]['nom'] . '</th>';
			echo '<th>Description : ' . $article[$i]['descr'] .'</th>';
			echo '<th>Like : ' . $article[$i]['like'] .'</th>';
			echo '<a href="index.php?controle=forum&action=liker&param='. $article[$i]['idLieu'] .'"><input type="button" value=" Like : ' . $article[$i]['like'] . '" /></a>';
			echo '<th>Dislike : ' . $article[$i]['dislike'] .'</th>';
			echo '<a href="index.php?controle=forum&action=disliker&param='. $article[$i]['idLieu'] .'"><input type="button" value=" Dislike : ' . $article[$i]['dislike'] . '" /></a>';
			echo '<th>Adresse : ' . $article[$i]['adresse'] .'</th>';
			echo '<th>CP : ' . $article[$i]['CP'] .'</th>';
			echo '<th>Ville : ' . $article[$i]['ville'] .'</th>';
		echo '</tr>';
	echo '</thead>'	;
}
?>
</table>