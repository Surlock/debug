Dim xRg As Range
'Update by Extendoffice 2018/3/7
Private Sub Worksheet_Change_2(ByVal Target As Range)
    On Error Resume Next
    If Target.Cells.Count > 1 Then Exit Sub
  Set xRg = Intersect(Range("Q2:Q70"), Target)
    If xRg Is Nothing Then Exit Sub
    If Target.Value = "Granted" Then
        Call Mail_small_Text_Outlook
    End If
End Sub
Sub Mail_small_Text_Outlook()
    Dim xOutApp As Object
    Dim xOutMail As Object
    Dim xMailBody As String
    Set xOutApp = CreateObject("Outlook.Application")
    Set xOutMail = xOutApp.CreateItem(0)
    xMailBody = "Hi there" & vbNewLine & vbNewLine & _
              "This is line 1" & vbNewLine & _
              "This is line 2"
    On Error Resume Next
    With xOutMail
        .To = "lasi.systems@abs.gov.au"
        .CC = ""
        .BCC = ""
        .Subject = "send by cell value test"
        .Body = xMailBody
        .Display   'or use .Send
    End With
    On Error GoTo 0
    Set xOutMail = Nothing
    Set xOutApp = Nothing
End Sub

Private Sub Worksheet_SelectionChange(ByVal Target As Range)
 
End Sub


