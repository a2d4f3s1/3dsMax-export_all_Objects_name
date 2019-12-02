----------------------------------------------------------
----------------------------------------------------------
--export_all_Objects_name.ms
--Version 001
--Moteki Kunio
--Last change 191202
--
--Export the names of all objects
--001 テスト版
----------------------------------------------------------
----------------------------------------------------------
(
	SS_allObjNames =  StringStream ""
	arr_allObjNames = #()
	
	for i in objects do (append arr_allObjNames i.name)
	sort arr_allObjNames
	
	for i = 1 to arr_allObjNames.count do
	(
		format "%\n" arr_allObjNames[i] to:SS_allObjNames
	)
	
	SaveFileName = (getFilenameFile  (maxFileName))  + "_arr_allObjNames.txt"
	
	SavedFile = getSaveFileName caption:"txtで保存します" filename: SaveFileName types: "TXT(*.txt)|*.txt"
	SaveFileName = filenameFromPath SavedFile --ファイル名を再取得して更新する
	deletefile SavedFile -- 一度消す
	
	CreateFilePath = createFile SaveFileName -- ボーン名書き込み処理
	seek SS_allObjNames 0
	while eof SS_allObjNames == false do
	(
		format (readLine SS_allObjNames  + "\n") to:CreateFilePath
	)
	close CreateFilePath
)