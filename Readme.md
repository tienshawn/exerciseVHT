1. Hiển thị thông tin  QuerySuccess, QueryFail, UpdateSuccess, UpdateFail, Avg Res Time, tps 
```
make logQuerySuccess
make logQueryFail
make logUpdateSuccess
make logUpdateFail
make logAvgResTime
make logtps
```

2. Vừa hiển thị thông tin như câu 1, vừa thực hiện ghi kết quả đó ra file output.txt

```
make saveQuerySuccess
make saveQueryFail
make saveUpdateSuccess
make saveUpdateFail
make saveAvgResTime
make savetps
```

3. Hiển thị thời gian, tps cao nhất trong file log theo thứ tự giảm dần, giới hạn 10 mốc thời gian
```
make timeDecrease
make tpsMaxDecrease
```

4. Hiển thị thời gian, tps cao nhất trong file log theo thứ tự tăng dần, giới hạn 10 mốc thời gian
```
make timeIncrease
make tpsMaxIncrease
```
