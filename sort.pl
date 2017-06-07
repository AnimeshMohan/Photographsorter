use IPC::System::Simple qw(system capture);
opendir (Dir,'.') or die "Could'nt open directory,$!";
$count =0;
while ($file = readdir Dir)
{   	$count++;
	if($file =~ /JPG/)						#checks if file i JPG
	{
		$da= `identify -format %[EXIF:DateTime] $file`;	        #timeprint of photo stored in $da 
		($y,$t) = split(/ /,$da) ;				#splits and stores the date in $y and the time in $t
		($ye,$mo,$day) = split(/:/,$y) ;			#splits the date into years,months and date
		system($^X,"year.pl","$ye","$mo","$day","$file"); 	#calls year.pl
		print("$count");   					#prints the no of images sorted
	}
}

