' Send a SIGNL4 alert via VBA (e.g. for the PcVue Scripting Engine)

Dim httpRequest
Set httpRequest = CreateObject("MSXML2.ServerXMLHTTP.6.0")

Dim url, data

' SIGNL4 webhook URL including team or integration secret
url = "https://connect.signl4.com/webhook/{team-secret}"
data = "{""title"":""Alert from VBA"", ""message"":""Test.""}"

httpRequest.Open "POST", url, False
httpRequest.setRequestHeader "Content-Type", "application/json"
httpRequest.send data

If httpRequest.Status = 200 Then
    MsgBox "Request successful: " & httpRequest.responseText
Else
    MsgBox "Error: " & httpRequest.Status
End If

Set httpRequest = Nothing
