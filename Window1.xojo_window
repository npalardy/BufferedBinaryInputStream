#tag Window
Begin Window Window1
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   Composite       =   False
   DefaultLocation =   0
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   True
   HasMinimizeButton=   True
   Height          =   400
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   154210303
   MenuBarVisible  =   True
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   True
   Title           =   "Untitled"
   Type            =   0
   Visible         =   True
   Width           =   600
   Begin PushButton PushButton1
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Run Unit Tests"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   152
   End
   Begin TextArea TextArea1
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   True
      AllowStyledText =   True
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF00
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      Height          =   328
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Multiline       =   True
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   52
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   1
      ValidationMask  =   ""
      Visible         =   True
      Width           =   560
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub RunUnitTests()
		  Dim f As folderitem = GetFolderItem("testfile.txt")
		  
		  Dim bis As BufferedBinaryInputStream = BufferedBinaryInputStream.Open(f,False, 10)
		  
		  TextArea1.appendtext "Begin Forward byte by byte" + EndOfLine
		  For i As Integer = 0 To bis.Length - 1
		    
		    Dim ui8 As UInt8 = bis.ReadUInt8
		    
		    TextArea1.appendtext ChrB(ui8)
		    
		  Next
		  TextArea1.appendtext EndOfLine + " End Forward byte by byte" + EndOfLine
		  
		  
		  TextArea1.appendtext "Begin BACKWARD byte by byte" + EndOfLine
		  
		  For i As Integer = bis.Length - 1 DownTo 0
		    bis.position = i
		    
		    Dim ui8 As UInt8 = bis.ReadUInt8
		    Dim ch As String = ChrB(ui8)
		    TextArea1.appendtext ChrB(ui8)
		    
		  Next
		  TextArea1.appendtext EndOfLine + "End BACKWARD byte by byte" + EndOfLine
		  
		  bis.position = 0
		  While bis.EOF <> True
		    
		    Dim ui8 As UInt8 = bis.ReadUInt8
		    
		  Wend
		  
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  RunUnitTests
		  
		End Sub
	#tag EndEvent
#tag EndEvents
