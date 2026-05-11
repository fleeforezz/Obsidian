```Java
if (isEmpty() == true) {
	head = new Node(12) // create new node with head.info = 12
} else {
	Node temp = head;
	while(temp.next != null) {
		temp = temp.next;
	}
	temp.next = new Node(12);
}
```

![[Pasted image 20250113171455.png]]
