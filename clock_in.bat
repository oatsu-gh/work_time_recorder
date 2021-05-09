@set formatted_date=%date:/=-%
@set formatted_time=%time: =0%


@REM "‚±‚±‚©‚ç—j“úŒvŽZ"
@REM "ŽQl: http://tooljp.com/CommandBank/Windows/Date/Today_youbi-get.html"
@REM "0:“ú, 1:ŒŽ, 2:‰Î, ... “y: 6"

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
    set japanese_weekday=“ú
) else if %weekday%==1 (
    set japanese_weekday=ŒŽ
) else if %weekday%==2 (
    set japanese_weekday=‰Î
) else if %weekday%==3 (
    set japanese_weekday=…
) else if %weekday%==4 (
    set japanese_weekday=–Ø
) else if %weekday%==5 (
    set japanese_weekday=‹à
) else if %weekday%==6 (
    set japanese_weekday=“y
)

@REM UTF-8‚Åo—Í
@chcp 65001
@echo %japanese_weekday% %formatted_date% %formatted_time%>>%~dp0clock_in_log.txt
