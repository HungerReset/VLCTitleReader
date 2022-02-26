#NoEnv
#SingleInstance Force

SetTitleMatchMode 2

ChangeFile(Contents, FileName)
{
	FileDelete %FileName%
	FileAppend, %Contents%, %FileName%
}

Loop
{
	PrevTitle := SongTitle
	WinGetTitle, Song, VLC
	SongTitle := StrSplit(Song, " - VLC")[1]
	if (SongTitle != PrevTitle) 
	{
		ChangeFile(SongTitle, "song.txt")
	}
}