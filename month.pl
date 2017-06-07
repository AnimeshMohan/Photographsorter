use IPC::System::Simple qw(system capture);
$flag = 0 ;
$ye = $ARGV[0];
$mo = $ARGV[1] ;
opendir (Unsortedpics, "./$ye") or die "Couldn't open directory, $!";
        while ($file = readdir Unsortedpics) {
                if ($file eq $mo)						#checks if folder for that month exists
                {
                        system($^X,"date.pl",@ARGV);				#calls date.pl	
			$flag = 1 ;
                }
              
        }
	if($flag == 0)
	{
		mkdir("./$ye/$mo") or die "Could'nt create dir $mo,$!" ;	#creates a folder for that month if it does not exist 
		system($^X,"date.pl",@ARGV);					#calls date.pl
	}
closedir Unsortedpics;


