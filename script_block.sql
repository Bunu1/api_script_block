-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Sam 09 Juin 2018 à 14:30
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `script_block`
--

-- --------------------------------------------------------

--
-- Structure de la table `argument`
--

CREATE TABLE `argument` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(100) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `argument`
--

INSERT INTO `argument` (`id`, `name`, `value`, `type`, `description`) VALUES
(1, 'Nom', '#1', NULL, 'Nom de la variable'),
(2, 'Valeur', '#2', NULL, 'Valeur à affecter à la variable'),
(3, 'Variable', '#1', NULL, 'Variable à exporter'),
(4, 'Variable', '#1', NULL, 'Variable stockant les informations saisies'),
(5, 'Texte', '#2', NULL, 'Texte à afficher lors de la demande de saisie'),
(6, 'Chemin d\'accès', '#1', NULL, 'Chemin où créer le répertoire'),
(7, 'Source', '#1', NULL, 'Chemin vers le fichier source'),
(8, 'Destination', '#2', NULL, 'Chemin vers l\'endroit de copie du fichier source'),
(9, 'Valeur des droits', '#1', NULL, 'Nombre à 3 chiffre permettant de définir les droits sur  un fichier.'),
(10, 'Processus', '#1', NULL, 'PID ou Nom du processus'),
(11, 'Options', '#O', NULL, 'Options de la commande'),
(20, 'New Variable\'s Name', '`#1`', NULL, 'The variable\'s name in the program (can be used directly after the assignement)'),
(21, 'Already existing variable\'s name', '`#2`', NULL, 'An already existing variable\'s name)'),
(22, 'Default Value', '`#3`', NULL, 'A default value in case of an empty existing value'),
(23, 'Function Name', '`#1`', NULL, 'The function\'s name'),
(24, 'Function Name', '`#1`', NULL, 'The function\'s name'),
(25, 'Function Arguments', '`#2`', NULL, 'The function\'s arguments'),
(26, 'Switch Variable', '`#1`', NULL, 'The function\'s name'),
(27, 'One Case of Switch', '`#2`', NULL, 'The function\'s name'),
(28, 'For Variable', '`#1`', NULL, 'The loop variable that will serve as an iterator'),
(29, 'For List', '`#2`', NULL, 'The iterable list'),
(30, 'Array Name', '`#1`', NULL, 'The array\'s name'),
(31, 'Array values', '`#2`', NULL, 'The array\'s values'),
(50, 'cd Options', '`#1`', NULL, 'Options of cd command, try \'man cd\' to see them all'),
(51, 'cd Argument', '`#2`', NULL, 'An existing path'),
(52, 'ls Options', '`#1`', NULL, 'Options of ls command, try \'man ls\' to see them all'),
(53, 'ls Argument', '`#2`', NULL, 'An existing file or directory'),
(54, 'touch Options', '`#1`', NULL, 'Options of touch command, try \'man touch\' to see them all'),
(55, 'touch Argument', '`#2`', NULL, 'A file'),
(56, 'rm Options', '`#1`', NULL, 'Options of rm command, try \'man rm\' to see them all'),
(57, 'rm Argument', '`#2`', NULL, 'A file or directory'),
(58, 'chmod Options', '`#1`', NULL, 'Options of chmod command, try \'man chmod\' to see them all'),
(59, 'chmod Mode', '`#2`', NULL, 'A mode representing the rights on the file or directory'),
(60, 'chmod Argument', '`#2`', NULL, 'A file or directory'),
(61, 'cut Options', '`#1`', NULL, 'Options of cut command, try \'man cut\' to see them all'),
(62, 'cut Argument', '`#2`', NULL, 'A file'),
(63, 'sort Options', '`#1`', NULL, 'Options of sort command, try \'man sort\' to see them all'),
(64, 'sort Argument', '`#2`', NULL, 'A file'),
(65, 'head Options', '`#1`', NULL, 'Options of head command, try \'man head\' to see them all'),
(66, 'head Argument', '`#2`', NULL, 'A file'),
(67, 'tail Options', '`#1`', NULL, 'Options of tail command, try \'man tail\' to see them all'),
(68, 'tail Argument', '`#2`', NULL, 'A file'),
(69, 'cat Options', '`#1`', NULL, 'Options of cat command, try \'man cat\' to see them all'),
(70, 'cat Argument', '`#2`', NULL, 'A file'),
(71, 'find Options', '`#1`', NULL, 'Options of find command, try \'man find\' to see them all'),
(72, 'find Argument', '`#2`', NULL, 'A file'),
(73, 'grep Options', '`#1`', NULL, 'Options of grep command, try \'man grep\' to see them all'),
(74, 'grep Pattern', '`#2`', NULL, 'A pattern searched on eached lines of the file(s)'),
(75, 'grep File', '`#2`', NULL, 'A file'),
(76, 'sed Options', '`#1`', NULL, 'Options of sed command, try \'man sed\' to see them all'),
(77, 'sed Pattern', '`#2`', NULL, 'A pattern searched on eached lines of the file(s)'),
(78, 'sed File', '`#2`', NULL, 'A file'),
(79, 'touch Options', '`#1`', NULL, 'Name of the empty file');

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `available` int(11) NOT NULL DEFAULT '1',
  `date_add` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `article`
--

INSERT INTO `article` (`id`, `subject`, `content`, `available`, `date_add`, `id_user`) VALUES
(4, 'Join the Blockers !', 'Scrip::Blocks has taken off, download the app now to join the Blockers in this Scripting journey! We are really happy that so many people contribute to this project and we are eager to see what this comunity will build with our app, for any feedback, questions or small talk with our team go on our twitter accounts !', 1, '2018-05-06 14:37:48', 1),
(5, 'The Blocks Rocket is soon taking off!', 'Prepare yourself for a revolution in the way you were scripting before !', 1, '2018-05-06 14:37:48', 1);

-- --------------------------------------------------------

--
-- Structure de la table `block`
--

CREATE TABLE `block` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `block`
--

INSERT INTO `block` (`id`, `name`, `description`) VALUES
(1, 'Affectation', 'Permet d\'affecter une valeur à une variable'),
(2, 'Exportation', 'Permet l\'exportation d\'une variable'),
(3, 'Lecture', 'Permet la saisie de données formatées par un utilisateur'),
(4, 'If', 'Bloc de condition'),
(5, 'Else', 'Bloc dans le cas ou  la condition n\'est pas valide (se place seulement après un bloc if)'),
(6, 'While', 'Permet de boucler tant que la condition n\'est pas validée'),
(7, 'Current Working Directory', 'Permet d\'afficher le répertoire de travail actuel'),
(8, 'Create directory', 'Permet à l\'utilisateur de créer un répertoire (crée les parents si nécessaire) '),
(9, 'Copie', 'Permet de copier un fichier'),
(10, 'Déplacer', 'Permet de déplacer (ou renommer (unix)) ou un fichier en fonction de l\'adresse de destination'),
(11, 'Renommer (Windows)', 'Permet de renommer un fichier (windows)'),
(12, 'Droits Fichier (Unix)', 'Permet de définir les droits sur un fichier.\nLe pre'),
(13, 'Processus ', 'Permet d\'afficher les processus'),
(14, 'Finir Processus', 'Permet de finir un processus'),
(20, 'Default Variable', 'Assigning a variable\'s value or a default value for a new variable'),
(21, 'Create Function', 'Create a function within the program. Make sure to give it a unique name'),
(22, 'Call Function', 'Call a function with its name and its arguments'),
(23, 'Switch Case', 'Create a switch case with its variable and the different cases'),
(24, 'For loop', 'Create a for loop in a list of objects'),
(25, 'Declare Array', 'Create an array with or without initialised values'),
(26, 'Show Array', 'Create an array with or without initialised values'),
(50, 'cd Command', 'Change the shell working directory'),
(51, 'ls Command', 'List  information  about  the FILEs (the current directory by default)'),
(52, 'touch Command', 'Update the access and modification times of each FILE to the current time'),
(53, 'rm Command', 'Removes each specified file.  By default, it does not remove directories.'),
(54, 'chmod Command', 'Changes the file mode bits of each given file according to mode, which can be either a symbolic representation of changes to make, or an octal number representing the bit pattern for the new mode bits.'),
(55, 'cut Command', 'Print selected parts of lines from each FILE to standard output.'),
(56, 'sort Command', 'Write sorted concatenation of all FILE(s) to standard output.'),
(57, 'head Command', 'Print the first 10 lines of each FILE to standard output.  With more than one FILE, precede each with a header giving the file name.'),
(58, 'tail Command', 'Print the last 10 lines of each FILE to standard output.  With more than one FILE, precede each with a header giving the file name.'),
(59, 'cat Command', 'Concatenate FILE(s) to standard output.'),
(60, 'find Command', 'Search for files in a directory hierarchy.'),
(61, 'grep Command', 'grep searches for PATTERN in each FILE. If no FILE is given, recursive searches examine the working directory, and nonrecursive searches read standard input.'),
(62, 'sed Command', 'A stream editor used to filer and perform basic text transformations on an input stream (a file or input from a pipeline)'),
(63, 'Empty file', 'Create an empty file');

-- --------------------------------------------------------

--
-- Structure de la table `block_argument`
--

CREATE TABLE `block_argument` (
  `id_block` int(11) NOT NULL,
  `id_argument` int(11) NOT NULL,
  `pre_option` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `block_argument`
--

INSERT INTO `block_argument` (`id_block`, `id_argument`, `pre_option`) VALUES
(1, 1, ''),
(1, 2, ''),
(2, 3, NULL),
(3, 4, NULL),
(3, 5, NULL),
(8, 6, NULL),
(9, 7, NULL),
(9, 8, NULL),
(10, 7, NULL),
(10, 8, NULL),
(11, 7, NULL),
(11, 8, NULL),
(12, 9, NULL),
(14, 10, NULL),
(7, 11, NULL),
(8, 11, NULL),
(9, 11, NULL),
(10, 11, NULL),
(11, 11, NULL),
(13, 11, NULL),
(9, 11, NULL),
(10, 11, NULL),
(11, 11, NULL),
(13, 11, NULL),
(14, 11, NULL),
(20, 20, NULL),
(20, 21, NULL),
(20, 22, NULL),
(21, 23, NULL),
(22, 24, NULL),
(22, 25, NULL),
(23, 26, NULL),
(23, 27, NULL),
(24, 28, NULL),
(24, 29, NULL),
(25, 30, NULL),
(25, 31, NULL),
(26, 30, NULL),
(50, 50, NULL),
(50, 51, NULL),
(51, 52, NULL),
(51, 53, NULL),
(52, 54, NULL),
(52, 55, NULL),
(53, 56, NULL),
(53, 57, NULL),
(54, 58, NULL),
(54, 59, NULL),
(54, 60, NULL),
(55, 61, NULL),
(55, 62, NULL),
(56, 63, NULL),
(56, 64, NULL),
(57, 65, NULL),
(57, 66, NULL),
(58, 67, NULL),
(58, 68, NULL),
(59, 69, NULL),
(59, 70, NULL),
(60, 71, NULL),
(60, 72, NULL),
(61, 73, NULL),
(61, 74, NULL),
(61, 75, NULL),
(62, 76, NULL),
(62, 77, NULL),
(62, 78, NULL),
(63, 79, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `block_instruction`
--

CREATE TABLE `block_instruction` (
  `id_code_block` int(11) NOT NULL,
  `id_instruction` int(11) NOT NULL,
  `pos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `block_instruction`
--

INSERT INTO `block_instruction` (`id_code_block`, `id_instruction`, `pos`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(3, 4, 1),
(4, 5, 1),
(4, 6, 2),
(4, 7, 3),
(4, 8, 4),
(4, 9, 5),
(4, 10, 6),
(4, 11, 7),
(4, 12, 1),
(4, 13, 2),
(4, 14, 3),
(4, 15, 4),
(4, 16, 5),
(4, 17, 6),
(4, 18, 7),
(4, 19, 8),
(1, 25, 1),
(7, 26, 1),
(7, 27, 1),
(8, 28, 1),
(8, 29, 1),
(9, 30, 1),
(9, 31, 1),
(10, 32, 1),
(10, 33, 1),
(11, 34, 1),
(12, 35, 1),
(13, 36, 1),
(13, 37, 1),
(14, 38, 1),
(14, 39, 1),
(14, 40, 1),
(14, 41, 1),
(20, 42, 1),
(21, 43, 1),
(21, 44, 2),
(21, 45, 3),
(22, 46, 1),
(23, 47, 1),
(23, 48, 2),
(23, 49, 3),
(23, 50, 4),
(23, 51, 5),
(24, 52, 1),
(24, 53, 2),
(24, 54, 3),
(25, 55, 1),
(26, 56, 1),
(50, 57, 1),
(51, 58, 1),
(52, 59, 1),
(53, 60, 1),
(54, 61, 1),
(55, 62, 1),
(56, 63, 1),
(57, 64, 1),
(58, 65, 1),
(59, 66, 1),
(60, 67, 1),
(61, 68, 1),
(62, 69, 1),
(63, 70, 1),
(20, 120, 1),
(21, 121, 1),
(21, 122, 2),
(21, 123, 3),
(22, 124, 1),
(23, 125, 1),
(23, 126, 2),
(23, 127, 3),
(23, 128, 4),
(23, 123, 5),
(24, 130, 1),
(24, 131, 2),
(24, 132, 3),
(25, 133, 1),
(26, 134, 1),
(50, 150, 1),
(51, 151, 1),
(63, 163, 1),
(53, 153, 1),
(54, 154, 1),
(59, 159, 1),
(60, 160, 1),
(61, 161, 1);

-- --------------------------------------------------------

--
-- Structure de la table `code_block`
--

CREATE TABLE `code_block` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `platform` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `id_block` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `code_block`
--

INSERT INTO `code_block` (`id`, `name`, `platform`, `description`, `id_block`) VALUES
(1, 'cb_Affectation', 'Unix', 'Block permettant l\'affectation d\'une valeur à une variable', 1),
(2, 'cb_Exportation', 'Unix', 'Permet l\'exportation d\'une variable', 2),
(3, 'cb_Lecture', 'Unix', 'Permet la saisie de données formatées', 3),
(4, 'cb_Lecture', 'Windows', 'Permet la saisie de données formatées', 3);

-- --------------------------------------------------------

--
-- Structure de la table `conditions`
--

CREATE TABLE `conditions` (
  `id` int(11) NOT NULL,
  `display` varchar(10) NOT NULL,
  `unix` varchar(10) NOT NULL,
  `windows` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `instruction`
--

CREATE TABLE `instruction` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `syntax` text NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `platform` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `instruction`
--

INSERT INTO `instruction` (`id`, `name`, `syntax`, `type`, `platform`) VALUES
(1, 'Affectation', '#1 = #2', 'arguments', 'unix'),
(2, 'Exportation', 'export #1', 'arguments', 'unix'),
(3, 'Lecture', 'read #1?#2', 'arguments', 'unix'),
(4, 'Lecture', '#1 = Read-Host "#2"', 'arguments', 'windows'),
(5, 'If Start', 'if [ ', 'text-only', 'unix'),
(6, 'If Condition', '#blocs', 'blocs', 'unix'),
(7, 'If End Condition', ' ] \r\nthen ', 'text-only', 'unix'),
(8, 'If Content', '#blocs', 'blocs', 'unix'),
(9, 'Else', 'else', 'text-only', 'unix'),
(10, 'Else Content', '#blocs', 'blocs', 'unix'),
(11, 'If End', 'fi', 'text-only', 'unix'),
(12, 'If Start', 'if ', 'text-only', 'windows'),
(13, 'If Condition', '#blocs', 'blocs', 'windows'),
(14, 'If End Condition', ' (\r\n', 'text-only', 'windows'),
(15, 'If Content', '#blocs\r\n', 'blocs', 'windows'),
(16, 'If End', ')', 'text-only', 'windows'),
(17, 'Else', 'else (', 'text-only', 'windows'),
(18, 'Else Content', '#blocs', 'blocs', 'windows'),
(19, 'End Else', ')', 'text-only', 'windows'),
(20, 'While Start', 'while [ ', 'text-only', 'unix'),
(21, 'While Condition', '#blocs', 'blocs', 'unix'),
(22, 'While End Condition', ' ]\r\ndo', 'text-only', 'unix'),
(23, 'While Content', '#blocs', 'blocs', 'unix'),
(24, 'While End', 'done', 'text-only', 'unix'),
(25, 'Affectation', 'set #1 = #2', 'arguments', 'windows'),
(26, 'Current Working Directory', 'pwd #O', 'arguments', 'unix'),
(27, 'Current Working Directory', 'cd', 'arguments', 'windows'),
(28, 'Create Directory', 'mkdir #O #1', 'arguments', 'unix'),
(29, 'Create Directory', 'mkdir "#1"', 'arguments', 'windows'),
(30, 'Copie', 'cp #O #1 #2', 'arguments', 'unix'),
(31, 'Copie', 'copy "#1" "#2', 'arguments', 'windows'),
(32, 'Déplacer', 'mv #O #1 #2a', 'arguments', 'unix'),
(33, 'Déplacer', 'move "#1" "#2"', 'arguments', 'windows'),
(34, 'Renommer', 'ren "#1" "#2"', 'arguments', 'windows'),
(35, 'Umask', 'umask #1', 'arguments', 'unix'),
(36, 'Processus', 'ps #O', 'text-only', 'unix'),
(37, 'Processus', 'tasklist', 'text-only', 'windows'),
(38, 'Finir Processus', 'kill #O #1', 'arguments-number', 'unix'),
(39, 'Finir Processus', 'pkill #O #1', 'arguments-string', 'unix'),
(40, 'Finir Processus', 'taskkill /PID #1 /F', 'arguments-number', 'windows'),
(41, 'Finir Processus', 'taskkill /IM #1 /F', 'arguments-string', 'windows'),
(42, 'Default Variable', '`#1`=${`#2`:- `#3`}', 'arguments', 'unix'),
(43, 'Function Start', '`#1`() {', 'arguments', 'unix'),
(44, 'Function Content', '`#blocs`', 'blocs', 'unix'),
(45, 'Function End', '}', 'text-only', 'unix'),
(46, 'Function Call', '`#1` `#2`', 'arguments', 'unix'),
(47, 'Switch Start', 'case `#1` in', 'arguments', 'unix'),
(48, 'Case Start', '`#2`) ', 'arguments-loopstart', 'unix'),
(49, 'Switch Content', '`#blocs` ', 'blocs', 'unix'),
(50, 'Case End', ';;', 'text-only-loopend', 'unix'),
(51, 'Switch End', 'esac', 'text-only', 'unix'),
(52, 'For Start', 'for `#1` in `#2` do', 'arguments', 'unix'),
(53, 'For Content', '`#blocs` ', 'blocs', 'unix'),
(54, 'For End', 'done', 'text-only', 'unix'),
(55, 'Array declaration', 'declare -a `#1`=(`#2`)', 'arguments', 'unix'),
(56, 'Array show', 'echo ${`#1`[*]}', 'arguments', 'unix'),
(57, 'cd Command', 'cd `#1` `#2`', 'arguments', 'unix'),
(58, 'ls Command', 'ls `#1` `#2`', 'arguments', 'unix'),
(59, 'touch Command', 'touch `#1` `#2`', 'arguments', 'unix'),
(60, 'rm Command', 'rm `#1` `#2`', 'arguments', 'unix'),
(61, 'rm Command', 'chmod `#1` `#2` `#3`', 'arguments', 'unix'),
(62, 'cut Command', 'cut `#1` `#2`', 'arguments', 'unix'),
(63, 'sort Command', 'sort `#1` `#2`', 'arguments', 'unix'),
(64, 'head Command', 'head `#1` `#2`', 'arguments', 'unix'),
(65, 'tail Command', 'tail `#1` `#2`', 'arguments', 'unix'),
(66, 'cat Command', 'cat `#1` `#2`', 'arguments', 'unix'),
(67, 'find Command', 'find `#1` `#2`', 'arguments', 'unix'),
(68, 'grep Command', 'grep `#1` `#2` `#3`', 'arguments', 'unix'),
(69, 'sed Command', 'sed `#1` `#2` `#3`', 'arguments', 'unix'),
(70, 'Empty File Command', 'touch `#1`', 'arguments', 'unix'),
(120, 'Default Variable', 'IF [%`#2`] == [] (SET `#1`=`#2`) else (SET `#1`=`#3`)', 'arguments', 'batch'),
(121, 'Function Start', ':`#1`', 'arguments', 'batch'),
(122, 'Function Content', '`#blocs`', 'blocs', 'batch'),
(123, 'Function End', 'exit /b', 'text-only', 'batch'),
(124, 'Function Call', 'CALL :`#1` `#2`', 'arguments', 'batch'),
(125, 'Switch Start', 'powershell -Command "& {Switch (`#1`) {', 'arguments', 'batch'),
(126, 'Case Start', '`#2` { ', 'arguments-loopstart', 'batch'),
(127, 'Switch Content', '`#blocs` ', 'blocs', 'batch'),
(128, 'Case End', '}', 'text-only-loopend', 'batch'),
(129, 'Switch End', '}}"', 'text-only', 'batch'),
(130, 'For Start', 'for `#1` `#` in (`#2`) do ( ', 'arguments', 'batch'),
(131, 'For Content', '`#blocs` ', 'blocs', 'batch'),
(132, 'For End', ')', 'text-only', 'batch'),
(133, 'Array declaration', 'set `#1`=`#2`', 'arguments', 'batch'),
(134, 'Array show', 'for %%a in (%`#1`%) do ( echo %%a )', 'arguments', 'batch'),
(150, 'cd Command', 'cd `#1` `#2`', 'arguments', 'batch'),
(151, 'dir Command', 'dir `#1` `#2`', 'arguments', 'batch'),
(153, 'del Command', 'del `#1` `#2`', 'arguments', 'batch'),
(154, 'cacls Command', 'CACLS `#3` `#1` `#2`', 'arguments', 'batch'),
(159, 'type Command', 'type `#1` `#2`', 'arguments', 'batch'),
(160, 'find Command', 'find `#1` `#2`', 'arguments', 'batch'),
(161, 'findstr Command', 'findstr `#1` `#2` `#3`', 'arguments', 'batch'),
(163, 'Empty File Command', 'copy /y nul `#1`', 'arguments', 'batch');

-- --------------------------------------------------------

--
-- Structure de la table `script`
--

CREATE TABLE `script` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL DEFAULT 'clean',
  `size` int(11) NOT NULL,
  `downloads_count` int(11) NOT NULL DEFAULT '0',
  `date_crea` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_user` int(11) NOT NULL,
  `report` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `script`
--

INSERT INTO `script` (`id`, `name`, `description`, `category`, `size`, `downloads_count`, `date_crea`, `id_user`, `report`) VALUES
(32, 'SUMASHU', 'AHUMEDO', 'clean', 6, 0, '2018-05-16 14:31:51', 70, 0),
(33, 'bonjour', 'aurevoir', 'clean', 6, 0, '2018-05-16 14:36:56', 70, 0);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date_insc` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rank` int(11) NOT NULL DEFAULT '0',
  `active` int(11) NOT NULL DEFAULT '0',
  `enabled` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `date_insc`, `rank`, `active`, `enabled`) VALUES
(1, 'bunu', 'bunu@nu.bu', 'bunu', '2018-05-06 13:37:08', 1, 1, 1),
(70, 'aze', 'aze@azr.com', '$2y$10$TjKkx5n9/P.mdfPdaN.pTOkOCfwlt2ndzu0n0QzY3qIimMDRfvNS6', '2018-05-13 19:47:41', 1, 1, 1);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `argument`
--
ALTER TABLE `argument`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `block`
--
ALTER TABLE `block`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `block_argument`
--
ALTER TABLE `block_argument`
  ADD KEY `id_arg` (`id_argument`),
  ADD KEY `id_block_arg` (`id_block`);

--
-- Index pour la table `block_instruction`
--
ALTER TABLE `block_instruction`
  ADD KEY `id_instruction_block` (`id_instruction`),
  ADD KEY `id_block_instruction` (`id_code_block`);

--
-- Index pour la table `code_block`
--
ALTER TABLE `code_block`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_block` (`id_block`);

--
-- Index pour la table `conditions`
--
ALTER TABLE `conditions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `instruction`
--
ALTER TABLE `instruction`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `script`
--
ALTER TABLE `script`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `argument`
--
ALTER TABLE `argument`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;
--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `block`
--
ALTER TABLE `block`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;
--
-- AUTO_INCREMENT pour la table `code_block`
--
ALTER TABLE `code_block`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `conditions`
--
ALTER TABLE `conditions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `instruction`
--
ALTER TABLE `instruction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;
--
-- AUTO_INCREMENT pour la table `script`
--
ALTER TABLE `script`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `block_argument`
--
ALTER TABLE `block_argument`
  ADD CONSTRAINT `id_arg` FOREIGN KEY (`id_argument`) REFERENCES `argument` (`id`),
  ADD CONSTRAINT `id_block_arg` FOREIGN KEY (`id_block`) REFERENCES `block` (`id`);

--
-- Contraintes pour la table `block_instruction`
--
ALTER TABLE `block_instruction`
  ADD CONSTRAINT `id_block_instruction` FOREIGN KEY (`id_code_block`) REFERENCES `block` (`id`),
  ADD CONSTRAINT `id_instruction_block` FOREIGN KEY (`id_instruction`) REFERENCES `instruction` (`id`);

--
-- Contraintes pour la table `code_block`
--
ALTER TABLE `code_block`
  ADD CONSTRAINT `id_block` FOREIGN KEY (`id_block`) REFERENCES `block` (`id`);

--
-- Contraintes pour la table `script`
--
ALTER TABLE `script`
  ADD CONSTRAINT `script_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
