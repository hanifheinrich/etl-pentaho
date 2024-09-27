
@echo off 
cls

rem Simpan lokasi folder saat ini
set "etl_folder=C:\Users\hanif\Downloads\Pentaho Exercise\Otomatisasi Pentaho Data Integration"

rem Folder tempat Pentaho Data Integration set "kettle_folder=c:\opt\data-integration"
set "kettle_folder=c:\data-integration"

rem Folder tempat file log
set "log_folder=%etl_folder%\logs"

rem Buat folder tempat file log jika belum ada
if not exist "%log_folder%" mkdir "%log_folder%"

rem Membentuk file log dengan format dqlab-dwh-YYYY_MM_DD.log
FOR /f %%a in ('WMIC OS GET LocalDateTime ^| find "."') DO set DTS=%%a
set sekarang=%DTS:~0,4%_%DTS:~4,2%_%DTS:~6,2%
set "log_file=%log_folder%\dqlab-dwh-%sekarang%.log"

rem Log Level: Basic, Detailed, Debug, Rowlevel, Error, Nothing
set "log_level=Basic"

rem File Job
set "job_file=%etl_folder%\main_job.kjb"

rem pindah ke folder Pentaho Data Integration
cd /D "%kettle_folder%"

rem Bentuk perintah
set "cmd=Kitchen.bat /file="%job_file%" /logfile="%log_file%" /level=%log_level%"

rem Jalankan ETL
call %cmd%

rem kembali ke folder ETL
cd /D "%etl_folder%"