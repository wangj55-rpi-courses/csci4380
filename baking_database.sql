
drop table signatures ;
drop table showstoppers ;
drop table technicals ;
drop table results ;
drop table favorites ;

-- list of all competing bakers
drop table bakers;
create table bakers(
      baker        varchar(10) primary key
      , fullname   varchar(100)
      , age        int
      , occupation varchar(100)
      , hometown   varchar(100)
);

-- list of all episodes in the database, include the name of three
-- types of challenges in each episode: signature, technical and
-- showstopper

drop table episodes;
create table episodes (
    id               int  primary key
    , title          varchar(100)
    , firstaired     date
    , viewers7day  float
    , signature       varchar(100)
    , technical       varchar(100)
    , showstopper     varchar(100)
) ;

-- the description of the specific makes (things they made) for each
-- baker in each episode for the signature challenge of that episode.

create table signatures(
     episodeid int
     , baker   varchar(100)
     , make    varchar(100)
     , primary key (episodeid, baker)
     , foreign key (episodeid) references episodes(id)
     , foreign key (baker) references bakers(baker)
);

-- the description of the specific makes (things they made) for each
-- baker in each episode for the showstoppers challenge of that
-- episode.

create table showstoppers(
     episodeid int
     , baker   varchar(100)
     , make    varchar(100)
     , primary key (episodeid, baker)
     , foreign key (episodeid) references episodes(id)
     , foreign key (baker) references bakers(baker)
);

-- the rank of each baker in each episode for the technical challenge
-- of that episode.

create table technicals(
     episodeid int
     , baker   varchar(100)
     , rank    int
     , primary key (episodeid, baker)
     , foreign key (episodeid) references episodes(id)
     , foreign key (baker) references bakers(baker)
);

-- results of each episode, who was eliminated and who won by being
-- named 'star baker'

create table results (
      episodeid int
     , baker   varchar(100)
     , result   varchar(20)	  
     , primary key (episodeid, baker)
     , foreign key (episodeid) references episodes(id)
     , foreign key (baker) references bakers(baker)
);


-- favorites in an episode, these are the bakers who were a favorite
-- in that episode but did not win star baker in that episode

create table favorites(
     episodeid int
     , baker   varchar(100)
     , primary key (episodeid, baker)
     , foreign key (episodeid) references episodes(id)
     , foreign key (baker) references bakers(baker)
);


insert into bakers values('Antony','Antony Amourdoux',30,'Banker','London');
insert into bakers values('Briony','Briony Williams',33 ,'Full-time parent','Bristol');
insert into bakers values('Dan','Dan Beasley-Harling',36 ,'Full-time parent','London');
insert into bakers values('Imelda','Imelda McCarron',33 ,'Countryside recreation officer','County Tyrone');
insert into bakers values('Jon','Jon Jenkins',47 ,'Blood courier','Newport');
insert into bakers values('Karen','Karen Wright',60 ,'In-store sampling assistant','Wakefield');
insert into bakers values('Kim-Joy','Kim-Joy Hewlett',27 ,'Mental health specialist','Leeds');
insert into bakers values('Luke','Luke Thompson',30 ,'Civil servant/house and techno DJ','Sheffield');
insert into bakers values('Manon','Manon Lagrève',26 ,'Software project manager','London');
insert into bakers values('Rahul','Rahul Mandal',30 ,'Research scientist','Rotherham');
insert into bakers values('Ruby','Ruby Bhogal',29 ,'Project manager','London');
insert into bakers values('Terry','Terry Hartill',56 ,'Retired air steward','West Midlands');


insert into episodes values(1,'Biscuits', date '2018-8-28', 9.55,'24 Regional Biscuits','8 Wagon Wheels','3D Biscuit Self-Portrait');
insert into episodes values(2,'Cakes', date '2018-9-4', 9.31,'16 Traybakes','Le Gâteau Vert','Chocolate Collar Cake');
insert into episodes values(3,'Bread', date '2018-9-11', 8.91,'12 Chelsea Buns','8 Non-Yeasted Garlic Naan Breads','Korovai');
insert into episodes values(4,'Desserts', date '2018-9-18', 8.88,'Meringue Roulade','Raspberry Blancmange with 12 Langues du Chat biscuits','Melting Chocolate Ball Dessert');
insert into episodes values(5,'Spice', date '2018-9-25', 8.67,'Ginger Cake','12 Ma''amoul','Spiced Biscuit Chandelier');
insert into episodes values(6,'Pastry', date '2018-10-2', 9.30,'12 Samosas','6 Puits D''amour','Shaped Banquet Pie');
insert into episodes values(7,'Vegan', date '2018-10-9', 9.54,'8 Savoury Vegan Tartlets','Vegan Tropical Fruit Pavlova','Vegan Celebratory Cake');
insert into episodes values(8,'Danish', date '2018-10-16', 9.69,'2 Smørrebrød','14 Æbleskiver','Kagemand/Kagekone');
insert into episodes values(9,'Pâtisserie (Semi-final)', date '2018-10-23', 9.50,'24 Madeleines','Torta Setteveli','Parisian Pâtisserie Window');
insert into episodes values(10,'Final', date '2018-10-30', 10.34,'12 Iced Doughnuts','6 Campfire Pita Breads','Landscape Dessert');


insert into signatures values(1,'Antony','Turmeric and Caraway Goosnargh Cakes');
insert into signatures values(1,'Briony','Apple Cider Empire Biscuits');
insert into signatures values(1,'Dan','Lemon and Strawberry Shrewsburys');
insert into signatures values(1,'Imelda','Cherry and White Chocolate Oatmeal Biscuits');
insert into signatures values(1,'Jon','Aberffraw ''Creams''');
insert into signatures values(1,'Karen','Yorkshire Perkins');
insert into signatures values(1,'Kim-Joy','Orange Blossom York Biscuits');
insert into signatures values(1,'Luke','Yorkshire Gingernuts');
insert into signatures values(1,'Manon','Hazelnut Cornish Shortbread');
insert into signatures values(1,'Rahul','Fennel and Coconut Pitcaithly Bannock');
insert into signatures values(1,'Ruby','Masala Chai Devon Flats');
insert into signatures values(1,'Terry','Lake District Ginger Shortbread');
insert into signatures values(2,'Antony','Cardamom and Coconut Burfi Traybake');
insert into signatures values(2,'Briony','Turron and Orange Traybake');
insert into signatures values(2,'Dan','Black Forest Slice');
insert into signatures values(2,'Jon','Lemon Meringue Traybake');
insert into signatures values(2,'Karen','Almond and Marzipan Traybake with Rhubarb Jam');
insert into signatures values(2,'Kim-Joy','Pandan Chiffon Cake with Palm Sugar Cream');
insert into signatures values(2,'Luke','Lemon and Poppy Seed Traybake');
insert into signatures values(2,'Manon','Rosemary and Honey Traybake');
insert into signatures values(2,'Rahul','Lemon and Cardamom Traybake');
insert into signatures values(2,'Ruby','Boozy Black Forest Traybake');
insert into signatures values(2,'Terry','Rum and Raisin Traybake');
insert into signatures values(3,'Antony','Decadent Breakfast Chelsea Buns');
insert into signatures values(3,'Briony','Balsamic Strawberry Chelsea Buns');
insert into signatures values(3,'Dan','Sticky Spiced Orange Chelsea Buns');
insert into signatures values(3,'Jon','Cardiff City vs Chelsea Buns');
insert into signatures values(3,'Karen','Peak District Christmas Chelsea Buns');
insert into signatures values(3,'Kim-Joy','Pistachio and Cardamom Tangzhong Chelsea Buns');
insert into signatures values(3,'Manon','Apricot, Cranberry and Marzipan Chai Chelsea Buns');
insert into signatures values(3,'Rahul','Mango and Cranberry Chelsea Buns');
insert into signatures values(3,'Ruby','Gujarela Chelsea Buns with Dates, Almonds and Raisins');
insert into signatures values(3,'Terry','Tangy Citrus Sticky Chelsea Buns');
insert into signatures values(4,'Briony','Treacle Tart Roulade');
insert into signatures values(4,'Dan','Florida Roulade');
insert into signatures values(4,'Jon','Mango and Passion Fruit Roulade');
insert into signatures values(4,'Karen','Coffee Cream and Praline Roulade');
insert into signatures values(4,'Kim-Joy','''Sweet Dreams'' Roulade');
insert into signatures values(4,'Manon','Amarene and Kirsch Cherry Roulade');
insert into signatures values(4,'Rahul','Rhubarb and Custard Roulade');
insert into signatures values(4,'Ruby','Pina Colada Roulade');
insert into signatures values(5,'Briony','Honey and Apricot Ginger Cake');
insert into signatures values(5,'Dan','Ginger and Lemon Drip Cake');
insert into signatures values(5,'Jon','Family Christmas Ginger Cake');
insert into signatures values(5,'Karen','Bonfire Night Ginger Cake');
insert into signatures values(5,'Kim-Joy','Stem Ginger Cake with Poached Pears');
insert into signatures values(5,'Manon','Italian Meringue Ginger Cake');
insert into signatures values(5,'Rahul','Bonfire Night Caramel Ginger Cake');
insert into signatures values(5,'Ruby','Jamaican Me Crazy Ginger Cake');
insert into signatures values(5,'Terry','Caramelised Pear and Stem Ginger Cake');
insert into signatures values(6,'Briony','Home Comforts');
insert into signatures values(6,'Dan','Festive Samosas');
insert into signatures values(6,'Jon','A Romantic Dinner For Two, Samosa Style');
insert into signatures values(6,'Kim-Joy','Flavours of India');
insert into signatures values(6,'Manon','Samosas for Mum');
insert into signatures values(6,'Rahul','Paneer Singara and Misti Singara');
insert into signatures values(6,'Ruby','Traditional Samosas');
insert into signatures values(7,'Briony','French Onion Tartlets and Celeriac & Apple Tartlets');
insert into signatures values(7,'Jon','Garlic Mushroom Tartlets and Falafel & Hummus Tartlets');
insert into signatures values(7,'Kim-Joy','Broccoli & Tomato Quiches and Mascarpone Squirrel Tartlets');
insert into signatures values(7,'Manon','Summer & Winter Tartlets');
insert into signatures values(7,'Rahul','Coriander Posto & Veg Tartlets and Ghugni Chaat Tartlets');
insert into signatures values(7,'Ruby','Sage & Butternut Tartlets and ''Cheesy Greens'' Tartlets');
insert into signatures values(8,'Briony','Spanish & West Country Smørrebrød');
insert into signatures values(8,'Kim-Joy','Bumblebee Eggs & Fish Smørrebrød');
insert into signatures values(8,'Manon','Cheese and Fruit Smørrebrød');
insert into signatures values(8,'Rahul','Smoked Salmon & Roasted Vegetable Smørrebrød');
insert into signatures values(8,'Ruby','Post-Gym Smørrebrød');
insert into signatures values(9,'Briony','Mojito Madeleines & Espresso Martini Madeleines');
insert into signatures values(9,'Kim-Joy','Ginger and Lemon Madeleines & Orange Bunny Madeleines');
insert into signatures values(9,'Rahul','Lemon and Raspberry Madeleines & Orange Curd Madeleines');
insert into signatures values(9,'Ruby','Pick Your Own Madeleines');
insert into signatures values(10,'Kim-Joy','Amaretto Diplomat Filled Doughnuts & Lemon Ring Doughnuts');
insert into signatures values(10,'Rahul','Mango Créme Pâtissière Filled Doughnuts & Spiced Orange Ring Doughnuts');
insert into signatures values(10,'Ruby','Dulce De Leche Filled Doughnuts & Raspberry and Cardamom Ring Doughnuts');

insert into showstoppers values(1,'Antony','Kilimanjaro Selfie');
insert into showstoppers values(1,'Briony','Bristol Biscuit Selfie');
insert into showstoppers values(1,'Dan','New Dad in Palm Springs');
insert into showstoppers values(1,'Imelda','Seaside Selfie');
insert into showstoppers values(1,'Jon','A Sailing Selfie by the Sea');
insert into showstoppers values(1,'Karen','Rosewater and Cardamom "Holiday Selfie');
insert into showstoppers values(1,'Kim-Joy','Me at Miyajima Shrine');
insert into showstoppers values(1,'Luke','What Happens In Vegas...!');
insert into showstoppers values(1,'Manon','Matcha and White Chocolate Ganache Japanese Selfie');
insert into showstoppers values(1,'Rahul','First Spring in the UK');
insert into showstoppers values(1,'Ruby','Gingerbread Marathon Selfie');
insert into showstoppers values(1,'Terry','Brandy Snap Selfie');
insert into showstoppers values(2,'Antony','Pistachio, Saffron and Rose Cake');
insert into showstoppers values(2,'Briony','Chocolate Fudge and Salted Caramel Creation');
insert into showstoppers values(2,'Dan','Dark Chocolate and Raspberry Birthday Cake');
insert into showstoppers values(2,'Jon','Hawaiian Shirt Pina Colada Cake');
insert into showstoppers values(2,'Karen','Strawberry Fayre Chocolate Cake');
insert into showstoppers values(2,'Kim-Joy','Yuzu and Raspberry Genoise Cat Cake');
insert into showstoppers values(2,'Luke','Raspberry and White Chocolate Collar Cake');
insert into showstoppers values(2,'Manon','Almond Princess Cake');
insert into showstoppers values(2,'Rahul','Chocolate Orange Layer Cake');
insert into showstoppers values(2,'Ruby','Chocolate Orange "Jackson Pollock" Collar Cake');
insert into showstoppers values(2,'Terry','Champagne and Strawberries Eiffel Tower Collar Cake');
insert into showstoppers values(3,'Antony','Chocolate and Orange Adventure Korovai');
insert into showstoppers values(3,'Briony','Happily Ever After Korovai');
insert into showstoppers values(3,'Dan','Wedding Korovai');
insert into showstoppers values(3,'Jon','Korovai Dydd Dewi Sant');
insert into showstoppers values(3,'Karen','French Breakfast Wedding Korovai');
insert into showstoppers values(3,'Kim-Joy','Orange, Cinnamon and Cranberry ''Kit-ovai''');
insert into showstoppers values(3,'Manon','Fabergé Inspired Traditional Korovai');
insert into showstoppers values(3,'Rahul','Garden Wedding Korovai');
insert into showstoppers values(3,'Ruby','Mama and Papa''s Belated Wedding Korovai');
insert into showstoppers values(3,'Terry','Garden Korovai');
insert into showstoppers values(4,'Briony','Blood Orange & Amaretto Sticky Toffee Sphere');
insert into showstoppers values(4,'Dan','Dan and the Giant Peach');
insert into showstoppers values(4,'Jon','Lucy and Hannah''s Ballet Cake');
insert into showstoppers values(4,'Karen','Chateau Du Chambord Framboise');
insert into showstoppers values(4,'Kim-Joy','Melting Chocolate Galaxy');
insert into showstoppers values(4,'Manon','White Chocolate Renaissance Surprise');
insert into showstoppers values(4,'Rahul','Opera Cake with Kalash Inspired Dome');
insert into showstoppers values(4,'Ruby','Chocolate Egg');
insert into showstoppers values(5,'Briony','Turmeric Latte Chandelier');
insert into showstoppers values(5,'Dan','Birthday Kaleidoscope for Constance');
insert into showstoppers values(5,'Jon','Birthday Chandelier for Emily''s 21st');
insert into showstoppers values(5,'Karen','Pontefract Girls'' School Reunion');
insert into showstoppers values(5,'Kim-Joy','Christmas Spiced Ice Chandelier');
insert into showstoppers values(5,'Manon','Art Deco Spiced Biscuit Chandelier');
insert into showstoppers values(5,'Rahul','Durga Puja Cardamom Chandelier');
insert into showstoppers values(5,'Ruby','Peacock Chandelier');
insert into showstoppers values(5,'Terry','12 Days of Christmas Chandelier');
insert into showstoppers values(6,'Briony','Down the Rabbit Hole" Banquet Pie');
insert into showstoppers values(6,'Dan','Salmon Coulibiac');
insert into showstoppers values(6,'Jon','Welsh Dragon Pie');
insert into showstoppers values(6,'Kim-Joy','Silke the Vegetarian Mermaid');
insert into showstoppers values(6,'Manon','What Has Poppy Eaten?');
insert into showstoppers values(6,'Rahul','Butterfly Pie');
insert into showstoppers values(6,'Ruby','Kohinoor Crown');
insert into showstoppers values(7,'Briony','Hazelnut Mocha Cake');
insert into showstoppers values(7,'Jon','Only Fools Eat Horses Cake');
insert into showstoppers values(7,'Kim-Joy','Lavender & Lemon Fox Cake');
insert into showstoppers values(7,'Manon','Spiced Apple Cake');
insert into showstoppers values(7,'Rahul','Chocolate & Coconut Layer Cake with Raspberry Jam');
insert into showstoppers values(7,'Ruby','Chocolate, Lemon & Coconut Cake');
insert into showstoppers values(8,'Briony','Nana Pat Kagekone');
insert into showstoppers values(8,'Kim-Joy','Off to the Opera Kagekone');
insert into showstoppers values(8,'Manon','Birthday Girl Kagekone');
insert into showstoppers values(8,'Rahul','Indian King Kagemand');
insert into showstoppers values(8,'Ruby','Sister Kagekone');
insert into showstoppers values(9,'Briony','British Tea to French Pâtisserie Window');
insert into showstoppers values(9,'Kim-Joy','Flavourite Flavours Window Display');
insert into showstoppers values(9,'Rahul','Classic Tribute to Pâtisserie Window');
insert into showstoppers values(9,'Ruby','Parisian Un Bouquet de Fleurs Window Display');
insert into showstoppers values(10,'Kim-Joy','Lost City of Atlantis Dessert Landscape');
insert into showstoppers values(10,'Rahul','Edible Rock Garden');
insert into showstoppers values(10,'Ruby','Magical Edible Landscape');



insert into technicals values(1,'Antony',12);
insert into technicals values(1,'Briony',2);
insert into technicals values(1,'Dan',4);
insert into technicals values(1,'Imelda',11);
insert into technicals values(1,'Jon',5);
insert into technicals values(1,'Karen',6);
insert into technicals values(1,'Kim-Joy',10);
insert into technicals values(1,'Luke',8);
insert into technicals values(1,'Manon',3);
insert into technicals values(1,'Rahul',7);
insert into technicals values(1,'Ruby',1);
insert into technicals values(1,'Terry',9);
insert into technicals values(2,'Antony',9);
insert into technicals values(2,'Briony',5);
insert into technicals values(2,'Dan',3);
insert into technicals values(2,'Jon',1);
insert into technicals values(2,'Karen',11);
insert into technicals values(2,'Kim-Joy',4);
insert into technicals values(2,'Luke',7);
insert into technicals values(2,'Manon',6);
insert into technicals values(2,'Rahul',2);
insert into technicals values(2,'Ruby',10);
insert into technicals values(2,'Terry',8);
insert into technicals values(3,'Antony',8);
insert into technicals values(3,'Briony',9);
insert into technicals values(3,'Dan',6);
insert into technicals values(3,'Jon',2);
insert into technicals values(3,'Karen',5);
insert into technicals values(3,'Kim-Joy',10);
insert into technicals values(3,'Manon',3);
insert into technicals values(3,'Rahul',4);
insert into technicals values(3,'Ruby',7);
insert into technicals values(3,'Terry',1);
insert into technicals values(4,'Briony',5);
insert into technicals values(4,'Dan',1);
insert into technicals values(4,'Jon',3);
insert into technicals values(4,'Karen',7);
insert into technicals values(4,'Kim-Joy',6);
insert into technicals values(4,'Manon',8);
insert into technicals values(4,'Rahul',4);
insert into technicals values(4,'Ruby',2);
insert into technicals values(5,'Briony',6);
insert into technicals values(5,'Dan',2);
insert into technicals values(5,'Jon',7);
insert into technicals values(5,'Karen',9);
insert into technicals values(5,'Kim-Joy',4);
insert into technicals values(5,'Manon',5);
insert into technicals values(5,'Rahul',3);
insert into technicals values(5,'Ruby',1);
insert into technicals values(5,'Terry',8);
insert into technicals values(6,'Briony',1);
insert into technicals values(6,'Dan',6);
insert into technicals values(6,'Jon',2);
insert into technicals values(6,'Kim-Joy',5);
insert into technicals values(6,'Manon',4);
insert into technicals values(6,'Rahul',3);
insert into technicals values(6,'Ruby',7);
insert into technicals values(7,'Briony',5);
insert into technicals values(7,'Jon',4);
insert into technicals values(7,'Kim-Joy',6);
insert into technicals values(7,'Manon',2);
insert into technicals values(7,'Rahul',1);
insert into technicals values(7,'Ruby',3);
insert into technicals values(8,'Briony',1);
insert into technicals values(8,'Kim-Joy',2);
insert into technicals values(8,'Manon',4);
insert into technicals values(8,'Rahul',5);
insert into technicals values(8,'Ruby',3);
insert into technicals values(9,'Briony',3);
insert into technicals values(9,'Kim-Joy',2);
insert into technicals values(9,'Rahul',4);
insert into technicals values(9,'Ruby',1);
insert into technicals values(10,'Kim-Joy',1);
insert into technicals values(10,'Rahul',2);
insert into technicals values(10,'Ruby',3);

insert into results values(1,'Manon','star baker') ;
insert into results values(1,'Imelda','eliminated') ;
insert into results values(2,'Rahul','star baker') ;
insert into results values(2,'Luke','eliminated') ;
insert into results values(3,'Rahul','star baker') ;
insert into results values(3,'Antony','eliminated') ;
insert into results values(4,'Dan','star baker') ;
insert into results values(5,'Terry','eliminated') ;
insert into results values(5,'Kim-Joy','star baker') ;
insert into results values(5,'Karen','eliminated') ;
insert into results values(6,'Briony','star baker') ;
insert into results values(6,'Dan','eliminated') ;
insert into results values(7,'Kim-Joy','star baker') ;
insert into results values(7,'Jon','eliminated') ;
insert into results values(8,'Ruby','star baker') ;
insert into results values(8,'Manon','eliminated') ;
insert into results values(9,'Ruby','star baker') ;
insert into results values(9,'Briony','eliminated') ;

insert into favorites values(1, 'Briony');
insert into favorites values(2,'Jon');
insert into favorites values(2,'Dan');
insert into favorites values(3,'Dan');
insert into favorites values(4,'Rahul');
insert into favorites values(4,'Jon');
insert into favorites values(5,'Rahul');
insert into favorites values(6,'Rahul');
insert into favorites values(6, 'Ruby');
insert into favorites values(7,'Rahul');
insert into favorites values(8, 'Briony');
insert into favorites values(9,'Kim-Joy');

