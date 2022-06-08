DROP DATABASE IF EXISTS tp3;


CREATE DATABASE tp3;

USE tp3;


create table utilisateurs(
    id integer not null auto_increment primary key,
    nom varchar(50) not null,
    prenom varchar(50) not null,
    pseudo varchar(50) not null unique,
    email varchar(50) not null unique,
    avatar varchar(200) not null
);

create table photos (
    id integer not null auto_increment primary key,
    image varchar(200) not null,
    description varchar(200),
    localisation varchar(50),
    date_creation DATE DEFAULT CURRENT_DATE,
    utilisateurid int not null,
    foreign key (utilisateurid) references utilisateurs(id) on delete CASCADE on update CASCADE 
);


create table commentaires (
    id integer not null auto_increment primary key,
    comments varchar(200) not null,
    date_creation DATE DEFAULT CURRENT_DATE,
    utilisateurid int not null,
    photoid int not null,
    foreign key (utilisateurid) references utilisateurs(id) on delete CASCADE on update CASCADE,
    foreign key (photoid) references photos(id) on delete CASCADE on update CASCADE
);

create table likes (
    id integer not null auto_increment primary key,
    utilisateurid int not null,
    photoid int not null,
    foreign key (utilisateurid) references utilisateurs(id) on delete CASCADE on update CASCADE,
    foreign key (photoid) references photos(id) on delete CASCADE on update CASCADE
);




insert into utilisateurs (id, nom, prenom, pseudo, email, avatar) values 
(1, 'Tallie', 'Walsh', 'Keylex', 'twalsh0@tinyurl.com', 'https://robohash.org/laboriosamiurevoluptatibus.png?size=50x50&set=set1'),
(2, 'Britni', 'Bestwerthick', 'Bitchip', 'bbestwerthick1@buzzfeed.com', 'https://robohash.org/eiusomnisofficia.png?size=50x50&set=set1'),
(3, 'Callida', 'Ballaam', 'Andalax', 'cballaam2@springer.com', 'https://robohash.org/etipsumadipisci.png?size=50x50&set=set1'),
(4, 'Warden', 'Lanceley', 'Regrant', 'wlanceley3@google.de', 'https://robohash.org/quidemcommodiest.png?size=50x50&set=set1'),
(5, 'Sigfrid', 'Rosenfarb', 'Konklux', 'srosenfarb4@weibo.com', 'https://robohash.org/illumeiusvoluptatem.png?size=50x50&set=set1'),
(6, 'Tybie', 'Rome', 'It', 'trome5@seesaa.net', 'https://robohash.org/quamsitdicta.png?size=50x50&set=set1'),
(7, 'Dagmar', 'Annott', 'Lotlux', 'dannott6@diigo.com', 'https://robohash.org/estsedquaerat.png?size=50x50&set=set1'),
(8, 'Israel', 'Montford', 'Zathin', 'imontford7@who.int', 'https://robohash.org/voluptatemquiofficiis.png?size=50x50&set=set1'),
(9, 'Brenn', 'Goudy', 'Bamity', 'bgoudy8@umn.edu', 'https://robohash.org/magniessepariatur.png?size=50x50&set=set1'),
(10, 'Lois', 'Blare', 'Job', 'lblare9@rambler.ru', 'https://robohash.org/repudiandaeautemexpedita.png?size=50x50&set=set1');

insert into photos (id, image, description, localisation, utilisateurid) values 
(1, 'http://dummyimage.com/118x100.png/cc0000/ffffff', 'Curabitur convallis.', 'Philippines', 9),
(2, 'http://dummyimage.com/196x100.png/dddddd/000000', 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.', 'Philippines', 7),
(3, 'http://dummyimage.com/193x100.png/dddddd/000000', 'Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius.', 'Indonesia', 9),
(4, 'http://dummyimage.com/122x100.png/ff4444/ffffff', 'Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'Democratic Republic of the Congo', 5),
(5, 'http://dummyimage.com/197x100.png/dddddd/000000', 'In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 'Pakistan', 5),
(6, 'http://dummyimage.com/200x100.png/cc0000/ffffff', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst.', 'Poland', 3),
(7, 'http://dummyimage.com/218x100.png/dddddd/000000', 'Donec semper sapien a libero. Nam dui.', 'Russia', 6),
(8, 'http://dummyimage.com/205x100.png/ff4444/ffffff', 'Donec dapibus. Duis at velit eu est congue elementum.', 'China', 5),
(9, 'http://dummyimage.com/121x100.png/cc0000/ffffff', 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 'South Africa', 1),
(10, 'http://dummyimage.com/154x100.png/ff4444/ffffff', 'Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.', 'Greece', 2),
(11, 'http://dummyimage.com/131x100.png/dddddd/000000', 'Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum.', 'China', 8),
(12, 'http://dummyimage.com/231x100.png/ff4444/ffffff', 'Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat.', 'Japan', 4),
(13, 'http://dummyimage.com/174x100.png/ff4444/ffffff', 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh.', 'Czech Republic', 4),
(14, 'http://dummyimage.com/223x100.png/cc0000/ffffff', 'Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien.', 'Japan', 9),
(15, 'http://dummyimage.com/184x100.png/ff4444/ffffff', 'In hac habitasse platea dictumst.', 'Argentina', 7),
(16, 'http://dummyimage.com/181x100.png/5fa2dd/ffffff', 'Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti.', 'Japan', 4),
(17, 'http://dummyimage.com/116x100.png/dddddd/000000', 'Integer non velit.', 'Indonesia', 3),
(18, 'http://dummyimage.com/104x100.png/cc0000/ffffff', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 'Nigeria', 3),
(19, 'http://dummyimage.com/219x100.png/ff4444/ffffff', 'Ut at dolor quis odio consequat varius. Integer ac leo.', 'Brazil', 8),
(20, 'http://dummyimage.com/177x100.png/5fa2dd/ffffff', 'Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'Indonesia', 7),
(21, 'http://dummyimage.com/206x100.png/dddddd/000000', 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 'United States', 3),
(22, 'http://dummyimage.com/154x100.png/5fa2dd/ffffff', 'In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 'Indonesia', 9),
(23, 'http://dummyimage.com/152x100.png/cc0000/ffffff', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui.', 'Indonesia', 3),
(24, 'http://dummyimage.com/134x100.png/5fa2dd/ffffff', 'Maecenas ut massa quis augue luctus tincidunt.', 'Mali', 3),
(25, 'http://dummyimage.com/130x100.png/cc0000/ffffff', 'Integer ac neque. Duis bibendum.', 'Cuba', 1),
(26, 'http://dummyimage.com/240x100.png/ff4444/ffffff', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat.', 'Philippines', 5),
(27, 'http://dummyimage.com/131x100.png/ff4444/ffffff', 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla.', 'China', 8),
(28, 'http://dummyimage.com/195x100.png/cc0000/ffffff', 'Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'Denmark', 6),
(29, 'http://dummyimage.com/104x100.png/dddddd/000000', 'Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 'Nicaragua', 8),
(30, 'http://dummyimage.com/224x100.png/ff4444/ffffff', 'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo.', 'Portugal', 7),
(31, 'http://dummyimage.com/155x100.png/cc0000/ffffff', 'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti.', 'China', 9),
(32, 'http://dummyimage.com/230x100.png/ff4444/ffffff', 'Suspendisse potenti.', 'China', 10),
(33, 'http://dummyimage.com/215x100.png/cc0000/ffffff', 'Donec dapibus.', 'Poland', 2),
(34, 'http://dummyimage.com/124x100.png/cc0000/ffffff', 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 'China', 3),
(35, 'http://dummyimage.com/220x100.png/5fa2dd/ffffff', 'Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 'Colombia', 2),
(36, 'http://dummyimage.com/203x100.png/5fa2dd/ffffff', 'In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 'Indonesia', 7),
(37, 'http://dummyimage.com/157x100.png/cc0000/ffffff', 'In hac habitasse platea dictumst.', 'China', 5),
(38, 'http://dummyimage.com/160x100.png/dddddd/000000', 'In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl.', 'China', 2),
(39, 'http://dummyimage.com/133x100.png/dddddd/000000', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 'Czech Republic', 9),
(40, 'http://dummyimage.com/182x100.png/cc0000/ffffff', 'Quisque porta volutpat erat.', 'Sweden', 7),
(41, 'http://dummyimage.com/181x100.png/cc0000/ffffff', 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.', 'China', 8),
(42, 'http://dummyimage.com/228x100.png/dddddd/000000', 'Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 'Philippines', 3),
(43, 'http://dummyimage.com/117x100.png/5fa2dd/ffffff', 'Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti.', 'Poland', 1),
(44, 'http://dummyimage.com/176x100.png/cc0000/ffffff', 'Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus.', 'Indonesia', 10),
(45, 'http://dummyimage.com/222x100.png/cc0000/ffffff', 'Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl.', 'Georgia', 1),
(46, 'http://dummyimage.com/178x100.png/ff4444/ffffff', 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus.', 'China', 8),
(47, 'http://dummyimage.com/181x100.png/cc0000/ffffff', 'Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue.', 'Russia', 9),
(48, 'http://dummyimage.com/137x100.png/ff4444/ffffff', 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla.', 'China', 6),
(49, 'http://dummyimage.com/128x100.png/dddddd/000000', 'Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam.', 'Indonesia', 8),
(50, 'http://dummyimage.com/163x100.png/dddddd/000000', 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum.', 'Brazil', 7);


insert into commentaires (id, comments, utilisateurid, photoid) values 
(1, 'In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc.', 1, 12),
(2, 'Sed ante. Vivamus tortor.', 5, 11),
(3, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', 10, 19),
(4, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia.', 4, 20),
(5, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy.', 2, 40),
(6, 'Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue.', 10, 42),
(7, 'Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim.', 3, 19),
(8, 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.', 1, 17),
(9, 'Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices.', 5, 37),
(10, 'Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula.', 5, 9),
(11, 'Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh.', 10, 7),
(12, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 4, 25),
(13, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 2, 13),
(14, 'Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 1, 11),
(15, 'Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 7, 44),
(16, 'Phasellus in felis.', 5, 37),
(17, 'Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero.', 5, 45),
(18, 'Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 10, 6),
(19, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla.', 4, 6),
(20, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 1, 26),
(21, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla.', 1, 22),
(22, 'Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 6, 34),
(23, 'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 5, 42),
(24, 'Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui.', 10, 4),
(25, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.', 6, 50),
(26, 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 6, 1),
(27, 'Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla.', 9, 9),
(28, 'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 4, 11),
(29, 'Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor.', 3, 27),
(30, 'Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.', 8, 26),
(31, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc.', 9, 28),
(32, 'Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 7, 10),
(33, 'Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 3, 20),
(34, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 1, 7),
(35, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.', 3, 19),
(36, 'Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 7, 5),
(37, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 5, 41),
(38, 'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat.', 8, 21),
(39, 'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 3, 40),
(40, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis.', 4, 7),
(41, 'Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.', 7, 25),
(42, 'Suspendisse potenti.', 4, 32),
(43, 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst.', 1, 32),
(44, 'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 4, 23),
(45, 'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 8, 2),
(46, 'Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius.', 6, 27),
(47, 'Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque.', 10, 34),
(48, 'Etiam vel augue.', 2, 16),
(49, 'Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam.', 3, 28),
(50, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', 8, 31);


INSERT INTO likes (id, utilisateurid, photoid) VALUES 
(1, 6, 43), (2, 4, 37), (3, 1, 12), (4, 6, 5), (5, 6, 16), (6, 10, 41), (7, 6, 16), (8, 10, 4), (9, 3, 25), (10, 6, 48), (11, 9, 3), (12, 9, 20), (13, 8, 48),
(14, 7, 5), (15, 7, 15), (16, 9, 7), (17, 8, 29), (18, 9, 49), (19, 6, 46), (20, 8, 50), (21, 3, 41), (22, 4, 36), (23, 10, 50), (24, 7, 25), (25, 10, 21),
(26, 2, 39), (27, 5, 24), (28, 3, 7), (29, 2, 8), (30, 3, 5), (31, 3, 6), (32, 4, 29), (33, 2, 18), (34, 2, 17), (35, 8, 24), (36, 1, 4), (37, 5, 13),
(38, 3, 33), (39, 7, 9), (40, 4, 39), (41, 7, 19), (42, 1, 33), (43, 3, 26), (44, 5, 39), (45, 3, 22), (46, 8, 45), (47, 1, 45), (48, 3, 18), (49, 2, 10), (50, 9, 22);

-- 4. Pour tous les commentaires, montrer le contenu et le username de
-- l'auteur

SELECT 
commentaires.utilisateurid, utilisateurs.pseudo, commentaires.comments 
FROM commentaires 
JOIN utilisateurs 
ON utilisateurs.id = commentaires.utilisateurid;

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
