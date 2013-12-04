<?php

	class Model_Cart
	{


		function selectedBullIds()
		{
			$ids = array();
			if ($_SESSION['cart']['items']) foreach ($_SESSION['cart']['items'] as $item) 
				if ($item['type'] == 'bull') $ids[] = $item['data']['id'];
			return $ids;
		}

		function selectedProductIds()
		{
			$ids = array();
			if ($_SESSION['cart']['items']) foreach ($_SESSION['cart']['items'] as $item) 
				if ($item['type'] == 'product') $ids[] = $item['data']['id'];
			return $ids;
		}


	}
