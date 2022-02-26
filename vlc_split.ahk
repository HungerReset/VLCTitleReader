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
	SongTitle := StrSplit(Song, " - ")[2]
	Authors := StrSplit(Song, " - ")[1]
	if (SongTitle != PrevTitle) 
	{
		ChangeFile(SongTitle, "title.txt")
		ChangeFile(Authors, "authors.txt")
	}
}