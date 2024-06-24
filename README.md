# Test technique Hop3team

## Projet
Sur une vue de l'application rails, on retrouvera la liste de la première génération (via l'API) ainsi que la possibilité de sélectionner un ou plusieurs Pokémon.
Cette sélection de Pokémon sera exportable au format CSV (séparateur point virgule).

Le CSV comportera les colonnes suivantes :
- Le pokedex id;
- Le nom en français;
- L’url du sprite « regular »;
- L’url du sprite « shiny »;
- Les types du Pokémon (séparés par une virgule);
- Les pokedex ids des évolutions du Pokémon (séparés par une virgule).

## Ressources
Ruby : 3.1.2
Rails : 7.1.3.3

## Instalation 
Installation 📦 Cloner le dépôt
`git clone git@github.com:Ilkor24/csv-pokemon.git`

git
📥 Se rendre dans le dossier
`cd csv-pokemon`

projetPokemon
🏗️ Setup l'application
`bundle install`
`bundle exec rails db:create`
`rails db:migrate`

🚀 Lancer l'application
`bundle exec rails server`
