
-- to launch this script, use following command:
-- SOURCE C:/Users/imnottheguy/Documents/MyStuff/work/Formation POE/Introduction git/Documents/projets/30 Mai SopraSteria/Formation/5. Langage SQL ou PL SQL - Les fondamentaux 02.06.2022-07.06.2022/TP/TP_3/code/tp_3_answer_questions.sql




SELECT "4. Pour tous les commentaires, montrer le contenu et le username de l'auteur" AS ''; 

SELECT 
commentaires.utilisateurid, utilisateurs.pseudo, commentaires.comments 
FROM commentaires 
JOIN utilisateurs 
ON utilisateurs.id = commentaires.utilisateurid
LIMIT 5;

-- 5. Pour chaque commentaire, afficher son contenu et l'url de la photo
-- à laquel le commentaire a été ajouté

SELECT 
commentaires.comments, photos.image
FROM commentaires 
JOIN photos 
ON photos.id = commentaires.photoid;

-- 6. Afficher l'url de chaque photo et le nom d'utilisateur de l'auteur

SELECT 
photos.id, photos.image, utilisateurs.pseudo
FROM photos 
JOIN utilisateurs 
ON photos.utilisateurid = utilisateurs.id ORDER BY photos.id;

-- 7. Trouver tous les commentaires pour la photo d'id 3, avec le
-- username de l'utilisateur qui a commenté


SELECT photos.id AS 'photo.id', commentaires.id AS 'commentaire.id', utilisateurs.id AS 'utilisateurs.id', utilisateurs.pseudo AS 'Auteur_du_commentaire'
FROM photos
JOIN commentaires
ON photos.id = commentaires.photoid
JOIN 
utilisateurs 
ON utilisateurs.id = commentaires.utilisateurid  WHERE photos.id = 4;




-- VERSION CLAQUÉE:

-- 8. Trouver tous les url des photos ainsi que tous les commentaire qui
-- ont été posté par l'auteur de la photo

-- 9.

SELECT 
utilisateurs.id AS 'utilisateur.id',
utilisateurs.pseudo,
photos.id AS 'photo.id',
commentaires.id AS 'commentaires.id' 
FROM
photos 
JOIN utilisateurs
ON utilisateurs.id = photos.utilisateurid
JOIN commentaires
ON commentaires.utilisateurid = utilisateurs.id
WHERE commentaires.photoid = photos.id;


-- VERSION PROPRE:

-- 8. Trouver tous les url des photos ainsi que tous les commentaires qui ont été posté par l'auteur de la photo

SELECT photos.image, commentaires.comments FROM photos 
JOIN utilisateurs ON utilisateurs.id = photos.utilisateurid
JOIN commentaires ON commentaires.utilisateurid = utilisateurs.id
WHERE commentaires.photoid=photos.id;

-- 9. Idem + nom de l'utilisateur qui a posté et commenté la photo

SELECT utilisateurs.pseudo, photos.image, commentaires.comments FROM photos 
JOIN utilisateurs ON utilisateurs.id = photos.utilisateurid
JOIN commentaires ON commentaires.utilisateurid = utilisateurs.id
WHERE commentaires.photoid=photos.id;

-- 10. Nbre de like pour photo id = 4

SELECT COUNT(*) FROM
photos
JOIN
likes
ON photos.id = likes.photoid
WHERE photos.id = 4;
