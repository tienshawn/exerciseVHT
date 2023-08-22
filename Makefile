#SHELL := /bin/bash

#ex1: log data to terminal
.PHONY: logQuerySuccess
logQuerySuccess:
	awk -F '|' '/QuerySuccess/ {print $$5}' ./statistic.log

.PHONY: logQueryFail
logQueryFail:
	awk -F '|' '/QueryFail/ {print $$6}' ./statistic.log

.PHONY: logUpdateSuccess
logUpdateSuccess:
	awk -F '|' '/UpdateSuccess/ {print $$7}' ./statistic.log

.PHONY: logUpdateFail
logUpdateFail:
	awk -F '|' '/UpdateFail/ {print $$8}' ./statistic.log

.PHONY: logAvgResTime
logAvgResTime:
	awk '/Avg Res Time/ {split($$0,a,"|"); split(a[11],b,"\t"); split(b[2],c," "); print c[4]}' ./statistic.log

.PHONY: logtps
logtps:
	awk -F '|' '/tps/ {print $$14}' ./statistic.log

#ex2: save data to log file output.txt
.PHONY: saveQuerySuccess
saveQuerySuccess:
	awk -F '|' '/QuerySuccess/ {print $$5}' ./statistic.log | tee output.txt

.PHONY: saveQueryFail
saveQueryFail:
	awk -F '|' '/QueryFail/ {print $$6}' ./statistic.log | tee output.txt

.PHONY: saveUpdateSuccess
saveUpdateSuccess:
	awk -F '|' '/UpdateSuccess/ {print $$7}' ./statistic.log | tee output.txt

.PHONY: saveUpdateFail
saveUpdateFail:
	awk -F '|' '/UpdateFail/ {print $$8}' ./statistic.log | tee output.txt

.PHONY: saveAvgResTime
saveAvgResTime:
	awk '/Avg Res Time/ {split($$0,a,"|"); split(a[11],b,"\t"); print b[2]}' ./statistic.log | tee output.txt

.PHONY: savetps
savetps:
	awk -F '|' '/tps/ {print $$14}' ./statistic.log | tee output.txt

#ex3: time and tpsmax sorted decrease
.PHONY: timeDecrease
timeDecrease:
	awk -F ' ' '{print $$1 " " $$2}' ./statistic.log | sort -k 2 -r | head -n 10

.PHONY: tpsMaxDecrease
tpsMaxDecrease:
	awk -F '|' '/max/ {print $$20}' ./statistic.log | sort -k 2 -r | head -n 10

#ex4: time and tpsmax sorted increase
.PHONY: timeIncrease
timeIncrease:
	awk -F ' ' '{print $$1 " " $$2}' ./statistic.log | sort -k 2 | head -n 10

.PHONY: tpsMaxIncrease
tpsMaxIncrease:
	awk -F '|' '/max/ {print $$20}' ./statistic.log | sort -k 2 | head -n 10
