<html>
    <head>
        <meta charset="utf-8" />
        <title>Authentification</title>
        <link href="vue/StyleCSS/insc.css" rel="stylesheet">
    </head>
    <body>
		<form method="post" action="index.php?controle=utilisateur&action=inscRef">
			<div class="form_groupe">
				<input name="fname" type="text" required>
				<span class="bare"></span>
				<label>Mot de passe</label>
			</div>
			<div class="form_groupe">
				<input name="lname" type="text" required>
				<span class="bare"></span>
				<label>Mot de passe</label>
			</div>
			<div class="form_groupe">
				<input name="mdp" type="password" required>
				<span class="bare"></span>
				<label>Mot de passe</label>
			</div>
			<div class="form_groupe">
				<input name="mdpsure" type="password" required>
				<span class="bare"></span>
				<label>Confirmation mot de passe</label>
			</div>
			<div class="form_groupe">      
				<input name="email" type="text" required>
				<span class="bare"></span>
				<label>Adresse mail</label>
			</div>
			<input type="submit" value="S'inscrire"/>
		</form>	
    </body>
</html>