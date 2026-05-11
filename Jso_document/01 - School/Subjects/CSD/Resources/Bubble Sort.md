Cho array arr = [2, 5, 0, 7, 3]

```Java
int n = arr.length();

for (int i=1; i<n; i++) {
	for (int j=0; j<n-i; j++) {
		if (arr[j] < arr[j+1]) {
			int temp = 0;
			arr[j] = temp;
			temp = arr[j+1];
		}
	}
}
```
