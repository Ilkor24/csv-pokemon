Sur une vue de l'application rails, le but était de permettre de sélectionner un ou plusieurs Pokémon de la première génération. 
Ensuite, il fallait qu'une sélection d'information soit exportable au format "CSV". 

Étape 1 : 
Je n'avais pas envie de passer par un rails db:seed pour avoir des Pokémons dans la db et donc affichable sur l'index. 
Dans le controller de Pokémon, une méthod permet d'aller chercher les Pokémons de la première génération et de les mettre, automatiquement, dans la db.
Il me fallait également l'id pokedex des évolutions des Pokémons. Cependant, l'une des contraintes était de se limiter au Pokémon de la première génération. Pour cela, j'ai rajouté une condition afin de ne pas prendre les pokedex id excédant 151.
De plus, un background-job (gem sidekiq) permet d'effacer la base de donnée tous les jours à 12:06 UTC+2. Si nous imaginons un changement dans la db, l'application en tiendra compte le lendemain à l'heure du reset. 

Étape 2 :
Une fois les Pokémons dans la db, il faut être capable de pouvoir les sélectionner: j'ai pris des checkboxs. On récupère ensuite les informations sur les Pokémon sélectionnés grâce à leurs "pokemon_id"(le numéro dans le pokédex). Vous pouvez sélectionner un ou plusieurs Pokémons grâce au controller stimulus  "catch" permettant de garder les checkboxs dans l'état "checked === true", même si on change de page. Une fois que vous avez exporté les Pokémons sélectionnés, toutes les box retrouvent l'état "checked === false".  

Étape 3 :
Une fois l'application fonctionnelle, j'ai utilisé du javascript pour la rendre plus ergonomique. Notamment, la barre de recherche, dynamique et totalement opérationnelle. Le controller stimulus js permet le "dynamisme" de la barre en "appuyant" sur le bouton search à chaque fois que l'user presse une touche. Une petite fonction permet également que le curseur de saisie se place correctement. 

Même si le but n'était pas le front j'ai tenté de rendre l'application la plus agréable possible. D'autres petites features sont disponibles.

Enfin, l'application fonctionne avec docker. Cependant, j'ai dû faire un changement dans le dockerfile initial de rails : https://stackoverflow.com/questions/77725755/segmentation-fault-during-rails-assetsprecompile-on-apple-silicon-m3-with-rub


ATTENTION DB => postgresql
