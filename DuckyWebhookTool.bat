@echo off
:message
color 0d
echo Ducky Webhook Tool
echo ------------------
echo Version: 1.0.0
echo By: DuckyToolz
echo Need help? Contact incredible_duck (on discord)
echo ------------------
echo Spam Webhook[Y/N]?
set /P a=Answer: 
if /I "%a%" EQU "Y" goto :yes
if /I "%a%" EQU "N" goto :no

:sendmsg
echo Send Message To Webhook[Y/N]?
set /P b=Answer: 
if /I "%b%" EQU "Y" goto :yestwo
if /I "%b%" EQU "N" goto :goback

:yes
set /P ansone=Message: 
goto :webhook

:yestwo
set /P anstwo=Message: 
goto :webhooktwo

:no
goto :sendmsg

:webhook
set /P webhookone=Webhook: 
goto :sendmessage

:webhooktwo
set /P webhooktwo=Webhook: 
goto :sendmessagetwo


:sendmessage
set "PAYLOAD={\"content\":\"!%ansone%!\"}"
curl -X POST -H "Content-Type: application/json" -d "{\"content\":\"%ansone%\"}" "%webhookone%"
goto :sendmessage

:sendmessagetwo
set "PAYLOAD={\"content\":\"!%anstwo%!\"}"
curl -X POST -H "Content-Type: application/json" -d "{\"content\":\"%anstwo%\"}" "%webhooktwo%"
echo Sent %anstwo%!
goto :goback


:goback
echo Go back?[Y/N]
set /P back=Answer: 
if /I "%back%" EQU "Y" start DuckyWebhookTool.bat
if /I "%back%" EQU "Y" exit
if /I "%back%" EQU "N" exit