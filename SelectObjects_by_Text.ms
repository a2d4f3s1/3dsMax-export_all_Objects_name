----------------------------------------------------------
----------------------------------------------------------
--SelectObjects_by_Text
--Version 001
--Moteki Kunio
--Last change 200424
--
--テキスト(txt)から名前でオブジェクトを選択
--001 リリース
----------------------------------------------------------
----------------------------------------------------------
(
	SelectObjcts = #()
	--■ロードファイル
	LoadedFile = getOpenFileName caption:"Open A Test File:"

	if LoadedFile != undefined then (
		LoadContents = openFile LoadedFile
		seek LoadContents 0 --テキスト頭出し

		while eof LoadContents == false do (
			obj = Execute ("$'"+ (readLine LoadContents) + "'")
			try (
				append SelectObjcts obj
			) catch ()
		)
	)
	print SelectObjcts
	select SelectObjcts
)