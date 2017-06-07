use File::Copy qw(move);
$flag = 0;
$ye = $ARGV[0];											#contains year
$mo = $ARGV[1];											#contains month
$day =$ARGV[2];											#contains date
$s = $ARGV[3];											#contains original address
opendir (Dir, "./$ye/$mo") or die "Could'nt open directory,$!" ;
	while ($file = readdir Dir)
	{
		if($file eq $day)								#checks if folder for that date exists
		{
			$d="./$ye/$mo/$day";							#contains address of the new folder created
			if($s ne (("date.pl") || ("year.pl") || ("month.pl") || ("sort.pl")))	#if condition to prevent moving of .pl files
			{
				move("$s","$d");						#moves photograph to the folder with the correct date
			}
			$flag=1;
		}
	
	}
	if($flag == 0)
	{
		mkdir("./$ye/$mo/$day") or die "Could'nt make dir $day,$!" ; 			#creates the folder with that date if it does not exist
		$d="./$ye/$mo/$day";								
		if($s ne (("date.pl") || ("year.pl") || ("month.pl") || ("sort.pl")))
		{
			move("$s","$d");
		}
	}
closedir Dir;
