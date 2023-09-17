VERSION 5.00
Begin VB.Form frmCheckDigiSign 
   Caption         =   "Digital signature checker"
   ClientHeight    =   6588
   ClientLeft      =   120
   ClientTop       =   468
   ClientWidth     =   9252
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.4
      Charset         =   204
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmCheckDigiSign.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   ScaleHeight     =   6588
   ScaleWidth      =   9252
   Begin VB.Frame fraMode 
      Caption         =   "Mode (for experts)"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   7.8
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3252
      Left            =   5400
      TabIndex        =   17
      Top             =   2640
      Width           =   3732
      Begin VB.CheckBox chkSkipCheckSameCatalogue 
         Caption         =   "Skip files of already verified security catalogs"
         Height          =   492
         Left            =   120
         TabIndex        =   24
         Top             =   2520
         Width           =   3492
      End
      Begin VB.CheckBox chkPreferEmbedded 
         Caption         =   "Prefer embedded signature"
         Height          =   252
         Left            =   120
         TabIndex        =   23
         Top             =   1440
         Value           =   1  'Checked
         Width           =   3492
      End
      Begin VB.CheckBox chkNoSizeLimit 
         Caption         =   "No file size limit"
         Height          =   204
         Left            =   120
         TabIndex        =   22
         Top             =   1100
         Value           =   1  'Checked
         Width           =   3492
      End
      Begin VB.CheckBox chkAllowExpired 
         Caption         =   "Allow expired"
         Height          =   252
         Left            =   120
         TabIndex        =   21
         Top             =   720
         Value           =   1  'Checked
         Width           =   3492
      End
      Begin VB.CheckBox chkDisableCatalogue 
         Caption         =   "Disable verify by catalog"
         Height          =   204
         Left            =   120
         TabIndex        =   20
         Top             =   1800
         Width           =   3492
      End
      Begin VB.CheckBox chkRevocation 
         Caption         =   "Check for revocation (internet required)"
         Height          =   444
         Left            =   120
         TabIndex        =   19
         Top             =   240
         Width           =   3492
      End
      Begin VB.CheckBox chkPrecacheAllCatalogues 
         Caption         =   "Precache tags of all catalogs"
         Height          =   204
         Left            =   120
         TabIndex        =   18
         Top             =   2160
         Value           =   1  'Checked
         Width           =   3492
      End
   End
   Begin VB.CommandButton cmdClear 
      Caption         =   "Clear list"
      Height          =   492
      Left            =   7320
      TabIndex        =   16
      Top             =   1800
      Width           =   1815
   End
   Begin VB.CommandButton cmdSelectFolder 
      Caption         =   "Add folder(s) ..."
      Height          =   492
      Left            =   7320
      TabIndex        =   15
      Top             =   1200
      Width           =   1815
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   492
      Left            =   2400
      TabIndex        =   14
      Top             =   6000
      Width           =   1452
   End
   Begin VB.CommandButton cmdSelectFile 
      Caption         =   "Add file(s) ..."
      Height          =   492
      Left            =   7320
      TabIndex        =   13
      Top             =   600
      Width           =   1815
   End
   Begin VB.Frame fraReportFormat 
      Caption         =   "Report format:"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   7.8
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1572
      Left            =   240
      TabIndex        =   8
      Top             =   4320
      Width           =   5052
      Begin VB.OptionButton OptCSV 
         Caption         =   "CSV (Full log in ANSI)"
         Height          =   432
         Left            =   120
         TabIndex        =   10
         Top             =   840
         Value           =   -1  'True
         Width           =   2895
      End
      Begin VB.OptionButton optPlainText 
         Caption         =   "Plain Text (Short log in Unicode)"
         Height          =   492
         Left            =   120
         TabIndex        =   9
         Top             =   240
         Width           =   3495
      End
   End
   Begin VB.Frame fraFilter 
      Caption         =   "Filter"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   7.8
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1572
      Left            =   240
      TabIndex        =   4
      Top             =   2640
      Width           =   5055
      Begin VB.CheckBox chkPeExe 
         Caption         =   "PE EXE"
         Height          =   204
         Left            =   4080
         TabIndex        =   25
         Top             =   520
         Width           =   852
      End
      Begin VB.OptionButton OptExtension 
         Caption         =   "by extension"
         Height          =   255
         Left            =   120
         TabIndex        =   12
         Top             =   480
         Value           =   -1  'True
         Width           =   2052
      End
      Begin VB.OptionButton OptAllFiles 
         Caption         =   "All Files"
         Height          =   255
         Left            =   120
         TabIndex        =   11
         Top             =   240
         Width           =   2052
      End
      Begin VB.CheckBox chkIncludeSys 
         Caption         =   "Include files in Windows\System32 (SysWOW64) folder"
         Height          =   255
         Left            =   120
         TabIndex        =   7
         Top             =   1200
         Width           =   4812
      End
      Begin VB.CheckBox chkRecur 
         Caption         =   "Recursively (include subfolders)"
         Height          =   255
         Left            =   120
         TabIndex        =   6
         Top             =   840
         Value           =   1  'Checked
         Width           =   4815
      End
      Begin VB.TextBox txtExtensions 
         Height          =   285
         Left            =   2280
         TabIndex        =   5
         Text            =   "exe;dll;sys"
         Top             =   480
         Width           =   1572
      End
   End
   Begin VB.CommandButton cmdGo 
      Caption         =   "Go"
      Height          =   480
      Left            =   480
      TabIndex        =   2
      Top             =   6000
      Width           =   1575
   End
   Begin VB.TextBox txtPaths 
      Height          =   2055
      Left            =   240
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   0
      Top             =   600
      Width           =   6972
   End
   Begin VB.Label lblStatus 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "1 / 1 - File - (in folder)"
      ForeColor       =   &H0000FFFF&
      Height          =   192
      Left            =   4680
      TabIndex        =   3
      Top             =   6200
      Visible         =   0   'False
      Width           =   4452
   End
   Begin VB.Shape shpFore 
      BackColor       =   &H00C00000&
      BackStyle       =   1  'Opaque
      Height          =   372
      Left            =   4320
      Top             =   6120
      Visible         =   0   'False
      Width           =   252
   End
   Begin VB.Shape shpBack 
      BackColor       =   &H00000080&
      BackStyle       =   1  'Opaque
      Height          =   372
      Left            =   4320
      Top             =   6120
      Visible         =   0   'False
      Width           =   4812
   End
   Begin VB.Label lblThisTool 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "This tool will create a detail report about digital signature of files/folders you specify below:"
      Height          =   192
      Left            =   240
      TabIndex        =   1
      Top             =   200
      Width           =   8832
      WordWrap        =   -1  'True
   End
End
Attribute VB_Name = "frmCheckDigiSign"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'[frmCheckDigiSign.frm]

'
' Digital Signature checker by Alex Dragokas
'

Option Explicit

Private Declare Function DeleteFileW Lib "kernel32.dll" (ByVal lpFileName As Long) As Long
Private Declare Function SfcIsFileProtected Lib "Sfc.dll" (ByVal RpcHandle As Long, ByVal ProtFileName As Long) As Long
Private Declare Function SetWindowTheme Lib "UxTheme.dll" (ByVal hwnd As Long, ByVal pszSubAppName As Long, ByVal pszSubIdList As Long) As Long

Private Const CERT_E_UNTRUSTEDROOT          As Long = &H800B0109
Private Const TRUST_E_NOSIGNATURE           As Long = &H800B0100
Private Const CRYPT_E_BAD_MSG               As Long = &H8009200D

Dim isRan As Boolean

Private Sub cmdGo_Click()
    On Error GoTo ErrorHandler:

    Dim sPathes         As String
    Dim aPathes()       As String
    Dim vPath, vKey
    Dim bRecursively    As Boolean
    Dim bListSystemPath As Boolean
    Dim bIncludePeExe   As Boolean
    Dim ReportPath      As String
    Dim arrTmp()        As String
    Dim i               As Long
    Dim SignResult      As SignResult_TYPE
    Dim LastSignResult  As SignResult_TYPE
    Dim hFile           As Long
    Dim sFile           As String
    Dim pos             As Long
    Dim bCSV            As Boolean
    Dim bPlainText      As Boolean
    Dim oDictFiles      As Object
    Dim OriginPath      As String
    Dim SFCFiles()      As String
    Dim hResult         As Long
    Dim sExtensions     As String
    Dim sb              As clsStringBuilder
    
    Static isInit       As Boolean
    Static oDictSFC     As Object
    
    'Add date certificate added to store (look at CERT_DATE_STAMP_PROP_ID flag of CertGetCertificateContextProperty)
    
    If isRan Then Exit Sub
    
    Set oDictFiles = New clsTrickHashTable
    Set oDictSFC = New clsTrickHashTable
    oDictFiles.CompareMode = vbTextCompare
    oDictSFC.CompareMode = vbTextCompare
    
    'Get options
    bRecursively = (chkRecur.Value = 1)
    bListSystemPath = (chkIncludeSys.Value = 1)     'System32 / SysWow64
    bCSV = OptCSV.Value                             'CSV (in ANSI)
    bPlainText = optPlainText.Value                 'Plain (in Unicode)
    bIncludePeExe = (chkPeExe.Value = vbChecked)    'Portable Executable (include in filter)
    
    sPathes = txtPaths.Text
    
    If Len(sPathes) = 0 And Not bListSystemPath Then
        'You should enter at least one path to file or folder!
        MsgBoxW Translate(1859), vbExclamation
        Exit Sub
    End If
    
    sPathes = Replace$(sPathes, vbCr, vbNullString)
    aPathes = Split(sPathes, vbLf)
    
    ReportPath = BuildPath(App.Path(), "DigiSign") & IIf(bCSV, ".csv", ".log")
    
    If FileExists(ReportPath) Then Call DeleteFileW(StrPtr(ReportPath))
    
    'Searching files / folders
    'Enumerating files. Please wait...
    lblStatus.ForeColor = vbBlack
    lblStatus.Caption = Translate(1867)
    lblStatus.Visible = True
    DoEvents
    
    txtPaths.Enabled = False
    
    'normalize extensions string (allowing * and . )
    sExtensions = txtExtensions.Text
    If Len(sExtensions) > 0 Then
        sExtensions = Replace$(sExtensions, "*", vbNullString)
        arrTmp = SplitSafe(sExtensions, ";")
        For i = 0 To UBound(arrTmp)
            If Left$(arrTmp(i), 1) <> "." Then arrTmp(i) = "." & arrTmp(i)
        Next
        sExtensions = Join(arrTmp, ";")
    End If
    
    For Each vPath In aPathes
        vPath = Trim$(vPath)
        If Left$(vPath, 1) = """" Then
            pos = InStr(2, vPath, """")
            If pos <> 0 Then
                vPath = mid$(vPath, 2, pos - 2)
            Else
                vPath = mid$(vPath, 2)
            End If
        End If
        vPath = Replace$(vPath, "\\", "\")
        If mid$(vPath, 2, 1) <> ":" Then
            'try to remove some remnants from beginning of line
            pos = InStr(vPath, ":\")
            If pos > 1 Then
                vPath = mid$(vPath, pos - 1)
            End If
        End If
        
        If FileExists(CStr(vPath)) Then
            If Not oDictFiles.Exists(vPath) Then oDictFiles.Add vPath, 0
        ElseIf FolderExists(CStr(vPath)) Then
            arrTmp = ListFiles(CStr(vPath), IIf(OptAllFiles.Value, vbNullString, sExtensions), bRecursively, bIncludePeExe)
            CopyArrayToDictionary arrTmp, oDictFiles
            DoEvents
        Else
            If InStr(vPath, " ") <> 0 Then  'dirty path? - contain arguments? - Try to remove.
                vPath = Left$(vPath, InStr(vPath, " ") - 1)
            ElseIf InStr(vPath, "/") <> 0 Then
                OriginPath = vPath
                vPath = RTrim$(Left$(vPath, InStr(vPath, "/") - 1))     'res://C:\PROGRA~1\MICROS~3\Office15\EXCEL.EXE/3000
            End If

            If FileExists(CStr(vPath)) Then
                If Not oDictFiles.Exists(vPath) Then oDictFiles.Add vPath, 0
            Else
                If InStr(OriginPath, "/") <> 0 Then
                    vPath = Replace$(OriginPath, "/", "\")      'path altered by / chars instead of \
                    vPath = Replace$(vPath, "\\", "\")
                            
                    If FileExists(CStr(vPath)) Then
                        If Not oDictFiles.Exists(vPath) Then oDictFiles.Add vPath, 0
                    End If
                End If
            End If
        End If
    Next
    
    If bListSystemPath Then
        'default - .exe;.dll;.sys
        arrTmp = ListFiles(sWinDir, IIf(OptAllFiles.Value, vbNullString, sExtensions), bRecursively)
        DoEvents
        CopyArrayToDictionary arrTmp, oDictFiles
    End If
    
    lblStatus.ForeColor = vbYellow
    lblStatus.Caption = vbNullString
    lblStatus.Visible = False
    
    ' Checking digital signature
    
    'No files found.
    If oDictFiles.Count = 0 Then
        MsgBoxW Translate(1860)
        txtPaths.Enabled = True
        Exit Sub
    End If
    
    'Abort
    cmdExit.Caption = Translate(1861)
    
    Dim bWHQL As Boolean
    Dim bWPF As Boolean
    Dim bIsDriver As Boolean
    Dim aLogLine() As String
    Dim sLogLine As String
    Dim bData() As Byte
    Dim bPE_File As Boolean
    Dim AddFlags As Long
    
    Set sb = New clsStringBuilder
    
    If chkRevocation.Value = vbChecked Then
        AddFlags = AddFlags Or SV_CheckRevocation
    End If
    If chkAllowExpired.Value = vbChecked Then
        AddFlags = AddFlags Or SV_AllowExpired
    End If
    If chkNoSizeLimit.Value = vbChecked Then
        AddFlags = AddFlags Or SV_NoFileSizeLimit
    End If
    If chkPreferEmbedded.Value = vbChecked Then
        AddFlags = AddFlags Or SV_PreferInternalSign
    End If
    If chkDisableCatalogue.Value = vbChecked Then
        AddFlags = AddFlags Or SV_DisableCatalogVerify
    End If
    If chkSkipCheckSameCatalogue.Value <> vbChecked Then
        AddFlags = AddFlags Or SV_DisableCatCache
    End If
    
    AddFlags = AddFlags Or SV_CheckEmbeddedPresence
    
    If (OSver.IsWindows8OrGreater) Then
        AddFlags = AddFlags Or SV_DisableOutdatedAlgo
    End If
    
    If oDictFiles.Count > 1000 Then
    
        If chkPrecacheAllCatalogues.Value = vbChecked Then
            AddFlags = AddFlags Or SV_EnableAllTagsPrecache
        End If
        
        DoEvents
        'Precaching security catalogues ...
        lblStatus.ForeColor = vbBlack
        lblStatus.Visible = True
        lblStatus.Caption = Translate(1871)
        Me.Refresh
        SignVerify vbNullString, SV_EnableAllTagsPrecache, SignResult
        lblStatus.ForeColor = vbYellow
    End If
    
    DoEvents
    SetForegroundWindow Me.hwnd
    
    lblStatus.Caption = vbNullString
    lblStatus.Visible = True
    shpBack.Visible = True
    
    If Not isInit Then
        isInit = True
        If bIsWinVistaAndNewer Then
            SFCFiles = SFCList_Vista()
        Else
            SFCFiles = SFCList_XP()
        End If
        For i = 0 To UBound(SFCFiles)
            If Not oDictSFC.Exists(SFCFiles(i)) Then oDictSFC.Add SFCFiles(i), 0
        Next
    End If
    
    shpFore.Visible = True
    
    isRan = True
    cmdGo.Enabled = False
    
    ErrReport = vbNullString
    
    i = 0
    For Each vKey In oDictFiles.Keys
        
        sFile = vKey
        DoEvents
        
        '��������� ���������� ������ ���������
        If isRan = False Then
            CloseW hFile, True
            cmdGo.Enabled = True
            lblStatus.Caption = vbNullString
            lblStatus.Visible = False
            shpBack.Visible = False
            shpFore.Visible = False
            txtPaths.Enabled = True
            Exit Sub
        End If
        bIsDriver = False
        bWHQL = False
        
        'ProgressBar
        lblStatus = (i + 1) & " / " & oDictFiles.Count & " - " & GetFileNameAndExt(sFile) & " - " & GetPathName(sFile)
        If i Mod 10 = 0 Then
            shpFore.Width = CLng((shpBack.Width / oDictFiles.Count) * i)
        End If
        
        bWPF = oDictSFC.Exists(sFile)
        If Not bWPF Then bWPF = SfcIsFileProtected(0&, StrPtr(sFile))
        
        bPE_File = isPE(sFile)
        
        'If bPE_File Then
            If StrComp(GetExtensionName(sFile), ".sys", 1) = 0 Then
                
                bIsDriver = True
                
                'Signature of driver can consist of both:
                ' - signature in catalogue (3-d party + MS)
                ' - internal signature (3-d party + MS or just single MS even for 3rd part driver)
                
                'So to check for WHQL and for legit 3d-party signature, you need to:
                '1) check by catalogue first by passing SV_isDriver flag, so SignVerify will use DRIVER_ACTION_VERIFY provider and return result in .IsWHQL,
                '   if found legit Microsoft signature
                '2) check 3d-party signature with forcing WINTRUST_ACTION_GENERIC_VERIFY_V2 policy because in case driver has no corresponding
                '   Microsoft signature, WinVerifyTrust + DRIVER_ACTION_VERIFY will return CERT_E_UNTRUSTEDROOT

                'However, we don't want explicitly check by catalog here, giving ability user to select desired settings from menu
                Call SignVerify(sFile, SV_isDriver Or AddFlags, SignResult)
                bWHQL = SignResult.isWHQL
                
                'For some reason "termdd.sys" has broken internal signature in XP
                If SignResult.ReturnCode = CRYPT_E_BAD_MSG Then
                    Call SignVerify(sFile, (SV_isDriver Or AddFlags Or SV_CacheDoNotLoad) And Not SV_PreferInternalSign, SignResult)
                'Some drivers signed with own timestamp root server can throw CERT_E_UNTRUSTEDROOT
                'Also, some drivers have additional self-signed signature (example: klgse.sys)
                ElseIf SignResult.ReturnCode = CERT_E_UNTRUSTEDROOT Then
                    Call SignVerify(sFile, (SV_isDriver Or AddFlags Or SV_CacheDoNotLoad) And Not SV_PreferInternalSign, SignResult)
                End If
                If SignResult.isWHQL Then bWHQL = True
            Else
                SignVerify sFile, AddFlags, SignResult
            End If
        'End If
        
        With SignResult
            If Not bCSV Then
                sb.AppendLine _
                    IIf(bPE_File, vbNullString, "[not PE File] ") & _
                    IIf(bIsDriver, IIf(bWHQL, "[OK] ", vbNullString), IIf(.isLegit, "[OK] ", vbNullString)) & _
                    IIf(.ShortMessage = "TRUST_E_NOSIGNATURE: Not signed", "[NoSign] ", IIf(.ShortMessage = "Legit signature.", vbNullString, "[" & .ShortMessage & "] ")) & _
                    IIf(.isMicrosoftSign, "[MS] ", vbNullString) & _
                    sFile & " - " & _
                    IIf(bIsDriver, IIf(bWHQL, "legit.", IIf(.isLegit, "legit, but not WHQL", vbNullString)), IIf(.isLegit, "legit.", vbNullString)) & _
                    IIf(.isMicrosoftSign, " (Microsoft)", vbNullString) & _
                    IIf(bWPF, " (protected)", vbNullString)
            Else
                sb.Append sFile  'FullPath
                sb.Append ";" & GetFileNameAndExt(sFile)   'File
                sb.Append ";" & IIf(.isLegit, "Legit.", "no")  'Legitimate?
                sb.Append ";" & IIf(bWHQL, "WHQL", "no")   'WQHL
                sb.Append ";" & IIf(.isMicrosoftSign, "Microsoft", "no")   'IsMicrosoft
                sb.Append ";" & IIf(bWPF, "protected", "no")   'WPF / SFC
                sb.Append ";" & IIf(bPE_File, "PE", "no")  'PE
                sb.Append ";" & .IssuerRoot
                sb.Append ";" & .Issuer
                sb.Append ";" & .SubjectNameFriendly
                sb.Append ";" & .SubjectName
                sb.Append ";" & .SubjectEmail
                sb.Append ";" & IIf(.ReturnCode = TRUST_E_NOSIGNATURE, vbNullString, IIf(.isSignedByCert, "Certificate", "Internal"))  'Embedded Sign?
                sb.Append ";" & IIf(.IsEmbedded, "yes", "no")
                sb.Append ";" & .CatalogPath
                sb.Append ";" & .HashRootCert
                sb.Append ";" & .HashFileCode
                sb.Append ";" & .AlgorithmCertHash
                sb.Append ";" & .AlgorithmSignDigest
                sb.Append ";0x" & Hex$(.ReturnCode)
                sb.Append ";0x" & Hex$(.ApiErrorCode)
                sb.Append ";" & .ShortMessage
                sb.Append ";" & .FullMessage
                sb.Append ";" & IIf(.DateTimeStamp = #12:00:00 AM#, vbNullString, Format$(.DateTimeStamp, "yyyy\/MM\/dd HH:nn:ss"))
                sb.Append ";" & IIf(.DateCertBegin = #12:00:00 AM#, vbNullString, Format$(.DateCertBegin, "yyyy\/MM\/dd"))
                sb.AppendLine ";" & IIf(.DateCertExpired = #12:00:00 AM#, vbNullString, Format$(.DateCertExpired, "yyyy\/MM\/dd"))
            End If
        End With

        i = i + 1
    Next
    
    'Preparing a report. Please wait...
    lblStatus.ForeColor = vbBlack
    lblStatus.Caption = Translate(1868)
    DoEvents
    
    aLogLine = Split(sb.ToString, vbCrLf)
    sb.Clear
    QuickSort aLogLine, 0, UBound(aLogLine)
    sLogLine = Join(aLogLine, vbCrLf) & IIf(Len(ErrReport) <> 0, vbCrLf & vbCrLf & "There are some errors while verification:" & vbCrLf & ErrReport, vbNullString)
    
    If bCSV Then
        sb.Append "Full path"
        sb.Append ";" & "File name"
        sb.Append ";" & "Legitimate?"
        sb.Append ";" & "WQHL"
        sb.Append ";" & "Microsoft signature?"
        sb.Append ";" & "WPF / SFC"
        sb.Append ";" & "is PE"
        sb.Append ";" & "Root Issuer"
        sb.Append ";" & "Issuer"
        sb.Append ";" & "Signer name (friendly)"
        sb.Append ";" & "Signer name"
        sb.Append ";" & "Signer email"
        sb.Append ";" & "Signature location"
        sb.Append ";" & "Has internal signature?"
        sb.Append ";" & "Catalog path"
        sb.Append ";" & "Hash of root certificate (fingerprint)"
        sb.Append ";" & "PE hash"
        sb.Append ";" & "Algorithm of certificate hash"
        sb.Append ";" & "Algorithm of signature digest"
        sb.Append ";" & "Result code"
        sb.Append ";" & "API error code"
        sb.Append ";" & "Result message (short)"
        sb.Append ";" & "Result message (full)"
        sb.Append ";" & "Time Stamp"
        sb.Append ";" & "Valid From"
        sb.Append ";" & "Valid Until"
        
        sLogLine = sb.ToString & sLogLine
    Else
        sLogLine = ChrW$(-257) & "Logfile of Digital Signature Checker (HJT+ v." & AppVerString & ")" & vbCrLf & vbCrLf & _
            MakeLogHeader() & vbCrLf & _
            "Is legitimate | FileName | Is Microsoft | Is WFP (Windows Protected File / SFC)" & vbCrLf & _
            "------------------------------------------------" & vbCrLf & _
            sLogLine & vbCrLf & vbCrLf & _
            "--" & vbCrLf & "End of file"
    End If
    
    If bCSV Then
        bData() = StrConv(sLogLine, vbFromUnicode)
    Else
        bData() = sLogLine
    End If
    
    lblStatus.Visible = False
    shpFore.Visible = False
    shpBack.Visible = False
    
    isRan = False
    cmdGo.Enabled = True
    txtPaths.Enabled = True
    cmdExit.Caption = Translate(1858)
    
ReportRepeat:
    If OpenW(ReportPath, FOR_OVERWRITE_CREATE, hFile, g_FileBackupFlag) Then
        PutW hFile, 1&, VarPtr(bData(0)), UBound(bData) + 1, doAppend:=True
        CloseW hFile, True
    Else
        If hFile <= 0 Then
            'Cannot write report file. Write access is restricted by another program. Repeat?
            If MsgBoxW(Translate(1869) & vbCrLf & vbCrLf & ReportPath, vbYesNo Or vbExclamation) = vbYes Then GoTo ReportRepeat
            Exit Sub
        End If
    End If
    
    'rundll32.exe shell32.dll,ShellExec_RunDLL / or notepad
    OpenLogFile ReportPath
    
    Exit Sub
ErrorHandler:
    ErrorMsg Err, "frmCheckDigiSign.cmdGo_Click"
    ToggleWow64FSRedirection True
    If inIDE Then Stop: Resume Next
    If Not inIDE Then
        isRan = False
        cmdGo.Enabled = True
    End If
    CloseW hFile, True
End Sub

Sub CopyArrayToDictionary(arr() As String, oDict As Object)
    If 0 = AryItems(arr) Then Exit Sub
    Dim i As Long
    For i = 0 To UBound(arr)
        If Not oDict.Exists(arr(i)) Then
            oDict.Add arr(i), 0
        End If
    Next
End Sub

Private Sub cmdExit_Click()
    If isRan Then
        isRan = False
        ToggleWow64FSRedirection True
        cmdExit.Caption = Translate(1858)
    Else
        Me.Hide
        'Unload Me
    End If
End Sub

Private Sub cmdSelectFile_Click()
    Dim aFile() As String
    Dim i As Long
    Dim sExt As String
    sExt = "*.exe;*.msi;*.dll;*.sys;*.ocx"
    'PE; All files
    For i = 1 To OpenFileDialog_Multi(aFile, Translate(122), Desktop, "PE (" & sExt & ")|" & sExt & "|" & Translate(1003) & " (*.*)|*.*", Me.hwnd)
        txtPaths.Text = txtPaths.Text & IIf(Len(txtPaths.Text) = 0, vbNullString, vbCrLf) & aFile(i)
    Next
End Sub

Private Sub cmdSelectFolder_Click()
    Dim aFolder() As String
    Dim i As Long
    For i = 1 To OpenFolderDialog_Multi(aFolder, , Desktop, Me.hwnd)
        txtPaths.Text = txtPaths.Text & IIf(Len(txtPaths.Text) = 0, vbNullString, vbCrLf) & aFolder(i)
    Next
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = 27 Then cmdExit_Click
    ProcessHotkey KeyCode, Me
End Sub

Private Sub Form_Load()
    Dim OptB As OptionButton
    Dim Ctl As Control
    
    LoadWindowPos Me, SETTINGS_SECTION_SIGNCHECKER
    
    SetAllFontCharset Me, g_FontName, g_FontSize, g_bFontBold
    Call ReloadLanguage(True)
    
    ' if Win XP -> disable all window styles from option buttons
    If bIsWinXP Then
        For Each Ctl In Me.Controls
            If TypeName(Ctl) = "OptionButton" Then
                Set OptB = Ctl
                SetWindowTheme OptB.hwnd, StrPtr(" "), StrPtr(" ")
            End If
        Next
        Set OptB = Nothing
    End If
    
    SubClassTextbox Me.txtPaths.hwnd, True
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)

    SaveWindowPos Me, SETTINGS_SECTION_SIGNCHECKER
    
    If UnloadMode = 0 Then 'initiated by user (clicking 'X')
        If isRan Then
            isRan = False
            ToggleWow64FSRedirection True
            Cancel = True
            Me.Hide
        Else
            Cancel = True
            Me.Hide
        End If
    Else
        SubClassTextbox Me.txtPaths.hwnd, False
    End If
End Sub

Private Sub Form_Resize()

    If Me.WindowState = vbMinimized Then Exit Sub
    
    Dim TopLevel3&, TopLevel2&
    
    If Me.Width < 9396 Then Me.Width = 9396
    If Me.Height < 5724 Then Me.Height = 5724
    
    txtPaths.Width = Me.Width - 2430
    txtPaths.Height = Me.Height - 5200
    
    TopLevel2 = txtPaths.Top + txtPaths.Height + 100
    TopLevel3 = TopLevel2 + fraMode.Height + 100
    
    Dim offset As Long: offset = 100
    
    cmdGo.Top = TopLevel3
    cmdExit.Top = TopLevel3
    
    shpBack.Top = TopLevel3 + offset
    shpFore.Top = TopLevel3 + offset
    lblStatus.Top = TopLevel3 + 90 + offset
    shpBack.Width = Me.Width - 4680
    
    cmdSelectFile.Left = txtPaths.Left + txtPaths.Width + 70
    cmdSelectFolder.Left = txtPaths.Left + txtPaths.Width + 70
    cmdClear.Left = txtPaths.Left + txtPaths.Width + 70
    
    fraFilter.Top = TopLevel2
    fraMode.Top = TopLevel2
    fraReportFormat.Top = fraFilter.Top + fraFilter.Height + 100
End Sub

Private Sub txtPaths_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = 27 Then cmdExit_Click
End Sub

Private Sub txtPaths_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
    AddObjToList Data
End Sub

Private Sub AddObjToList(Data As DataObject)
    Const vbCFFiles As Long = 15&
    Dim vObj
    If Data.GetFormat(vbCFFiles) Then
        For Each vObj In Data.Files
            txtPaths.Text = txtPaths.Text & IIf(Right$(txtPaths.Text, 2) <> vbCrLf And Len(txtPaths.Text) > 0, vbCrLf, vbNullString) & CStr(vObj)
        Next
    End If
End Sub

Private Sub cmdClear_Click()
    txtPaths.Text = ""
End Sub


