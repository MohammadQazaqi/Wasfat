-- SQL Script to Insert Data into Existing Table `apprecipes` with Auto-Increment Id

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- Inserting data into table `apprecipes` without specifying Id (auto-increment)

INSERT INTO `apprecipes` (`Name`, `Description`) VALUES
('Falafel', 'Falafel is a popular Middle Eastern dish made from ground chickpeas or fava beans (or a combination of both) that are mixed with herbs, spices, and onions, then shaped into small balls or patties and deep-fried to crispy perfection. Known for its golden-brown crust and soft, flavorful interior, falafel is often served in pita bread or flatbreads, accompanied by fresh vegetables like tomatoes, cucumbers, and lettuce, and topped with tahini sauce or hummus. It is enjoyed as a vegetarian option and is a staple in Mediterranean cuisine.'),
('Hummus', 'Hummus is a smooth and creamy Middle Eastern dip made from blended chickpeas, tahini (sesame seed paste), olive oil, lemon juice, garlic, and salt. This savory spread has a rich, nutty flavor with a hint of tanginess from the lemon and a touch of garlic. Hummus is traditionally served as a dip with pita bread or fresh vegetables but is also used as a spread in wraps, sandwiches, and salads. It\'s a healthy, plant-based option packed with protein, fiber, and healthy fats, making it a staple in Mediterranean and Middle Eastern cuisine.'),
('Mansaf', 'Mansaf is a traditional Jordanian dish and a symbol of Jordanian hospitality, often served on special occasions. It consists of tender lamb cooked in a rich, tangy sauce made from fermented dried yogurt called \"jameed.\" The lamb is served over a large platter of rice, sometimes layered with thin flatbread, and generously topped with the jameed sauce. Mansaf is often garnished with toasted almonds or pine nuts and parsley for extra flavor and texture. Traditionally, it\'s eaten communally, with the right hand, making it not only a hearty meal but also a cultural experience.'),
('Shawarma', 'Thinly sliced meat, usually lamb, chicken, or beef, seasoned and roasted on a vertical rotisserie, served in flatbread with garlic sauce, pickles, and vegetables.'),
('Kibbeh', 'A popular Levantine dish made of bulgur, minced onions, and finely ground beef, lamb, or goat, often served fried or baked.'),
('Tabbouleh', 'A refreshing Levantine salad made from finely chopped parsley, tomatoes, mint, onion, bulgur, and seasoned with olive oil, lemon juice, and salt.'),
('Mutabal', 'A smoky and creamy dip made from roasted eggplant, tahini, garlic, lemon juice, and olive oil, often served with flatbread.'),
('Maqluba', 'A traditional Palestinian dish made with layers of fried vegetables, rice, and meat, often flipped upside down before serving.'),
('Kunafa', 'A popular dessert made with thin noodle-like pastry soaked in syrup, layered with cheese or cream, and often topped with crushed pistachios.'),
('Warak Enab', 'Grape leaves stuffed with a mixture of rice, meat, and spices, then cooked until tender. Often served with a side of yogurt.'),
('Galayet Bandora', 'A simple yet flavorful Jordanian dish made with sautéed tomatoes, garlic, and olive oil, often served with bread or rice.'),
('Musakhan', 'A famous Jordanian dish consisting of roasted chicken seasoned with sumac, onions, and spices, served on flatbread with pine nuts.'),
('Kousa Mahshi', 'Zucchini stuffed with a mixture of rice, meat, and spices, then simmered in a tomato-based sauce, popular across Jordan and the Levant.');

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
