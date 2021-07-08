#!/bin/bash

soja1=$(wget -qO- http://fpuntel.000webhostapp.com/soja/soja1.php)
soja2=$(wget -qO- http://fpuntel.000webhostapp.com/soja/soja2.php)
soja3=$(wget -qO- http://fpuntel.000webhostapp.com/soja/soja3.php)
estacao=$(wget -qO- http://fpuntel.000webhostapp.com/soja/estacaoMeteorologica.php)
previsao=$(wget -qO- http://fpuntel.000webhostapp.com/soja/previsaoTempo.php)

umidadeSoja1=`echo $soja1 | cut -c 1-2`
tamanhoSoja1=`echo $soja1 | cut -c 4-5`

umidadeSoja2=`echo $soja2 | cut -c 1-2`
tamanhoSoja2=`echo $soja2 | cut -c 4-5`

umidadeSoja3=`echo $soja3 | cut -c 1-2`
tamanhoSoja3=`echo $soja3 | cut -c 4-5`

temperatura=`echo $estacao | cut -c 1-2`
umidadeAr=`echo $estacao | cut -c 4-5`
vento=`echo $estacao | cut -c 7-8`

diaSeg=`echo $previsao | cut -c 1-3`
tempMaxSeg=`echo $previsao | cut -c 5-6`
tempMinSeg=`echo $previsao | cut -c 8-9`
precipSeg=`echo $previsao | cut -c 11`

diaTer=`echo $previsao | cut -c 13-15`
tempMaxTer=`echo $previsao | cut -c 17-18`
tempMinTer=`echo $previsao | cut -c 20-21`
precipTer=`echo $previsao | cut -c 23`

diaQua=`echo $previsao | cut -c 25-27`
tempMaxQua=`echo $previsao | cut -c 29-30`
tempMinQua=`echo $previsao | cut -c 32-33`
precipQua=`echo $previsao | cut -c 35`

diaQui=`echo $previsao | cut -c 37-39`
tempMaxQui=`echo $previsao | cut -c 41-42`
tempMinQui=`echo $previsao | cut -c 44-45`
precipQui=`echo $previsao | cut -c 47`

diaSex=`echo $previsao | cut -c 49-51`
tempMaxSex=`echo $previsao | cut -c 53-54`
tempMinSex=`echo $previsao | cut -c 56-57`
precipSex=`echo $previsao | cut -c 59`

diaSab=`echo $previsao | cut -c 61-63`
tempMaxSab=`echo $previsao | cut -c 65-66`
tempMinSab=`echo $previsao | cut -c 68-69`
precipSab=`echo $previsao | cut -c 71`

diaDom=`echo $previsao | cut -c 73-75`
tempMaxDom=`echo $previsao | cut -c 77-78`
tempMinDom=`echo $previsao | cut -c 80-81`
precipDom=`echo $previsao | cut -c 83`

CONTADOR=1
while [ $CONTADOR -lt 9 ]; do
	if [ $CONTADOR -eq 1 ]; then
		echo "Dia da semana" ";" "Soja 1, 2, 3" ";" "Umidade do Solo" ";" "Tamanho da planta" ";" "Temperatura" ";" "Umidade do Ar" ";" "Vento" ";" "Temp. Min" ";" "Temp. Max" ";" "Precipitação" ";" "Precisa Irrigar">pontosSoja$date.csv
	elif [ $CONTADOR -eq 2 ]; then
		if [ $precipSeg -ge 5 ]; then
			irriga='Sim'
		else
			irriga='Nao'
		fi

		echo "$diaSeg" ";" '1' ";" "$umidadeSoja1" ";" "$tamanhoSoja1" ";" "$temperatura" ";" "$umidadeAr" ";" "$vento" ";" "$tempMinSeg" ";" "$tempMaxSeg" ";" "$precipSeg" ";" "$irriga">>pontossoja$date.csv
		echo "$diaSeg" ";" '2' ";" "$umidadeSoja2" ";" "$tamanhoSoja2" ";" "$temperatura" ";" "$umidadeAr" ";" "$vento" ";" "$tempMinSeg" ";" "$tempMaxSeg" ";" "$precipSeg" ";" "$irriga">>pontossoja$date.csv
		echo "$diaSeg" ";" '3' ";" "$umidadeSoja3" ";" "$tamanhoSoja3" ";" "$temperatura" ";" "$umidadeAr" ";" "$vento" ";" "$tempMinSeg" ";" "$tempMaxSeg" ";" "$precipSeg" ";" "$irriga">>pontossoja$date.csv

		let CONTADOR=$((CONTADOR+1))
	elif [ $CONTADOR -eq 3 ]; then
		if [ $precipTer -ge 5 ]; then
			irriga='Sim'
		else
			irriga='Não'
		fi

		echo "$diaTer" ";" '1' ";" "$umidadeSoja1" ";" "$tamanhoSoja1" ";" "$temperatura" ";" "$umidadeAr" ";" "$vento" ";" "$tempMinTer" ";" "$tempMaxTer" ";" "$precipTer" ";" "$irriga">>pontossoja$date.csv
                echo "$diaTer" ";" '2' ";" "$umidadeSoja2" ";" "$tamanhoSoja2" ";" "$temperatura" ";" "$umidadeAr" ";" "$vento" ";" "$tempMinTer" ";" "$tempMaxTer" ";" "$precipTer" ";" "$irriga">>pontossoja$date.csv
                echo "$diaTer" ";" '3' ";" "$umidadeSoja3" ";" "$tamanhoSoja3" ";" "$temperatura" ";" "$umidadeAr" ";" "$vento" ";" "$tempMinTer" ";" "$tempMaxTer" ";" "$precipTer" ";" "$irriga">>pontossoja$date.csv

		let CONTADOR=$((CONTADOR+1))
	elif [ $CONTADOR -eq 4 ]; then
		if [ $precipQua -ge 5 ]; then
			irriga='Sim'
		else
			irriga='Não'
		fi

		echo "$diaQua" ";" '1' ";" "$umidadeSoja1" ";" "$tamanhoSoja1" ";" "$temperatura" ";" "$umidadeAr" ";" "$vento" ";" "$tempMinQua" ";" "$tempMaxQua" ";" "$precipTer" ";" "$irriga">>pontossoja$date.csv
                echo "$diaQua" ";" '2' ";" "$umidadeSoja2" ";" "$tamanhoSoja2" ";" "$temperatura" ";" "$umidadeAr" ";" "$vento" ";" "$tempMinQua" ";" "$tempMaxQua" ";" "$precipTer" ";" "$irriga">>pontossoja$date.csv
                echo "$diaQua" ";" '3' ";" "$umidadeSoja3" ";" "$tamanhoSoja3" ";" "$temperatura" ";" "$umidadeAr" ";" "$vento" ";" "$tempMinQua" ";" "$tempMaxQua" ";" "$precipTer" ";" "$irriga">>pontossoja$date.csv

		let CONTADOR=$((CONTADOR+1))
	elif [ $CONTADOR -eq 5 ]; then
		if [ $precipQui -ge 5 ]; then
			irriga='Sim'
		else
			irriga='Nao'
		fi

		echo "$diaQui" ";" '1' ";" "$umidadeSoja1" ";" "$tamanhoSoja1" ";" "$temperatura" ";" "$umidadeAr" ";" "$vento" ";" "$tempMinQui" ";" "$tempMaxQui" ";" "$precipQui" ";" "$irriga">>pontossoja$date.csv
		echo "$diaQui" ";" '2' ";" "$umidadeSoja2" ";" "$tamanhoSoja2" ";" "$temperatura" ";" "$umidadeAr" ";" "$vento" ";" "$tempMinQui" ";" "$tempMaxQui" ";" "$precipQui" ";" "$irriga">>pontossoja$date.csv
                echo "$diaQui" ";" '3' ";" "$umidadeSoja3" ";" "$tamanhoSoja3" ";" "$temperatura" ";" "$umidadeAr" ";" "$vento" ";" "$tempMinQui" ";" "$tempMaxQui" ";" "$precipQui" ";" "$irriga">>pontossoja$date.csv
	elif [ $CONTADOR -eq 6 ]; then
		if [ $precipSex -ge 5 ]; then
			irriga='Sim'
		else
			irriga='Nao'
		fi

		echo "$diaSex" ";" '1' ";" "$umidadeSoja1" ";" "$tamanhoSoja1" ";" "$temperatura" ";" "$umidadeAr" ";" "$vento" ";" "$tempMinSex" ";" "$tempMaxSex" ";" "$precipSex" ";" "$irriga">>pontossoja$date.csv
                echo "$diaSex" ";" '2' ";" "$umidadeSoja2" ";" "$tamanhoSoja2" ";" "$temperatura" ";" "$umidadeAr" ";" "$vento" ";" "$tempMinSex" ";" "$tempMaxSex" ";" "$precipSex" ";" "$irriga">>pontossoja$date.csv
                echo "$diaSex" ";" '3' ";" "$umidadeSoja3" ";" "$tamanhoSoja3" ";" "$temperatura" ";" "$umidadeAr" ";" "$vento" ";" "$tempMinSex" ";" "$tempMaxSex" ";" "$precipSex" ";" "$irriga">>pontossoja$date.csv

		let CONTADOR=$((CONTADOR+1))
	elif [ $CONTADOR -eq 7 ]; then
		if [ $precipSab -ge 5 ]; then
			irriga='Sim'
		else
			irriga='Nao'
		fi

		echo "$diaSab" ";" '1' ";" "$umidadeSoja1" ";" "$tamanhoSoja1" ";" "$temperatura" ";" "$umidadeAr" ";" "$vento" ";" "$tempMinSab" ";" "$tempMaxSab" ";" "$precipSab" ";" "$irriga">>pontossoja$date.csv
                echo "$diaSab" ";" '2' ";" "$umidadeSoja2" ";" "$tamanhoSoja2" ";" "$temperatura" ";" "$umidadeAr" ";" "$vento" ";" "$tempMinSab" ";" "$tempMaxSab" ";" "$precipSab" ";" "$irriga">>pontossoja$date.csv
                echo "$diaSab" ";" '3' ";" "$umidadeSoja3" ";" "$tamanhoSoja3" ";" "$temperatura" ";" "$umidadeAr" ";" "$vento" ";" "$tempMinSab" ";" "$tempMaxSab" ";" "$precipSab" ";" "$irriga">>pontossoja$date.csv

		let CONTADOR=$((CONTADOR+1))
	else
		if [ $precipDom -ge 5 ]; then
			irriga='Sim'
		else
			irriga='Nao'
		fi

		echo "$diaDom" ";" '1' ";" "$umidadeSoja1" ";" "$tamanhoSoja1" ";" "$temperatura" ";" "$umidadeAr" ";" "$vento" ";" "$tempMinDom" ";" "$tempMaxDom" ";" "$precipDom" ";" "$irriga">>pontossoja$date.csv
                echo "$diaDom" ";" '2' ";" "$umidadeSoja2" ";" "$tamanhoSoja2" ";" "$temperatura" ";" "$umidadeAr" ";" "$vento" ";" "$tempMinDom" ";" "$tempMaxDom" ";" "$precipDom" ";" "$irriga">>pontossoja$date.csv
                echo "$diaDom" ";" '3' ";" "$umidadeSoja3" ";" "$tamanhoSoja3" ";" "$temperatura" ";" "$umidadeAr" ";" "$vento" ";" "$tempMinDom" ";" "$tempMaxDom" ";" "$precipDom" ";" "$irriga">>pontossoja$date.csv

		let CONTADOR=$((CONTADOR+1))
	fi
done
