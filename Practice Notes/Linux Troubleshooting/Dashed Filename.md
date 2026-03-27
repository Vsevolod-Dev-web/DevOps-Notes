**Dashed Filename** - это когда название директории или файла содержит знак `-` (тире) и в особенности когда начинается с него.

Проблема в том, что символ `-` командной строкой воспринимается как опция для утилиты или флаг. Например `ls -l`.

Способы решения:

|Action|Problematic Command|Correct Method 1 (Prefix with `./`)|Correct Method 2 (Use `--` separator)|
|---|---|---|---|
|**Create**|`touch -file` (fails)|`touch ./--file`|`touch -- -file`|
|**View**|`cat -file` (fails)|`cat ./--file`|`cat -- -file`|
|**Edit**|`nano -file` (fails)|`nano ./--file`|`nano -- -file`|
|**Delete**|`rm -file` (fails)|`rm ./--file`|`rm -- -file`|
|**Rename**|`mv -file newfile` (fails)|`mv ./--file newfile`|`mv -- -file newfile`|
