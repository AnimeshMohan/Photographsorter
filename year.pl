use IPC::System::Simple qw(system capture);
$flag = 0 ;
$ye  = $ARGV[0] ;							#contains year
$mo  = $ARGV[1] ;							#contains month
$day = $ARGV[2] ;							#contains date
opendir (Unsortedpics, '.') or die "Couldn't open directory, $!";
while ($file = readdir Unsortedpics) 
{
	  if ( $file eq $ye)						#checks if folder for that year exists
  	{
		system($^X, "month.pl",@ARGV);				#calls month.pl
		$flag = 1 ; 
	}
}
if ($flag == 0)								
{
	mkdir( "./$ye" ) or die "Could'nt create Directory $ye, $!"; 	#creating folder of that year
	system($^X, "month.pl",@ARGV);					#calls month.pl
}
closedir Unsortedpics;
