## ArticlesApp

Cette application web a été développée en utilisant Ruby on Rails et Bootstrap dans le cadre d'un projet d'examen. L'objectif était de suivre les instructions ci-dessous et de réaliser l'application dans un délai de 8 heures.

## Base de données

Effectuez les modifications du code nécessaires à l'obtention du schema de données suivant :

<img src="https://raw.githubusercontent.com/lewagon/fullstack-images/master/assess/share_post_db_schema.png" alt="DB schema">

Un utilisateur n'est pas valide :

- S'il n'a pas de pseudonyme.
- Si son pseudonyme dépasse 50 caractères. 

Une publication n'est pas valide :

- Si elle n'a pas de titre.
- Si elle n'a pas de contenu.
- Si elle n'a pas de URL.

Un commentaire n'est pas valide :
- S'il n'a pas de contenu.

La suppression d'un utilisateur doit entraîner la suppression de ses publications et de ses commentaires. La suppression d'une publication doit entraîner la suppression de ses commentaires.


## Interface utilisateur

Effectuez les modifications du code nécessaires à l'implémentation des parcours utilisateurs suivants :

- En tant qu'utilisateur, je peux accéder à la page d'accueil.
- En tant qu'utilisateur, je peux voir la liste de toutes les publications.
- En tant qu'utilisateur, je peux accéder aux détails de chaque publication et la liste des commentaires associés.
- En tant qu'utilisateur, je peux commenter une publication.

## Spécifications

- Respectez les conventions de `rails`.
- La page d'accueil doit contenir un lien permettant d'accéder à la liste des publications.
- La page listant les publications doit contenir les liens permettant d'accéder aux détails de chaque publication.
- La page affichant les détails d'une publication doit contenir un lien permettant de retourner sur la page listant toutes les publications.
- La page affichant les détails d'une publication doit contenir le formulaire permettant de faire un commentaire.
- La page affichant les détails d'une publication doit afficher la liste des commentaires associés.
- Lorsque l'utilisateur crée un compte, il doit renseigner son pseudonyme dans le formulaire. 
- Le formulaire de commentaire doit comporter un champ de texte multiligne pour faciliter la saisie de long commentaire. 
- Lors de la soumission d'un commentaire, l'utilisateur doit être redirigé vers la page de détails de la publication et une <a href="https://www.rubyguides.com/2019/11/rails-flash-messages/" target="_blank">notification flash</a> doit s'afficher pour confirmer la sauvegarde du commentaire.


