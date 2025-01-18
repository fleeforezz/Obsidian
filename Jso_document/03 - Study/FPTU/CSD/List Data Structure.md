# <mark style="background: #FFB8EBA6;">1.1</mark> Describe List structures

## List Data Structures

A list is a sequential data structure, i.e. it is a sequence of items of a given base type, where items can be added, deleted, and retrieved from any position in the list.

A list can be implemented as an array, or as a dynamic array to avoid imposing a maximum size.

An alternative implementation is a linked list, where the items are stored in nodes that are linked together with pointers. These two implementations have very different characteristics.

The possible values of this type are sequences of items of type BaseType (including the sequence of length zero). The operations of the ADT are:
+ getFirst()
+ getLast()
+ getNext(p)
+ getPrev(p)
+ get(p)
+ set(p,x)
+ insert(p,x)
+ remove(p)
+ removeFirst()
+ removeLast()
+ removeNext(p)
+ removePrev(p)
+ find(x)
+ size()

## Drawbacks of Arrays

Array is a very useful data structure in many situations. However, it has some important limitations:

+ Require size information for creation
+ Inserting an element in the middle of an array leads to moving other elements around
+ Deleting an element from the middle of an array leads to moving other elements around

Other data structures are more efficient in such situations.

# <mark style="background: #FF5582A6;">1.2</mark> Describe self-referential structures

Many dynamic data structures are implemented through the use of a self-referential structure.

A self-referential structure is an object, one of whose elements is a reference to <mark style="background: #CACFD9A6;">another object of its own type</mark>.

With this arrangement, it is possible to create ‘chains’ of data of varying forms:

![[Pasted image 20250113155850.png]]

# <mark style="background: #FFB86CA6;">1.3</mark> Explain types of linked lists

A linked structure is a collection of nodes storing data and links to other nodes

A linked list is a linear data structure composed of nodes, each node holding some information and a reference to another node in the list

Types of linked lists:
+ Singly-Linked List
+ Doubly-Linked List

# <mark style="background: #FFF3A3A6;">1.4</mark> Singly Linked Lists

## What is Singly Linked Lists ?

A singly linked list is a list whose node includes two datafields:
+ info
+ next

The <mark style="background: #CACFD9A6;">info</mark> field is used to store information, and this is important to the user.

The <mark style="background: #CACFD9A6;">next</mark> field is used to link to its successor in this sequence.

The following image depicts a simple integer linked list:

![[Singly linked list.png]]

## Implementation

There are 2 parts to create a singly linked list:
+ Node class
+ MyList class

### Node class

```Java
class Node{
    int info;
    Node next;
    
    // Default constructor (no parameter)
    Node () {}
    
    // Constructor for a typical node
    Node (int x, Node p) {
        this.info = x; // data stored inside the node
        this.next = p; // link to the next node
    }
    
    //Copy constructor
    Node (int x) {
        this(x,null);
    }
    
 }
```

### MyList class

```Java
public class MyList {
	Node head, tail;

	// Initialize the head
	MyList() {
		this.head = null;
		this.tail = null
	}

	// Check if Empty
	public boolean isEmpty() {
		return this.head == null;
	}

	// Clear the list
	public void clear() {
		this.head = null;
		this.tail = null;
	}

	// Print out the info inside head in the list
	public void traverse() {
		Node h = head;

		while (h != null) {
			System.out.print(" " + h.info);
			h = h.next;
		}
		System.out.println();
	}
}
```

### Advanced MyList class

#### Add first node in the list

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

#### Add last node in the list

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

#### Add node to the specific position in the list

# <mark style="background: #BBFABBA6;">1.5</mark> Circular Lists
# <mark style="background: #ABF7F7A6;">1.6</mark> Doubly Linked Lists
# <mark style="background: #ADCCFFA6;">1.7</mark> Lists in java.util