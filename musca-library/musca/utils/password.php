<?php

	class Musca_Utils_Password
	{

		function __construct()
		{

		}
		
		function str_key($minlength=5, $maxlength=7, $useupper=true, $usespecial=false, $usenumbers=true)
		{
            $key = '';
			$charset = "abcdefghijklmnopqrstuvwxyz";
			if ($useupper) $charset .= "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
			if ($usenumbers) $charset .= "0123456789";
			if ($usespecial) $charset .= "~@#$%^*()_+-={}|]["; // Note: using all special characters this reads: "~!@#$%^&*()_+`-={}|\\]?[\":;'><,./";
			if ($minlength > $maxlength) $length = mt_rand ($maxlength, $minlength);
			else $length = mt_rand ($minlength, $maxlength);
			for ($i=0; $i<$length; $i++) $key .= $charset[(mt_rand(0,(strlen($charset)-1)))];
			return $key;
		}

		function str_funny()
		{
			$arAdjective = array('Angry', 'Atrocious', 'Attractive', 'Bad', 'Barbarious', 'Beautiful', 'Black', 'Blond', 'Blue', 'Bright', 'Brown', 'Cool', 'Cruel', 'Cubic', 'Cute', 'Dance', 'Dark', 'Dinky', 'Drunk', 'Dumb', 'Electro', 'Elite', 'Fast', 'Flying', 'Fourios', 'Frustraded', 'Funny', 'Furious', 'Giant', 'Giga', 'Green', 'Handsome', 'Hard', 'Harsh', 'Hiphop', 'Holy', 'Horny', 'Hot', 'House', 'Lame', 'Leaking', 'Lone', 'Lovely', 'Lucky', 'Micro', 'Mighty', 'Mini', 'Nice', 'Orange', 'Pretty', 'Red', 'Sexy', 'Slow', 'Smooth', 'Stinky', 'Strong', 'Super', 'Unholy', 'White', 'Wild', 'Yellow', 'Alien', 'Bavarian', 'Crazy', 'Death', 'Drunken', 'Fat', 'Hazardous','Holy', 'Infested', 'Insane', 'Mutated', 'Nasty', 'Purple', 'Radioactive', 'Ugly', 'Green');
			$arAnimal = array('Abe', 'Bee', 'Bird', 'Boy', 'Cat', 'Cow', 'Crow', 'Dad', 'Deer', 'Dog', 'Donkey', 'Duck', 'Eagle', 'Elephant', 'Fly', 'Fox', 'Frog', 'Girl', 'Girlie', 'Hasi', 'Hawk', 'Jackal', 'Lizard', 'Mouse', 'Mule', 'Pig', 'Rabbit', 'Rat', 'Rhino', 'Smurf', 'Snail', 'Snake', 'Star', 'Tiger', 'Wolf', 'Butterfly', 'Godzilla', 'Horse', 'Penguin', 'Pony', 'Reindeer', 'Sheep', 'Worm');

			$adjective = $arAdjective[rand(0, count($arAdjective)-1)];
			$animal = $arAnimal[rand(0, count($arAnimal)-1)];
			return strtolower($adjective.'.'.$animal);
		}

		function str_captcha($length=7)
		{
			$pattern = "123456789ABCDEFG";
			$key='';
			for($i=0;$i<$length;$i++) $key .= $pattern{rand(0,15)};
			return $key;
		}

	}
