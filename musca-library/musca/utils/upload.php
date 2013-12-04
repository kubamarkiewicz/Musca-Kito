<?php	

	/**
	 * modified 2013.07.25
	 */

	class Musca_Utils_Upload
	{

		static function uniqueFilename($archive_dir , $filename , $file_prefix='')
		{
			$filename = strtolower($filename);
			$extension= substr( strrchr($filename, ".") ,1);
			$name=str_replace(".".$extension,'',$filename);

			$string_tmp = '';
			for ($i=0; $i<strlen($name); $i++)
			{
				$char = ord(substr($name,$i,1));
				if (($char>=48 && $char<=57) || ($char>=97 && $char<=122)) $string_tmp.=chr($char);
				else $string_tmp.='_';
			}
			$destination=$file_prefix.$string_tmp.".".$extension;

			while (file_exists($archive_dir."/".$destination)) $destination=$file_prefix.$string_tmp."_".rand(0,10000).".".$extension;

			return ($destination);
		}







		/**
		 * Move uploaded file
		 *
		 * @param string $fieldName - form field name
		 * @param string $dir - destination directory
		 * @param string $arrayIndex - index of the file in file array
		 *
		 * @return string - destination file name
		 */
		static function uploadFile($fieldName, $dir, $arrayIndex = null) 
		{
			if (is_null($arrayIndex))
			{
				$file = $_FILES[$fieldName];
			}
			else
			{
				$file = array();
				$file['name'] = $_FILES[$fieldName]['name'][$arrayIndex];
				$file['type'] = $_FILES[$fieldName]['type'][$arrayIndex];
				$file['tmp_name'] = $_FILES[$fieldName]['tmp_name'][$arrayIndex];
				$file['error'] = $_FILES[$fieldName]['error'][$arrayIndex];
				$file['size'] = $_FILES[$fieldName]['size'][$arrayIndex];
			}
			// print_r($file); exit;

			/* check if file is uploaded */
			if ($file['error']==4) return false;
			if ($file['error']==2) throw new Exception('File upload error: maximum file size ('.self::sizeHumRead(self::maxUpload()).') exeeded.');
			elseif ($file['error']) throw new Exception('File upload error: error '.$file['error']);
				
			/* move file */
			if (!file_exists($dir)) mkdir($dir);
			@chmod($dir, 0777);
			$filename = self::uniqueFilename($dir, $file['name']);	
			if (!move_uploaded_file($file['tmp_name'], $dir.'/'.$filename))
				throw new Exception('File upload error: can not move uploaded file');
			chmod($dir.'/'.$filename, 0777);

			return $filename;
		}





		/**
		 * Move uploaded image
		 *
		 * @param string $fieldName - form field name
		 * @param string $dir - destination directory
		 * @param integer $width - destination image width
		 * @param integer $height - destination image height
		 * @param boolean $crop - use smartCrop or smartResize
		 *
		 * @return string - destination file name
		 */
		static function uploadImage($fieldName, $dir, $width=false, $height=false, $crop=false) 
		{
			$filename = self::uploadFile($fieldName, $dir);
				
			if (!$filename) return false;

			/* resize|crop image */	
			$filename = Musca_Utils::imageResize($dir.'/'.$filename, $width, $height, null, $crop);
			if (!$filename) throw new Exception('Error: image resize failed.');

			return basename($filename);
		}




		/**
		 * @return string - max upload file size in Bytes
		 */
		static function maxUpload($humanReadable = false) 
		{
			$size = substr(ini_get('upload_max_filesize'), 0, -1) * 1024 * 1024;
			if ($humanReadable) return self::sizeHumRead($size);
			else return $size;
		}




		/**
		 * Returns a human readable size
		 *
		 * @param integer $size in Bytes
		 * @return string
		 */
		static function sizeHumRead ($size) 
		{
			$i=0;
			$iec = array("B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB");
			while (($size / 1024) > 1) 
			{
				$size = $size / 1024;
				$i++;
			}
			return round($size, 0).' '.$iec[$i];
		}


	}
