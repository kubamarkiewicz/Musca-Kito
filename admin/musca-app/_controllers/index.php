<?php

	class Index extends App_Controller
	{
		function first()
		{
			$this->output();
		}


		function about()
		{
			$this->output('about.tpl');
		}
	}
