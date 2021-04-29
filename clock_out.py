#!/usr/bin/env python3
# Copyright (c) 2020 oatsu
"""
PCを起動したときに、外部ファイルに時刻を記録する。
"""
from datetime import datetime
from os.path import dirname, join

LOGFILE_PATH = join(dirname(__file__), 'clock_out_log.txt')


def get_weekday_from_datetime(dt: datetime) -> str:
    """日付に応じて曜日を日本語で返す。
    """
    weekday_number = dt.weekday()  # 月曜日始まりで 0-6
    japanese_weekday = ['月', '火', '水', '木', '金', '土', '日']
    return japanese_weekday[weekday_number]


def main(path):
    """実行した時刻をログファイルに追記する。
    """
    dt_now = datetime.now()
    weekday = get_weekday_from_datetime(dt_now)
    date = dt_now.date()
    time = dt_now.time()
    s = ' '.join(list(map(str, (weekday, date, time)))) + '\n'
    print(s)

    with open(path, mode='a', encoding='utf-8', newline='\n') as f:
        f.write(s)


if __name__ == '__main__':
    main(LOGFILE_PATH)
