-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Sam 21 Juillet 2018 à 08:00
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
  `keyValue` varchar(100) DEFAULT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `argument`
--

INSERT INTO `argument` (`id`, `name`, `keyValue`, `description`) VALUES
(1, 'Nom', '`#1`', 'Nom de la variable'),
(2, 'Valeur', '`#2`', 'Valeur à affecter à la variable'),
(3, 'Variable', '`#1`', 'Variable à exporter'),
(4, 'Variable', '`#1`', 'Variable stockant les informations saisies'),
(5, 'Texte', '`#2`', 'Texte à afficher lors de la demande de saisie'),
(6, 'Chemin d\'accès', '`#1`', 'Chemin où créer le répertoire'),
(7, 'Source', '`#1`', 'Chemin vers le fichier source'),
(8, 'Destination', '`#2`', 'Chemin vers l\'endroit de copie du fichier source'),
(9, 'Valeur des droits', '`#1`', 'Nombre à 3 chiffre permettant de définir les droits sur  un fichier.'),
(10, 'Processus', '`#1`', 'PID ou Nom du processus'),
(11, 'Options', '`#O`', 'Options de la commande'),
(20, 'New Variable\'s Name', '`#1`', 'The variable\'s name in the program (can be used directly after the assignement)'),
(21, 'Already existing variable\'s name', '`#2`', 'An already existing variable\'s name)'),
(22, 'Default Value', '`#3`', 'A default value in case of an empty existing value'),
(23, 'Function Name', '`#1`', 'The function\'s name'),
(24, 'Function Name', '`#1`', 'The function\'s name'),
(25, 'Function Arguments', '`#2`', 'The function\'s arguments'),
(26, 'Switch Variable', '`#1`', 'The function\'s name'),
(27, 'One Case of Switch', '`#2`', 'The function\'s name'),
(28, 'For Variable', '`#1`', 'The loop variable that will serve as an iterator'),
(29, 'For List', '`#2`', 'The iterable list'),
(30, 'Array Name', '`#1`', 'The array\'s name'),
(31, 'Array values', '`#2`', 'The array\'s values'),
(50, 'cd Options', '`#1`', 'Options of cd command, try \'man cd\' to see them all'),
(51, 'cd Argument', '`#2`', 'An existing path'),
(52, 'ls Options', '`#1`', 'Options of ls command, try \'man ls\' to see them all'),
(53, 'ls Argument', '`#2`', 'An existing file or directory'),
(54, 'touch Options', '`#1`', 'Options of touch command, try \'man touch\' to see them all'),
(55, 'touch Argument', '`#2`', 'A file'),
(56, 'rm Options', '`#1`', 'Options of rm command, try \'man rm\' to see them all'),
(57, 'rm Argument', '`#2`', 'A file or directory'),
(58, 'chmod Options', '`#1`', 'Options of chmod command, try \'man chmod\' to see them all'),
(59, 'chmod Mode', '`#2`', 'A mode representing the rights on the file or directory'),
(60, 'chmod Argument', '`#2`', 'A file or directory'),
(61, 'cut Options', '`#1`', 'Options of cut command, try \'man cut\' to see them all'),
(62, 'cut Argument', '`#2`', 'A file'),
(63, 'sort Options', '`#1`', 'Options of sort command, try \'man sort\' to see them all'),
(64, 'sort Argument', '`#2`', 'A file'),
(65, 'head Options', '`#1`', 'Options of head command, try \'man head\' to see them all'),
(66, 'head Argument', '`#2`', 'A file'),
(67, 'tail Options', '`#1`', 'Options of tail command, try \'man tail\' to see them all'),
(68, 'tail Argument', '`#2`', 'A file'),
(69, 'cat Options', '`#1`', 'Options of cat command, try \'man cat\' to see them all'),
(70, 'cat Argument', '`#2`', 'A file'),
(71, 'find Options', '`#1`', 'Options of find command, try \'man find\' to see them all'),
(72, 'find Argument', '`#2`', 'A file'),
(73, 'grep Options', '`#1`', 'Options of grep command, try \'man grep\' to see them all'),
(74, 'grep Pattern', '`#2`', 'A pattern searched on eached lines of the file(s)'),
(75, 'grep File', '`#2`', 'A file'),
(76, 'sed Options', '`#1`', 'Options of sed command, try \'man sed\' to see them all'),
(77, 'sed Pattern', '`#2`', 'A pattern searched on eached lines of the file(s)'),
(78, 'sed File', '`#2`', 'A file'),
(79, 'touch Options', '`#1`', 'Name of the empty file'),
(80, 'Return value', '`#1`', 'Returned value'),
(81, 'First Operand', '`#1`', 'Something comparable'),
(82, 'Second  Operand', '`#2`', 'Something comparable'),
(83, 'Operator', '`#op`', 'Operator for comparison'),
(84, 'Filename', '`#1`', 'Name of the file'),
(85, 'Code', '`#1`', 'The code you write in');

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
  `description` varchar(255) NOT NULL,
  `type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `block`
--

INSERT INTO `block` (`id`, `name`, `description`, `type`) VALUES
(1, 'AFFECTATION', 'Permet d\'affecter une valeur à une variable', 'SIMPLE'),
(2, 'EXPORTATION', 'Permet l\'exportation d\'une variable', 'SIMPLE'),
(3, 'LECTURE', 'Permet la saisie de données formatées par un utilisateur', 'SIMPLE'),
(4, 'IF', 'Bloc de condition', 'CONTENT-COND|TRUE|FALSE'),
(5, 'ELSE', 'Bloc dans le cas ou  la condition n\'est pas valide (se place seulement après un bloc if)', 'SIMPLE'),
(6, 'WHILE', 'Permet de boucler tant que la condition n\'est pas validée', 'CONTENT-COND|TRUE'),
(7, 'CURRENT WORKING DIRECTORY', 'Permet d\'afficher le répertoire de travail actuel', 'SIMPLE'),
(8, 'CREATE DIRECTORY', 'Permet à l\'utilisateur de créer un répertoire (crée les parents si nécessaire) ', 'SIMPLE'),
(9, 'COPIE', 'Permet de copier un fichier', 'SIMPLE'),
(10, 'DÉPLACER', 'Permet de déplacer (ou renommer (unix)) ou un fichier en fonction de l\'adresse de destination', 'SIMPLE'),
(11, 'RENOMMER (WINDOWS)', 'Permet de renommer un fichier (windows)', 'SIMPLE'),
(12, 'DROITS FICHIER (UNIX)', 'Permet de définir les droits sur un fichier.\nLe pre', 'SIMPLE'),
(13, 'PROCESSUS ', 'Permet d\'afficher les processus', 'SIMPLE'),
(14, 'FINIR PROCESSUS', 'Permet de finir un processus', 'SIMPLE'),
(15, 'TERMINATE PROCESS NAME', 'Terminate a process with its name', 'SIMPLE'),
(20, 'DEFAULT VARIABLE', 'Assigning a variable\'s value or a default value for a new variable', 'SIMPLE'),
(21, 'CREATE FUNCTION', 'Create a function within the program. Make sure to give it a unique name', 'CONTENT'),
(22, 'CALL FUNCTION', 'Call a function with its name and its arguments', 'SIMPLE'),
(23, 'SWITCH CASE', 'Create a switch case with its variable and the different cases', 'CONTENT'),
(24, 'FOR LOOP', 'Create a for loop in a list of objects', 'CONTENT'),
(25, 'DECLARE ARRAY', 'Create an array with or without initialised values', 'SIMPLE'),
(26, 'SHOW ARRAY', 'Create an array with or without initialised values', 'SIMPLE'),
(50, 'CD COMMAND', 'Change the shell working directory', 'SIMPLE'),
(51, 'LS COMMAND', 'List  information  about  the FILEs (the current directory by default)', 'SIMPLE'),
(52, 'TOUCH COMMAND', 'Update the access and modification times of each FILE to the current time', 'SIMPLE'),
(53, 'RM COMMAND', 'Removes each specified file.  By default, it does not remove directories.', 'SIMPLE'),
(54, 'CHMOD COMMAND', 'Changes the file mode bits of each given file according to mode, which can be either a symbolic representation of changes to make, or an octal number representing the bit pattern for the new mode bits.', 'SIMPLE'),
(55, 'CUT COMMAND', 'Print selected parts of lines from each FILE to standard output.', 'SIMPLE'),
(56, 'SORT COMMAND', 'Write sorted concatenation of all FILE(s) to standard output.', 'SIMPLE'),
(57, 'HEAD COMMAND', 'Print the first 10 lines of each FILE to standard output.  With more than one FILE, precede each with a header giving the file name.', 'SIMPLE'),
(58, 'TAIL COMMAND', 'Print the last 10 lines of each FILE to standard output.  With more than one FILE, precede each with a header giving the file name.', 'SIMPLE'),
(59, 'CAT COMMAND', 'Concatenate FILE(s) to standard output.', 'SIMPLE'),
(60, 'FIND COMMAND', 'Search for files in a directory hierarchy.', 'SIMPLE'),
(61, 'GREP COMMAND', 'grep searches for PATTERN in each FILE. If no FILE is given, recursive searches examine the working directory, and nonrecursive searches read standard input.', 'SIMPLE'),
(62, 'SED COMMAND', 'A stream editor used to filer and perform basic text transformations on an input stream (a file or input from a pipeline)', 'SIMPLE'),
(63, 'EMPTY FILE', 'Create an empty file', 'SIMPLE'),
(64, 'RETURN', 'Allows to return a value from a function', 'SIMPLE'),
(65, 'COMPARISON TEST', 'Test: something operator something', 'SIMPLE'),
(66, 'FILE TEST', 'Several test on a file', 'SIMPLE'),
(67, 'FUNCTION TEST', 'Test on the returned value of a function', 'SIMPLE'),
(68, 'CUSTOM', 'Custom block for personnal use (you can write free code inside)', 'SIMPLE'),
(69, 'AND', 'And operator', 'SIMPLE'),
(70, 'OR', 'Or operator', 'SIMPLE'),
(71, 'LOGICAL NOT', 'Logical Not operator (!)', 'SIMPLE'),
(231, 'CASE OF SWITCH', 'a variable\'s value and the blocks within', 'CONTENT');

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
(63, 79, NULL),
(64, 80, NULL),
(65, 81, NULL),
(65, 82, NULL),
(65, 83, NULL),
(66, 83, NULL),
(66, 84, NULL),
(67, 24, NULL),
(67, 25, NULL),
(68, 85, NULL),
(231, 27, NULL),
(15, 10, NULL),
(15, 11, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `block_instruction`
--

CREATE TABLE `block_instruction` (
  `id_block` int(11) NOT NULL,
  `id_instruction` int(11) NOT NULL,
  `pos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `block_instruction`
--

INSERT INTO `block_instruction` (`id_block`, `id_instruction`, `pos`) VALUES
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
(14, 40, 1),
(20, 42, 1),
(21, 43, 1),
(21, 44, 2),
(21, 45, 3),
(22, 46, 1),
(23, 47, 1),
(231, 48, 1),
(231, 49, 2),
(231, 50, 3),
(23, 51, 3),
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
(231, 126, 1),
(231, 127, 2),
(231, 128, 3),
(23, 129, 3),
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
(61, 161, 1),
(64, 164, 1),
(65, 165, 1),
(66, 166, 1),
(67, 167, 1),
(68, 168, 1),
(23, 471, 2),
(23, 1251, 2),
(15, 39, 1),
(15, 41, 1),
(69, 169, 1),
(69, 170, 1),
(70, 171, 1),
(70, 172, 1),
(71, 173, 1),
(71, 174, 1),
(23, 49, 2),
(23, 127, 2);

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
-- Structure de la table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `id_script` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `comment`
--

INSERT INTO `comment` (`id`, `id_script`, `id_user`, `comment`) VALUES
(7, 32, 72, 'Commentaire de test'),
(11, 32, 73, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(12, 32, 73, 'ou hi ou haha'),
(13, 32, 73, 'hahaha'),
(14, 32, 73, 'owow'),
(15, 32, 73, 'fvgbhnj,');

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
(1, 'Affectation', '`#1` = `#2`', 'arguments', 'unix'),
(2, 'Exportation', 'export `#1`', 'arguments', 'unix'),
(3, 'Lecture', 'read `#1`?`#2`', 'arguments', 'unix'),
(4, 'Lecture', '`#1` = Read-Host "`#2`"', 'arguments', 'windows'),
(5, 'If Start', 'if [ ', 'text-only', 'unix'),
(6, 'If Condition', '`#blocs`', 'blocs', 'unix'),
(7, 'If End Condition', ' ] \r\nthen ', 'text-only', 'unix'),
(8, 'If Content', '`#blocs`', 'blocs', 'unix'),
(9, 'Else', 'else\n:', 'text-only', 'unix'),
(10, 'Else Content', '`#blocs`', 'blocs', 'unix'),
(11, 'If End', 'fi', 'text-only', 'unix'),
(12, 'If Start', 'if ', 'text-only', 'windows'),
(13, 'If Condition', '`#blocs`', 'blocs', 'windows'),
(14, 'If End Condition', ' (\r\n', 'text-only', 'windows'),
(15, 'If Content', '`#blocs`\n', 'blocs', 'windows'),
(16, 'If End', ')', 'text-only', 'windows'),
(17, 'Else', 'else (', 'text-only', 'windows'),
(18, 'Else Content', '`#blocs`', 'blocs', 'windows'),
(19, 'End Else', ')', 'text-only', 'windows'),
(20, 'While Start', 'while [ ', 'text-only', 'unix'),
(21, 'While Condition', '`#blocs`', 'blocs', 'unix'),
(22, 'While End Condition', ' ]\r\ndo', 'text-only', 'unix'),
(23, 'While Content', '`#blocs`', 'blocs', 'unix'),
(24, 'While End', 'done', 'text-only', 'unix'),
(25, 'Affectation', 'set `#1` = `#2`', 'arguments', 'windows'),
(26, 'Current Working Directory', 'pwd `#O`', 'arguments', 'unix'),
(27, 'Current Working Directory', 'cd', 'arguments', 'windows'),
(28, 'Create Directory', 'mkdir `#O` `#1`', 'arguments', 'unix'),
(29, 'Create Directory', 'mkdir "`#1`"', 'arguments', 'windows'),
(30, 'Copie', 'cp `#O` `#1` `#2`', 'arguments', 'unix'),
(31, 'Copie', 'copy "`#1`" "`#2`"', 'arguments', 'windows'),
(32, 'Déplacer', 'mv `#O` `#1` `#2`a', 'arguments', 'unix'),
(33, 'Déplacer', 'move "`#1`" "`#2`"', 'arguments', 'windows'),
(34, 'Renommer', 'ren "`#1`" "`#2`"', 'arguments', 'windows'),
(35, 'Umask', 'umask `#1`', 'arguments', 'unix'),
(36, 'Processus', 'ps `#O`', 'text-only', 'unix'),
(37, 'Processus', 'tasklist', 'text-only', 'windows'),
(38, 'Finir Processus', 'kill `#O` `#1`', 'arguments-number', 'unix'),
(39, 'Finir Processus', 'pkill `#O` `#1`', 'arguments-string', 'unix'),
(40, 'Finir Processus', 'taskkill /PID `#1` /F', 'arguments-number', 'windows'),
(41, 'Finir Processus', 'taskkill /IM `#1` /F', 'arguments-string', 'windows'),
(42, 'Default Variable', '`#1`=${`#2`:- `#3`}', 'arguments', 'unix'),
(43, 'Function Start', '`#1`() {', 'arguments', 'unix'),
(44, 'Function Content', '`#blocs`', 'blocs', 'unix'),
(45, 'Function End', '}', 'text-only', 'unix'),
(46, 'Function Call', '`#1` `#2`', 'arguments', 'unix'),
(47, 'Switch Start', 'case `#1` in', 'arguments', 'unix'),
(48, 'Case Start', '`#2`) ', 'arguments', 'unix'),
(49, 'Switch Content', '`#blocs` ', 'blocs', 'unix'),
(50, 'Case End', ';;', 'text-only', 'unix'),
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
(61, 'chmod Command', 'chmod `#1` `#2` `#3`', 'arguments', 'unix'),
(62, 'cut Command', 'cut `#1` `#2`', 'arguments', 'unix'),
(63, 'sort Command', 'sort `#1` `#2`', 'arguments', 'unix'),
(64, 'head Command', 'head `#1` `#2`', 'arguments', 'unix'),
(65, 'tail Command', 'tail `#1` `#2`', 'arguments', 'unix'),
(66, 'cat Command', 'cat `#1` `#2`', 'arguments', 'unix'),
(67, 'find Command', 'find `#1` `#2`', 'arguments', 'unix'),
(68, 'grep Command', 'grep `#1` `#2` `#3`', 'arguments', 'unix'),
(69, 'sed Command', 'sed `#1` `#2` `#3`', 'arguments', 'unix'),
(70, 'Empty File Command', 'touch `#1`', 'arguments', 'unix'),
(120, 'Default Variable', 'IF [%`#2`] == [] (SET `#1`=`#2`) else (SET `#1`=`#3`)', 'arguments', 'windows'),
(121, 'Function Start', ':`#1`', 'arguments', 'windows'),
(122, 'Function Content', '`#blocs`', 'blocs', 'windows'),
(123, 'Function End', 'exit /b', 'text-only', 'windows'),
(124, 'Function Call', 'CALL :`#1` `#2`', 'arguments', 'windows'),
(125, 'Switch Start', 'powershell -Command "& {Switch (`#1`) {', 'arguments', 'windows'),
(126, 'Case Start', '`#2` { ', 'arguments', 'windows'),
(127, 'Switch Content', '`#blocs` ', 'blocs', 'windows'),
(128, 'Case End', '}', 'text-only', 'windows'),
(129, 'Switch End', '}}"', 'text-only', 'windows'),
(130, 'For Start', 'for `#1` in (`#2`) do ( ', 'arguments', 'windows'),
(131, 'For Content', '`#blocs` ', 'blocs', 'windows'),
(132, 'For End', ')', 'text-only', 'windows'),
(133, 'Array declaration', 'set `#1`=`#2`', 'arguments', 'windows'),
(134, 'Array show', 'for %%a in (%`#1`%) do ( echo %%a )', 'arguments', 'windows'),
(150, 'cd Command', 'cd `#1` `#2`', 'arguments', 'windows'),
(151, 'dir Command', 'dir `#1` `#2`', 'arguments', 'windows'),
(153, 'del Command', 'del `#1` `#2`', 'arguments', 'windows'),
(154, 'cacls Command', 'CACLS `#3` `#1` `#2`', 'arguments', 'windows'),
(159, 'type Command', 'type `#1` `#2`', 'arguments', 'windows'),
(160, 'find Command', 'find `#1` `#2`', 'arguments', 'windows'),
(161, 'findstr Command', 'findstr `#1` `#2` `#3`', 'arguments', 'windows'),
(163, 'Empty File Command', 'copy /y nul `#1`', 'arguments', 'windows'),
(164, 'Return', 'return `#1`', 'arguments', 'unix'),
(165, 'Comparison Test', '[ `#1` `#op` `#2` ]', 'arguments', 'unix'),
(166, 'File test', '[ `#op` `#1` ]', 'arguments', 'unix'),
(167, 'Function test', '`#1` `#2`', 'arguments', 'unix'),
(168, 'Code', '`#1`', 'arguments', 'unix'),
(169, 'And', '&&', 'text-only', 'unix'),
(170, 'And', 'AND', 'text-only', 'windows'),
(171, 'Or', '||', 'text-only', 'unix'),
(172, 'Or', 'OR', 'text-only', 'windows'),
(173, 'Not', '!', 'text-only', 'unix'),
(174, 'Not', 'NOT', 'text-only', 'windows'),
(471, 'Case Content', '`#blocs` ', 'blocs', 'unix'),
(1251, 'Case Content', '`#blocs` ', 'blocs', 'windows');

-- --------------------------------------------------------

--
-- Structure de la table `options`
--

CREATE TABLE `options` (
  `id` int(11) NOT NULL,
  `id_argument` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `unix` varchar(255) DEFAULT NULL,
  `windows` varchar(255) DEFAULT NULL,
  `input` int(11) NOT NULL,
  `id_block` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `options`
--

INSERT INTO `options` (`id`, `id_argument`, `name`, `unix`, `windows`, `input`, `id_block`) VALUES
(1, 11, 'parent mode(unix)', '-p', NULL, 1, 8),
(2, 11, 'specify mode(unix)', '-m', NULL, 0, 8),
(3, 11, 'delete target(unix)', '-f', NULL, 0, 9),
(4, 11, 'keep rights(unix)', '-p', NULL, 0, 9),
(5, 11, 'recursive copy(unix)', '-r', NULL, 0, 9),
(6, 11, 'interactive copy(unix)', '-i', NULL, 0, 9),
(7, 11, 'move with backup(unix)', '-b', NULL, 0, 10),
(8, 11, 'force move(unix)', '-f', NULL, 0, 10),
(9, 11, 'interactive move(unix)', '-i', NULL, 0, 10),
(10, 11, 'long display(unix)', '-l', NULL, 0, 13),
(11, 11, 'wide display(unix)', '-w', NULL, 0, 13),
(12, 11, 'user display(unix)', '-u', NULL, 0, 13),
(13, 11, 'specify signal(unix)', '-s', NULL, 1, 14),
(14, 11, 'signal names(unix)', '-l', NULL, 1, 14),
(15, 11, 'silent kill(unix)', '-p', NULL, 1, 14),
(16, 11, 'parent process(unix)', '-p', NULL, 1, 15),
(17, 11, 'exact pattern(unix)', '-f', NULL, 1, 15),
(18, 11, 'real user id', '-u', NULL, 1, 15),
(19, 50, 'cd to script location(windows)', NULL, '/d', 0, 50),
(20, 50, 'change directory and drive(windows)', NULL, '/D', 0, 50),
(21, 50, 'force symbolic(unix)', '-L', NULL, 0, 50),
(22, 50, 'use physical directory(unix)', '-P', NULL, 0, 50),
(23, 52, 'all files(unix)', '-a', NULL, 0, 51),
(24, 52, 'each line(unix)', '-i', NULL, 0, 51),
(25, 52, 'more info(unix)', '-l', NULL, 0, 51),
(26, 52, 'display pause(windows)', NULL, '/P', 0, 51),
(27, 52, 'dense display(windows)', NULL, '/W', 0, 51),
(28, 52, 'display sub-folders(windows)', NULL, '/S', 0, 51),
(29, 54, 'specify date(unix)', '-t', NULL, 1, 52),
(30, 54, 'change modification date(unix)', '-m', NULL, 0, 52),
(31, 54, 'forbid unexisting files(unix)', '-c', NULL, 0, 52),
(32, 56, 'recursive', '-R', '/S', 0, 53),
(33, 56, 'interactive', '-i', '/P', 0, 53),
(34, 58, 'read', 'r', '/G R', 0, 54),
(35, 58, 'write', 'w', '/G W', 0, 54),
(36, 58, 'execution', 'x', '/G F', 0, 54),
(37, 61, 'delimitor', '-d', NULL, 1, 55),
(38, 61, 'fields', '-f', NULL, 1, 55),
(39, 63, 'case unsensitive', '-f', NULL, 0, 56),
(40, 63, 'reverse', '-r', NULL, 0, 56),
(41, 65, 'lines number', '-n', NULL, 1, 57),
(42, 65, 'quiet', '-q', NULL, 0, 57),
(43, 65, 'verbose', '-v', NULL, 0, 57),
(44, 67, 'lines number', '-n', NULL, 0, 58),
(45, 67, 'quiet', '-q', NULL, 0, 58),
(46, 67, 'verbose', '-v', NULL, 0, 58),
(47, 69, 'show line number', '-n', NULL, 0, 59),
(48, 71, 'follow symbolic links', '-follow', NULL, 0, 60),
(49, 71, 'don\'t follow mounted', '-mount', NULL, 0, 60),
(50, 71, 'show line numbers', NULL, '/N', 0, 60),
(51, 71, 'reverse search', NULL, '/V', 0, 60),
(52, 73, 'regex', '-G', '/r', 0, 61),
(53, 73, 'reverse', '-v', '/v', 0, 61),
(54, 73, 'show offset', '-b', '/o', 0, 61),
(55, 76, 'add script', '-e', NULL, 1, 62),
(56, 76, 'quiet', '-n', NULL, 0, 62);

-- --------------------------------------------------------

--
-- Structure de la table `report`
--

CREATE TABLE `report` (
  `id` int(11) NOT NULL,
  `id_script` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `comment` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `report`
--

INSERT INTO `report` (`id`, `id_script`, `id_user`, `comment`) VALUES
(1, 32, 72, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(2, 32, 72, 'haha huhu hoho'),
(3, 32, 72, 'haha huhu hoho'),
(15, 32, 72, 'haha huhu hoho'),
(16, 33, 72, 'haha huhu hoho'),
(17, 33, 72, 'haha huhu hoho'),
(18, 33, 72, NULL),
(19, 33, 72, NULL),
(20, 32, 72, NULL),
(25, 32, 72, 'uvybink,l'),
(26, 32, 72, 'uvybink,l'),
(27, 32, 72, 'ezgfdv'),
(28, 32, 72, 'earzfdvçhu');

-- --------------------------------------------------------

--
-- Structure de la table `script`
--

CREATE TABLE `script` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `category` varchar(255) NOT NULL DEFAULT 'clean',
  `size` int(11) NOT NULL,
  `downloads_count` int(11) NOT NULL DEFAULT '0',
  `date_crea` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_user` int(11) NOT NULL,
  `available` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `script`
--

INSERT INTO `script` (`id`, `name`, `description`, `category`, `size`, `downloads_count`, `date_crea`, `id_user`, `available`) VALUES
(32, 'SUMASHU', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'dangerous', 6, 4, '2018-05-16 14:31:51', 70, 0),
(33, 'bonjour', 'aurevoir', 'clean', 6, 1, '2018-05-16 14:36:56', 70, 1);

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
  `admin` int(11) NOT NULL DEFAULT '0',
  `active` int(11) NOT NULL DEFAULT '0',
  `enabled` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `date_insc`, `admin`, `active`, `enabled`) VALUES
(1, 'bunu', 'bunu@nu.bu', 'bunu', '2018-05-06 13:37:08', 1, 1, 1),
(70, 'aze', 'aze@azr.com', '$2y$10$TjKkx5n9/P.mdfPdaN.pTOkOCfwlt2ndzu0n0QzY3qIimMDRfvNS6', '2018-05-13 19:47:41', 1, 1, 1),
(71, 'aa', 'aa@aa.aa', '$2b$05$pX54H9MyYduqRgsoLrz7RO4olZ3fdJczMyOuWEo8sIYBKptXu5TJW', '2018-07-06 10:04:25', 0, 1, 1),
(72, 'test', 'test@test.test', '$2b$05$p.qqERj1AIylm5NHBhlcrOObg8cvdiq6186H8IyEEi.pJu3qP9oQO', '2018-07-06 10:10:26', 0, 1, 1),
(73, 'admin', 'admin@admin.admin', '$2b$05$xUmTqkaFps.yqj2otlaUBufGuoJyiVc4/Js3tpJXpmM.20j3u0bAe', '2018-07-06 10:11:55', 1, 1, 1),
(74, 'l ;', 'admin@admin.lk;:', '$2b$05$n75A.s0bUjFIDxTHV9BOb.FsuVuvP9tg1JKDfUyqw7hquGHmv8htm', '2018-07-20 16:45:23', 0, 1, 1);

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
  ADD KEY `id_block` (`id_block`);

--
-- Index pour la table `code_block`
--
ALTER TABLE `code_block`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_block` (`id_block`);

--
-- Index pour la table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_script_2` (`id_script`),
  ADD KEY `id_user_2` (`id_user`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_script` (`id_script`);

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
-- Index pour la table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_argument` (`id_argument`),
  ADD KEY `id_block` (`id_block`);

--
-- Index pour la table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_script` (`id_script`),
  ADD KEY `id_user` (`id_user`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;
--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `block`
--
ALTER TABLE `block`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=232;
--
-- AUTO_INCREMENT pour la table `code_block`
--
ALTER TABLE `code_block`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT pour la table `conditions`
--
ALTER TABLE `conditions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `instruction`
--
ALTER TABLE `instruction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1252;
--
-- AUTO_INCREMENT pour la table `options`
--
ALTER TABLE `options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT pour la table `report`
--
ALTER TABLE `report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT pour la table `script`
--
ALTER TABLE `script`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;
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
  ADD CONSTRAINT `id_block_in_block_instruction` FOREIGN KEY (`id_block`) REFERENCES `block` (`id`),
  ADD CONSTRAINT `id_instruction_block` FOREIGN KEY (`id_instruction`) REFERENCES `instruction` (`id`);

--
-- Contraintes pour la table `code_block`
--
ALTER TABLE `code_block`
  ADD CONSTRAINT `id_block` FOREIGN KEY (`id_block`) REFERENCES `block` (`id`);

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `script_comment` FOREIGN KEY (`id_script`) REFERENCES `script` (`id`),
  ADD CONSTRAINT `user_comment` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `options`
--
ALTER TABLE `options`
  ADD CONSTRAINT `argument_options` FOREIGN KEY (`id_argument`) REFERENCES `argument` (`id`),
  ADD CONSTRAINT `block_options` FOREIGN KEY (`id_block`) REFERENCES `block` (`id`);

--
-- Contraintes pour la table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `script_report` FOREIGN KEY (`id_script`) REFERENCES `script` (`id`),
  ADD CONSTRAINT `user_report` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `script`
--
ALTER TABLE `script`
  ADD CONSTRAINT `script_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
