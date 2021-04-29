@set formatted_date=%date:/=-%
@set formatted_time=%time: =0%


@rem "‚±‚±‚©‚ç—j“úŒvŽZ"
@rem "ŽQl: http://tooljp.com/CommandBank/Windows/Date/Today_youbi-get.html"
@rem "0:“ú, 1:ŒŽ, 2:‰Î, ... “y: 6"

@set /A year=%date:~0,4% * 1
@set /A month=%date:~5,2% * 1
@set /A day=%date:~8,2% * 1

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

@echo %japanese_weekday% %formatted_date% %formatted_time% >> %~dp0%clock_out_log.txt
