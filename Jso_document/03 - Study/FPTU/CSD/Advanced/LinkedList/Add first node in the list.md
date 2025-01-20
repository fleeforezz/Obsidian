```Java
if (isEmpty() == true) {
	head = new Node(12) // create new node with head.info = 12
} else {
	Node temp = new Node(12);
	temp.next = head;
	head = temp;
}
```

![[Pasted image 20250113163547.png]]
