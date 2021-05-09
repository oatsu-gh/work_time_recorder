@set formatted_date=%date:/=-%
@set formatted_time=%time: =0%


@REM "ここから曜日計算"
@REM "参考: http://tooljp.com/CommandBank/Windows/Date/Today_youbi-get.html"
@REM "0:日, 1:月, 2:火, ... 土: 6"

@set /A year=%date:~0,4%
@set /A month=1%date:~5,2%-100
@set /A day=1%date:~8,2%-100

@if %month LEQ 2 (
    set /A year=%year% - 1
    set /A month=%month% + 12
)
@set /A weekday=(%year% + %year% / 4 - %year% / 100 + %year% / 400 + (13 * %month% + 8) / 5 + %day%) %% 7
@REM @echo %weekday%

@if %weekday%==0 (
    set japanese_weekday=日
) else if %weekday%==1 (
    set japanese_weekday=月
) else if %weekday%==2 (
    set japanese_weekday=火
) else if %weekday%==3 (
    set japanese_weekday=水
) else if %weekday%==4 (
    set japanese_weekday=木
) else if %weekday%==5 (
    set japanese_weekday=金
) else if %weekday%==6 (
    set japanese_weekday=土
)

@REM UTF-8で出力
@chcp 65001
@echo %japanese_weekday% %formatted_date% %formatted_time%>>%~dp0clock_out_log.txt

@REM シャットダウン
@shutdown /s
