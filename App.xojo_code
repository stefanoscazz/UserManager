#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  Dim dbFile as FolderItem
		  DB = new SQLiteDatabase
		  dbFile = GetFolderItem ("").Parent.Child("userManager.sqlite")
		  ' SpecialFolder.ApplicationData.Child("userManager.sqlite")
		  
		  
		  if dbFile.Exists then // verifica se il datatbase esiste nella cartella di windows
		    DB.DatabaseFile = dbFile  // assegnare il file alla proprieta db
		    if  DB.Connect then  
		      PopolateLstUtenti
		      
		    End
		  End
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub PopolateLstUtenti()
		  // Riempie lstUtenti
		  
		  dim rs as RowSet = db.SelectSQL("SELECT  *  FROM  utenti") 
		  If  rs <> Nil and Not rs.AfterLastRow Then
		    FrmPrincipale.lstUtenti.RemoveAllRows 
		    For Each r as DatabaseRow in rs
		      FrmPrincipale.lstutenti.AddRow rs.Column("Id").StringValue,rs.Column("nome").StringValue , _
		      rs.Column("Cognome").StringValue,rs.Column("Cap").StringValue,rs.Column("Via").StringValue,rs.Column("DataDiNascita").StringValue,rs.Column("Email").StringValue
		    Next
		  End
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		DB As SQLiteDatabase
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
