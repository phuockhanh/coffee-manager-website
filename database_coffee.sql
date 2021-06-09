CREATE DATABASE  IF NOT EXISTS `manager_coffee` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `manager_coffee`;
-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: manager_coffee
-- ------------------------------------------------------
-- Server version	8.0.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `idOrder` int NOT NULL AUTO_INCREMENT,
  `IdProduct` int DEFAULT NULL,
  `UserName` varchar(100) DEFAULT NULL,
  `Date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Amount` int DEFAULT NULL,
  PRIMARY KEY (`idOrder`),
  KEY `IdProduct` (`IdProduct`),
  KEY `UserName` (`UserName`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`IdProduct`) REFERENCES `product` (`IdProduct`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`UserName`) REFERENCES `user` (`UserName`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (2,50,'khanh','2021-06-07 08:08:05',1),(3,51,'phong','2021-06-07 13:33:25',3),(4,52,'khanh','2021-06-07 13:44:38',2),(5,53,'khanh','2021-06-07 13:44:38',3),(6,56,'khanh','2021-06-07 13:44:38',2),(7,52,'phong','2021-06-07 13:49:36',2),(8,58,'phong','2021-06-07 13:49:36',3),(9,56,'phong','2021-06-07 13:49:36',1),(10,52,'khanh','2021-06-08 01:18:08',3),(11,51,'khanh','2021-06-08 01:18:08',3),(12,51,'admin','2021-06-08 02:35:45',7),(13,51,'khanh','2021-06-08 09:35:47',3),(14,53,'khanh','2021-06-08 09:35:47',3);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pdlinesmall`
--

DROP TABLE IF EXISTS `pdlinesmall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pdlinesmall` (
  `idPdLineSmall` int NOT NULL,
  `NamePdSmall` varchar(100) DEFAULT NULL,
  `IdProductLine` int DEFAULT NULL,
  PRIMARY KEY (`idPdLineSmall`),
  KEY `IdProductLine` (`IdProductLine`),
  CONSTRAINT `pdlinesmall_ibfk_1` FOREIGN KEY (`IdProductLine`) REFERENCES `productline` (`IdProductLine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pdlinesmall`
--

LOCK TABLES `pdlinesmall` WRITE;
/*!40000 ALTER TABLE `pdlinesmall` DISABLE KEYS */;
INSERT INTO `pdlinesmall` VALUES (101,'Ganze_bohne',1),(102,'MahlKaffee',1),(103,'Kapseln',1),(104,'Cold Brew',1),(105,'Pads',1),(106,'spezialitaetenkaffee',1),(201,'Triangel',2),(202,'Doppelkammer',2),(301,'Set-angebote',3),(401,'Geschirr',4),(501,'Handfilter',5),(502,'Aeropress',5),(601,'In-aktion',6);
/*!40000 ALTER TABLE `pdlinesmall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `IdProduct` int NOT NULL,
  `IdPdSmall` int DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Price` double DEFAULT NULL,
  `PriceKg` double DEFAULT NULL,
  `Image` varchar(100) DEFAULT NULL,
  `Tittle` varchar(100) DEFAULT NULL,
  `Content` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`IdProduct`),
  KEY `IdPdSmall` (`IdPdSmall`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`IdPdSmall`) REFERENCES `pdlinesmall` (`idPdLineSmall`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (50,101,'Speziala',7.991,15.99,'101.jpg','Die guten Sachen ändern sich nie','Was der Uhrturm für Graz und der Panther für die Steiermark – das ist der rote Spezial für J. Hornig. Unser Aushängeschild begeistert schon seit Jahrzehnten mit seinem einzigartigen mild-würzigen Aroma. Für diese spezielle Mischung verwenden wir ausschließlich Bohnen aus den besten Anbaugebieten der Welt. Durch die Langzeitröstung, ergeben sie einen eleganten, geschmeidigen Kaffee.'),(51,101,'Caffè Crema Bio',8.99,NULL,'102.jpg','KLEINE CREMA GANZ GROSS','Der Caffè Crema Bio von J. Hornig macht Kaffee-Gourmets helle Freude. Einerseits, weil die Crema stets perfekt gelingt und weil sein kräftiger Geschmack auf einem starken Aroma baut. Andererseits, weil dafür nur Bohnen aus kontrolliert biologischem Anbau in die Packung kommen. Herangewachsen in den besten Anbaugebieten, gehandelt nach FAIRTRADE-Regeln.'),(52,101,'Alles Arabica',7.99,15.98,'103.jpg','Macht aus guten Tagen sehr gute','Die Augen schließen, riechen, jeden Schluck genießen. Herrlich! So schmeckt nur ein Kaffee der allerbesten Sorte: rund, kräftig, mit außergewöhnlicher Geschmacksfülle – wie der Alles Arabica von J. Hornig. Das Geheimnis dahinter? Die perfekte Auswahl an 100% Arabica-Bohnen. Darunter erstklassiger Mokka aus dem äthiopischen Hochland. Auf mittlerer Stufe geröstet, ergibt sich ein reiches und komplexes Aroma.'),(53,101,'Caffè Crema Classico',8.99,NULL,'105.jpg','Kleine Crema ganz groß','Der dunkle Caffè Crema Classico von J. Hornig macht allen helle Freude. Weil die Crema immer gelingt. Und weil sein ausgeprägter, kräftiger Geschmack auf einem starken Aroma baut, das nur bei der schonenden Langzeitröstung und dem richtigen Röstgrad entsteht. Stark, oder? Dafür kommen auch nur ganz genau ausgesuchte Arabica- und Robusta-Bohnen in diese Packung.'),(54,101,'Bremer',6.99,13.98,'106.jpg','Eine echte Bremadonna','Nur ausgesuchte Arabica- und Robusta-Bohnen schaffen die Aufnahmeprüfung für den Bremer von J. Hornig. Dazu müssen sie aus den sonnigsten Anbauregionen der Welt stammen. Weiteres Qualitätskriterium ist ihre perfekt abgestimmte Röstung. Die schonende Langzeitröstung bringt das feinwürzige Aroma dieser Mischung voll zur Geltung. Das Ergebnis ist ein Kaffee mit kräftigem Geschmack, ideal zum Start in den Tag.'),(55,101,'Caffè Crema Intenso',15.98,15.98,'108.jpg','Temperament in der Tasse','Der Caffè Crema Intenso von J. Hornig verwöhnt Körper und Geist. Angefangen vom aromatischen Duft über das fein-würzige Aroma bis hin zum prickelnden Geschmack: Für den Intenso werden unsere Bohnen nach einer ausgewählten Rezeptur gemischt und geröstet. Sowohl der kräftige, einzigartige Geschmack als auch die stabile Crema zeichnen unseren Caffè Crema Intenso aus.'),(56,101,'Entcoff',7.99,15.98,'110.jpg','Leichter Genuss, schwer in Ordnung','Unser Entcoff versteht es, angenehm zu überraschen. Der charakteristische Geschmack schonend gerösteter Kaffeebohnen, das milde Aroma – alles da. Der Trick dahinter: Die Bohnen werden noch vor dem Rösten sorgfältig entkoffeiniert. Der Kaffee schmeckt samtig weich, überaus ausgewogen und harmonisch. Das garantiert selbst bei mehreren Tassen einen sanften Genuss.'),(57,102,'Spezial gemahlen',7.99,15.98,'104.jpg','Die guten Sachen ändern sich nie','Was der Uhrturm für Graz und der Panther für die Steiermark – das ist der rote Spezial für J. Hornig. Unser Aushängeschild begeistert schon seit Jahrzehnten mit seinem einzigartigen mild-würzigen Aroma. Für diese spezielle Mischung verwenden wir ausschließlich Bohnen aus den besten Anbaugebieten der Welt. Durch die Langzeitröstung, ergeben sie einen eleganten, geschmeidigen Kaffee.'),(58,102,'Alles Arabica gemahlen',7.99,15.98,'109.jpg','Macht aus guten Tagen sehr gute','Die Augen schließen, riechen, jeden Schluck genießen. Herrlich! So schmeckt nur ein Kaffee der allerbesten Sorte: rund, kräftig, mit außergewöhnlicher Geschmacksfülle – wie der Alles Arabica von J. Hornig. Das Geheimnis dahinter? Die perfekte Auswahl an 100% Arabica-Bohnen. Darunter erstklassiger Mokka aus dem äthiopischen Hochland. Auf mittlerer Stufe geröstet, ergibt sich ein reiches und komplexes Aroma.'),(59,102,'Bremer gemahlen',6.99,13.98,'111.jpg','Eine echte Bremadonna','Nur ausgesuchte Arabica- und Robusta-Bohnen schaffen die Aufnahmeprüfung für den Bremer von J. Hornig. Dazu müssen sie aus den sonnigsten Anbauregionen der Welt stammen. Weiteres Qualitätskriterium ist ihre perfekt abgestimmte Röstung. Die schonende Langzeitröstung bringt das feinwürzige Aroma dieser Mischung voll zur Geltung. Das Ergebnis ist ein Kaffee mit kräftigem Geschmack, ideal zum Start in den Tag.'),(60,102,'Alles Bio',8.99,17.98,'112.jpg','Ich habe einen Traum','Guten Gewissens besten Kaffee zu trinken, ist ein Genuss für sich. Darum schmeckt Alles Bio von J. Hornig auch so gut. Um zu dieser Wirkung zu gelangen, werden zu 100% Bohnen aus kontrolliert biologischem Anbau verwendet. Gehandelt nach den Regeln des FAIRTRADE-Gütesiegels, ausgewogen gemischt und schonend geröstet, wird daraus ein Premium-Kaffee – intensiv-blumig im Aroma, komplex und kräftig im Geschmack.'),(61,102,'Entcoff gemahlen',7.99,15.98,'113.jpg','Leichter Genuss, schwer in Ordnung','Unser Entcoff versteht es, angenehm zu überraschen. Der charakteristische Geschmack schonend gerösteter Kaffeebohnen, das milde Aroma – alles da. Der Trick dahinter: Die Bohnen werden noch vor dem Rösten sorgfältig entkoffeiniert. Der Kaffee schmeckt samtig weich, überaus ausgewogen und harmonisch. Das garantiert selbst bei mehreren Tassen einen sanften Genuss.'),(62,105,'Spezial (Softpads)',3.49,31.16,'107.jpg','Die guten Sachen ändern sich nie','Was der Uhrturm für Graz und der Panther für die Steiermark – das ist der rote Spezial für J. Hornig. Unser Aushängeschild begeistert schon seit Jahrzehnten mit seinem einzigartigen mild-würzigen Aroma und weiß auch im SENSEO-kompatiblen Softpad zu glänzen. Für diese spezielle Mischung verwenden wir ausschließlich Bohnen aus den besten Anbaugebieten der Welt. Klassisch gut!'),(63,103,'Crema Lungo Bio Fairtrade 100% biologisch abbaubar',3.49,NULL,'116.jpg','Einfach alles richtig.','Unser Bio FAIRTRADE Crema hat starke innere Werte. Wir verwenden nur Bohnen aus kontrolliert biologischem Anbau, herangewachsen in den besten Anbaugebieten, gehandelt nach FAIRTRADE-Regeln. Sein gehaltvoller Geschmack baut auf einem starken Aroma, die Crema gelingt stets perfekt.'),(64,103,'Intenso Espresso 100% biologisch abbaubar',3.49,NULL,'117.jpg','Liebesgrüße aus Palermo','Starkes Aroma, kräftiger Geschmack: Unser vollmundiger Intenso schickt den Gaumen auf eine Rundreise nach Bella Italia. Ein Schluck von diesem typischen Espresso italienischer Art – und Rom, Mailand und Palermo rücken ein Stück näher.'),(65,103,'Crema Lungo 100% biologisch abbaubar',3.49,NULL,'118.jpg','Na, alles locker?','Mit unserem Crema Lungo ganz bestimmt. Er überzeugt mit gehaltvollem Geschmack und reichem Aroma. Dank der raffinierten Mischung aus feinen Arabica-Bohnen und aromatischen Robusta-Bohnen bleibt die Crema besonders stabil.'),(66,103,'Classico Lungo 100% biologisch abbaubar',3.49,NULL,'119.jpg','Klasse für die Tasse','Unser Classico ist der Gentleman unter den Kaffees. Schonend geröstete Arabica-Bohnen aus Ostafrika und Südamerika verleihen ihm einen sanften, leicht würzigen Geschmack. Ein echter Kaffee von Welt eben.'),(67,104,'Cold Brew Sparkling Orange',1.99,NULL,'120.jpg','MAXIMALER GESCHMACK, WENIGER KALORIEN','Mit J. Hornig Sparkling Orange verfeinern wir unseren Cold Brew mit prickelnder Kohlensäure und dem feinen Geschmack von Orangen. Für einen natürlichen, sanften und erfrischenden Energiekick mit wenig Kalorien und Zucker. Aktiviert die Kraft in dir.'),(68,104,'Cold Brew Coffee',2.49,NULL,'121.jpg',NULL,'Cold Brew ist kein Eiskaffee. Cold Brew ist aber auch mehr als bloß kalter Kaffee. Wir brühen ihn mit kaltem Wasser aus Arabica-Bohnen und lassen ihn 12 Stunden lang ziehen. Das ergibt einen milden Kaffee mit lieblichen Aromen und natürlich-süßem Geschmack.'),(69,104,'Cold Brew Sparkling Ginger Lemon',1.99,NULL,'122.jpg','WENN DAS LEBEN DIR ZITRONEN GIBT…','… kombiniere sie mit Cold Brew, Ingwer und Kohlensäure! Mit Kaffeebohne, Wunderwurzel und Zitrusfrucht haben wir ein Trio gefunden, das mit der richtigen Mischung aus Schärfe und Süße die Geschmacksnerven überrascht.'),(70,105,'Caffè Crema (Cialde) 150 Stk.',49.9,49.9,'123.jpg','Kleine Crema ganz groß','Der dunkle Caffè Crema von J. Hornig macht allen helle Freude. Weil die Crema immer gelingt. Und weil sein ausgeprägter, kräftiger Geschmack auf einem starken Aroma baut, das nur bei dem richtigen Röstgrad entsteht. Dafür kommen auch nur ganz genau ausgesuchte Arabica- und Robusta-Bohnen in diese Packung. Stark, oder?'),(71,105,'Spezial (Cialde) 150 Stk.',49.9,49.9,'124.jpg','Die guten Sachen ändern sich nie','Was der Uhrturm für Graz und der Panther für die Steiermark – das ist der rote Spezial für J. Hornig. Unser Aushängeschild begeistert schon seit Jahrzehnten mit seinem einzigartigen mild-würzigen Aroma. Für diese spezielle Mischung verwenden wir ausschließlich Bohnen aus den besten Anbaugebieten der Welt. Schonend geröstet, ergeben sie einen eleganten, geschmeidigen Kaffee.'),(72,106,'Cerrado Oriente',17.99,35.98,'125.jpg','SPEZIALITÄTENKAFFEE','Unser Cerrado Oriente besteht aus 100% Arabica-Bohnen. In diesem Arabica-Blend steckt das Beste, was Guatemala und Brasilien zu bieten haben. Die Bohnen aus den Regionen Nuevo Oriente und Cerrado werden noch per Hand geerntet, sorgsam aufbereitet und direkt nach Graz geschickt, wo wir den Rohkaffee schonend rösten. So ergibt sich ein Arabica-Blend mit fruchtigem Geschmack, guter Fülle und würzigem Körper.'),(73,106,'Illubabor',8.99,35.96,'126.jpg','Single-Origin-Spezialitätenkaffee','Äthiopien ist so etwas wie das Heimatland aller Arabica-Bohnen. Im Schatten des Urwaldes wächst dort Kaffee von ausgezeichneter Qualität. Farmer Kebede Debessa Mena weiß das am besten. Er baut in Illubabor auf ca. 1.800 Metern Seehöhe die Arabica-Varietät Heirloom an. Nach der händischen Ernte werden die Früchte samt Fruchtfleisch getrocknet. Später in Graz rösten wir die Bohnen im schonenden Langzeitröstverfahren. Das Ergebnis ist ein Single-Origin-Spezialitätenkaffee mit blumigem Aroma, guter Fülle und dezenter Säure.'),(74,106,'Cerrado',8.99,35.96,'127.jpg','Single-Origin-Spezialitätenkaffee','Die Bohnen für unseren J. Hornig Cerrado stammen von der Fazenda Sao Silvestre. Die Farm liegt auf einer Hochebene in der Region Cerrado und wird von Ismael Andrade betrieben. Auf 1.200 Metern Seehöhe baut Ismael die Arabica-Varietät Yellow Icatu an. Der Kaffee wird von Hand geerntet, sorgsam aufbereitet und direkt nach Graz geschickt, wo wir ihn schonend rösten. So ergibt sich ein Single-Origin-Spezialitätenkaffee mit süßem Geschmack, guter Fülle und leichter Säure.'),(75,106,'Nuevo Oriente',8.99,35.96,'128.jpg','Single-Origin-Spezialitätenkaffee','Nuevo Oriente heißt die Region, aus der die Arabica-Bohnen für diesen Single-Origin-Kaffee aus Guatemala kommen. Die Bauern der kleinen Kooperative La Union produzieren im kleinen Örtchen Lampocoy auf 1.000 bis 1.550 Metern in kühl-feuchtem Klima einen exzellenten Rohkaffee, den sie auf direktem Weg zu uns nach Graz schicken. Schonend geröstet, entsteht ein Kaffee mit schokoladigem Aroma, mittlerer Fülle und würzigem Körper.'),(76,201,'BIO Schwarztee',9.98,15.97,'129.jpg','Bio Schwarztee im Triangel-Teebeutel','Es gibt wohl kaum einen, den man so vielfältig zubereiten kann, wie den herben Klassiker unter den Teesorten. Ob mit (Pflanzen-)Milch, mit Zitrone oder ganz und gar pur – wer einmal seine liebste Art gefunden hat, unseren Bio Schwarztee zu genießen, macht das ganz schnell zur Gewohnheit. Man munkelt übrigens, dass er ab einer Ziehdauer von fünf Minuten eine beruhigende Wirkung entwickelt.'),(77,201,'BIO Kräutertee',9.98,15.97,'130.jpg','Bio Kräutertee im Triangel-Teebeutel','Unser BIO Kräutertee ist so ausgewogen und natürlich, dass man einiges von ihm lernen könnte. Zitronenmelisse, Kamille und Pfefferminze machen ihn besonders frisch, für die nötige Süße sorgen Brombeere, Hibiskus und Erdbeeren. Eine unschlagbare Kombi und ein echtes Highlight für alle Kräuterliebhaber:innen.'),(78,201,'BIO Früchtetee',9.98,9.98,'131.jpg','Bio Früchtetee im Triangel-Teebeutel','Wenn all die fruchtigen Schätze des ganzen Jahres in einem edlen Triangel-Beutel zusammentreffen, dann hältst du unseren Bio Früchtetee in den Händen. Du wirst staunen, wie lecker Hibiskus, Hagebutte und Pflaume mit Äpfeln, Birnen und roter Beete harmonieren. Ein Fruchtgenuss für jede Gelegenheit.'),(79,201,'BIO Grüntee',9.98,15.97,'133.jpg','Bio Grüntee im Triangel-Teebeutel','Es sind die kleinen Dinge, die den hektischen Alltag unterbrechen und uns für einen Moment das Hier und Jetzt erleben lassen. Die Zubereitung unseres Bio Grüntees ist eines jener Rituale, die Stress und Anspannung in Luft auflösen. Mit seiner wohltuenden Wirkung auf Körper und Geist und dem frisch-herben Aroma belebt er auf besonders sanfte Art. Also: Augen zu und den Moment genießen!'),(80,201,'BIO Orange',9.98,9.98,'135.jpg','Bio Orange Tee im Triangel-Teebeutel','Wir müssen gestehen: In das südländische Temperament dieses Tees haben wir uns vom ersten Moment an unsterblich verliebt. Seine Liaison mit Hagebutte und Hibiskus nehmen wir ihm trotzdem nicht übel. Die drei haben sich einfach gefunden. Gemeinsam machen sie aus unserem Bio Orange einen fruchtigen Tee mit erfrischender Note.'),(81,202,'Hawaii Cocktail (4×25)',8.99,13.08,'132.jpg','4×25 Beutel Vorratspackung','Es gibt Tage, da möchte man am liebsten ins nächste Flugzeug steigen und losfliegen. Für alle, die sich so sehr nach Sonne, Strand und Meer sehnen, haben wir genau das Richtige: unseren Hawaii Cocktail Tee. Er zaubert dir mit einer erfrischenden Früchtemischung und seinem exotischen Aroma das Urlaubsfeeling ganz einfach in die Tasse.'),(82,202,'Früchtetee (4×25)',9.98,14.92,'134.jpg','4×25 Beutel Vorratspackung','Ein bunter Korb herrlicher Früchte – Äpfel, Birnen, Zwetschgen, Hagebutten – trifft auf Hibiskus, süße Brombeerbläter, Rote Beete, Vanille- und Zitronenaromen. Das Ergebnis begeistert alle Früchteteeliebhaber:innen – versprochen!'),(83,301,'J. Hornig Nuevo Oriente & Frenchpress von Hario',29.99,NULL,'136.jpg','Brüh-Set French Press','Simples Design trifft auf maximalen Kaffeegenuss: Mit der Frenchpress von Hario kannst du die Zubereitung deines Lieblingskaffees zelebrieren. Bohnen mahlen, mit heißem Wasser aufgießen, den Stempel runterdrücken, kurz warten und et voilà – fertig! Dazu empfehlen wir unseren Single-Origin-Spezialitätenkaffee J. Hornig Nuevo Oriente aus Guatemala. Mit der Frenchpress gebrüht, entsteht ein Kaffee mit schokoladigem Aroma, mittlerer Fülle und würzigem Körper. Ideal für die Pressstempelkanne!'),(84,301,'J. Hornig Illubabor & AeroPress',33.99,NULL,'137.jpg','Brüh-Set Aero Press','Egal ob zu Hause, im Büro oder auf Reisen – mit der AeroPress gelingt dir dein Lieblingskaffee wirklich überall. Durch einfache Bedienung kannst du die Bohnen im Handumdrehen zubereiten. Dazu eignet sich unser J. Hornig Illubabor perfekt. Die handgepflückten und sonnengetrockneten Arabicas aus Äthiopien überzeugen mit blumigem Aroma, guter Fülle und dezenter Säure – perfekt für diese Zubereitungsmethode. Ein Set für alle Bohnenverliebten!'),(85,301,'J. Hornig Cerrado & Handfilter von Hario',26.99,NULL,'138.jpg','Brüh-Set Handfilter','Ein Set für echte Kaffee-Handwerker: Mit dem Hario v60 Glass Dripper holst du das Beste aus deinen Bohnen heraus. Der formschöne Handfilter ist einfach in der Verwendung und leicht zu reinigen. Gepaart mit unserem J. Hornig Cerrado aus Brasilien bietet diese Kombination ein perfektes Pour-Over-Erlebnis. Angefangen beim köstlichen Kaffeeduft, der dir beim Brühen in die Nase steigt, bis zum fertigen, perfekten Kaffee, der mit süßem Geschmack, guter Fülle und leichter Säure zu deinem neuen Liebling wird.'),(86,301,'J. Hornig La Joya & Handfilter von Hario',26.99,NULL,'139.jpg','Brüh-Set Handfilter','Ein Set für echte Kaffee-Handwerker: Mit dem Hario v60 Glass Dripper holst du das Beste aus deinen Bohnen heraus. Der formschöne Handfilter ist einfach in der Verwendung und leicht zu reinigen. Gepaart mit unserem J. Hornig La Joya aus Costa Rica bietet diese Kombination ein perfektes Pour-Over-Erlebnis. Angefangen beim köstlichen Kaffeeduft, der dir beim Brühen in die Nase steigt, bis zum fertigen, perfekten Kaffee, der mit süßem und tropischem Aroma zu deinem neuen Liebling wird.'),(87,401,'Cappuccinotasse & Untertasse Rot',5.4,NULL,'140.jpg',NULL,'Cappuccinotasse aus weißem, hochwertigem Porzellan mit rotem “J. Hornig”-Logo und farblich abgestimmter Untertasse mit aufgedrucktem Spruch “Das Leben ist schnell genug”.'),(88,401,'Cappuccinotasse & Untertasse Braun',5.4,NULL,'141.jpg',NULL,'Cappuccinotasse aus weißem, hochwertigem Porzellan mit braunem “J. Hornig”-Logo und farblich abgestimmter Untertasse mit aufgedrucktem Spruch “Die dunkle Seite ist schön”.'),(89,401,'Espressotasse & Untertasse Rot',4.32,NULL,'142.jpg',NULL,'Klassische Espressotasse aus weißem, hochwertigem Porzellan mit rotem “J. Hornig”-Logo und farblich abgestimmter Untertasse mit aufgedrucktem Spruch “Nichts ist für die Ewigkeit”.'),(90,401,'Wasserglas',1.8,NULL,'143.jpg',NULL,'Wasserglas mit rotem “J. Hornig”-Logo.'),(91,401,'Caffè-Latte-Glas',3,NULL,'144.jpg',NULL,'Latte-Glas mit weißem “J. Hornig”-Logo.'),(92,401,'Coffee-To-Go Bambus Cup',11.99,NULL,'145.jpg','J. Hornig Coffee-to-Go Bambus Cup','Coffee-to-Go ganz ohne schlechtes Gewissen: Warum du dir den J. Hornig Bambus-Cup kaufen solltest? Der Becher ist wiederverwendbar, sicher verschließbar und darf sogar in den Geschirrspüler. Aber das Beste daran: Du hast deinen Kaffee immer bei dir. Und das macht dich glücklich. Egal wo!'),(93,401,'Coffee to Go Becher Rot 0,3',6,NULL,'146.jpg',NULL,'Roter Coffee-to-Go-Becher (0,3 Liter) mit weißem “J. Hornig”-Logo und Slogan “mit Vergnügen rösten” auf der Vorderseite sowie Spruch “Kaffee schmeckt am besten, wenn man sitzt” auf der Rückseite.'),(94,502,'Kaffeemühle Hario Mini Mill',37.9,NULL,'147.jpg',NULL,'Klein, aber oho: Die Kaffeemühle “Mini Mill” von Hario sieht nicht nur schick aus, sie erledigt ihre Aufgabe auch souverän. Dank dem hochwertigen Keramikmahlwerk lässt sich der Mahlgrad präzise einstellen und stufenlos variieren. Der Auffangbehälter kann ca. 30 Gramm gemahlene Bohnen aufnehmen. Das reicht für mindestens zwei Tassen von deinem Lieblingskaffee.'),(95,502,'AeroPress',26.9,NULL,'148.jpg',NULL,'Ob daheim, im Büro oder unterwegs – mit der AeroPress lassen sich ausgezeichnete Kaffeequalitäten erzielen. Dabei ist sie einfach zu bedienen, leicht zu reinigen und sehr robust. Das Set besteht aus Brühzylinder und Kolben, Rührstab, Portionslöffel, Trichter, Filteraufbewahrer und 350 Micro-Papierfiltern. Alle Kunststoff-Komponenten sind natürlich BPA-frei.'),(96,501,'Wasserkocher Hario v60 Buono (elektrisch)',83.9,NULL,'149.jpg',NULL,'Formschön und praktisch – das ist die elektrische Variante des Hario v60 Buono. Dieser stylische Wasserkocher aus rostfreiem Stahl ermöglicht eine punktgenaue Portionierung. Damit bei der Extraktion deines Lieblingskaffees auch wirklich nichts schief geht.'),(97,501,'Waage Hario Drip Scale',55.9,NULL,'150.jpg',NULL,'Einfach in der Handhabung, dabei aber äußerst präzise und praktisch: Das ist die Hario Drip Scale. Mit dieser formschönen Waage lässt sich nicht nur Gewicht messen, sondern auch die Brühzeit stoppen. Damit die Dreierkombination aus Kaffeemenge, Wasser und Kontaktzeit stimmt – und dein Lieblingskaffee besser schmeckt.'),(98,501,'Khanh',4.6,12.5,'101.jpg','123456','123456');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productline`
--

DROP TABLE IF EXISTS `productline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productline` (
  `IdProductLine` int NOT NULL,
  `NameLine` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdProductLine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productline`
--

LOCK TABLES `productline` WRITE;
/*!40000 ALTER TABLE `productline` DISABLE KEYS */;
INSERT INTO `productline` VALUES (1,'Kaffee'),(2,'Tea'),(3,'Sets'),(4,'Zubehor'),(5,'Zubereitung'),(6,'In-aktion');
/*!40000 ALTER TABLE `productline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserName` varchar(100) NOT NULL,
  `PassWord` varchar(45) DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('admin','123123','0782222595','hue','admin@gmail.com'),('khanh','123123','0782222594','hue','phuockhanh1010@gmail.com'),('khanh1','123123','fdfdsf','fdsfdsfds','dsads@gmd'),('khanh12','123123','0782222595','hue','dsda@gmail.com'),('phong','123123','043432432432','quang binh','phong@gmail.com'),('phong12','123123','07822225843','quang binh','phong@gmail.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-09  9:09:21
