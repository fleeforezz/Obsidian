---

excalidraw-plugin: parsed
tags: [excalidraw]

---
==⚠  Switch to EXCALIDRAW VIEW in the MORE OPTIONS menu of this document. ⚠==


# Text Elements
- Create 2 classes:
 + Node Class (get node data)
 + Main Class (Solve Proccess)
  ^rK54lMEe

Main class ^sqsuwFhN

bubbleSort(Node head) ^jWQt4XRr

insertAtTheBegin(Node start_ref, int data) ^5fhjcDTD

main (String[] args) ^Z5qAhFIg

printList(Node n) ^ZU0YLV5E

swap(Node ptr1, Node ptr2) ^Fda7xEGv

Node class ^f3VCOMO7

static void bubbleSort(Node head) {
        boolean swapped;
        Node current;

        if (head == null)
            return;

        do {
            swapped = false;
            current = head;

            while (current.next != null) {
                if (current.data > current.next.data) {
                    swap(current, current.next);
                    swapped = true;
                }
                current = current.next;
            }
        } while (swapped);
    } ^or1sBFbO

static Node insertAtTheBegin(Node start_ref, int data) {
        Node ptr1 = new Node(data);

        ptr1.next = start_ref;
        start_ref = ptr1;
        return start_ref; // Return the updated start_ref
    } ^YkpO8jV0

static void swap(Node ptr1, Node ptr2) {
        int tmp = ptr2.data;
        ptr2.data = ptr1.data;
        ptr1.data = tmp;
    } ^N0hMDC6j

static void printList(Node n) {
        while (n != null) {
            System.out.print(n.data + " -> ");
            n = n.next;
        }
        System.out.println();
    } ^7b8P8qBw

public static void main(String[] args) {
        int[] arr = { 78, 20, 10, 32, 1, 5 };
        int listSize = arr.length;

        Node start = null;

        // Create linked list from the array arr[]
        for (int i = listSize - 1; i >= 0; i--)
            start = insertAtTheBegin(start, arr[i]);

        System.out.println("Linked list before sorting");
        printList(start);

        bubbleSort(start);

        System.out.println("Linked list after sorting");
        printList(start);
    } ^Sn5GRWPs

int data;
    Node next;

    Node(int data) {
        this.data = data;
        this.next = null;
    } ^L3bU2Yjw

Sort linked list using Bubble Sort ^mfBis018

Sort linked list using Bubble Sort ^K8lWEsOv

if (head==null) return;
    
    Node p = head;
    Node k = tail;
    
    while(p != null) {
        Node q = head;
        While(q != k) {
            if (q.info > q.next.info) {
                int temp = q.info;
                q.info = q.next.info;
                q.next.info = temp;
                isSwap = true;
            }
            q = q.next;
        }
        p = p.next;
    }
    if (isSwap == false) break;
    k = q;
    p = p.next; ^W9g5SpAO

%%
# Drawing
```json
{
	"type": "excalidraw",
	"version": 2,
	"source": "https://github.com/zsviczian/obsidian-excalidraw-plugin/releases/tag/2.1.5",
	"elements": [
		{
			"type": "text",
			"version": 983,
			"versionNonce": 2133750259,
			"isDeleted": false,
			"id": "rK54lMEe",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -1475.4661304380195,
			"y": -740.3786956409845,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 730.699951171875,
			"height": 234.67829980817356,
			"seed": 1915803891,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1716542199552,
			"link": null,
			"locked": false,
			"fontSize": 46.93565996163471,
			"fontFamily": 1,
			"text": "- Create 2 classes:\n + Node Class (get node data)\n + Main Class (Solve Proccess)\n ",
			"rawText": "- Create 2 classes:\n + Node Class (get node data)\n + Main Class (Solve Proccess)\n ",
			"textAlign": "left",
			"verticalAlign": "top",
			"containerId": null,
			"originalText": "- Create 2 classes:\n + Node Class (get node data)\n + Main Class (Solve Proccess)\n ",
			"lineHeight": 1.25
		},
		{
			"type": "text",
			"version": 544,
			"versionNonce": 492673043,
			"isDeleted": false,
			"id": "f3VCOMO7",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -548.6774404474512,
			"y": -199.25844273627928,
			"strokeColor": "#e03131",
			"backgroundColor": "transparent",
			"width": 166.8382110595703,
			"height": 39.12280806089517,
			"seed": 1746937875,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1716542338455,
			"link": null,
			"locked": false,
			"fontSize": 31.298246448716135,
			"fontFamily": 1,
			"text": "Node class",
			"rawText": "Node class",
			"textAlign": "left",
			"verticalAlign": "top",
			"containerId": null,
			"originalText": "Node class",
			"lineHeight": 1.25
		},
		{
			"type": "arrow",
			"version": 975,
			"versionNonce": 2011217715,
			"isDeleted": false,
			"id": "Ydq0fv-TYAcZHWCTGGfG4",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -193.45836185794144,
			"y": 60.912751083919915,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 527.128650301022,
			"height": 205.31102788538422,
			"seed": 958948221,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1716542139883,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "jWQt4XRr",
				"focus": 0.7943893653907983,
				"gap": 4.457271541555031
			},
			"endBinding": {
				"elementId": "p36q4gCPRuKUw0BUxQOWq",
				"focus": -0.014754979080678661,
				"gap": 7.19208913356556
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "arrow",
			"points": [
				[
					0,
					0
				],
				[
					233.82038882108952,
					-137.6750388593733
				],
				[
					527.128650301022,
					-205.31102788538422
				]
			]
		},
		{
			"type": "text",
			"version": 544,
			"versionNonce": 532091155,
			"isDeleted": false,
			"id": "or1sBFbO",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 374.7164951033766,
			"y": -467.80150780959616,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 548.65966796875,
			"height": 500,
			"seed": 976196477,
			"groupIds": [
				"UoB7gHIT5nj5R7eKY8Roy"
			],
			"frameId": null,
			"roundness": null,
			"boundElements": [
				{
					"id": "Ydq0fv-TYAcZHWCTGGfG4",
					"type": "arrow"
				}
			],
			"updated": 1716542138826,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "static void bubbleSort(Node head) {\n        boolean swapped;\n        Node current;\n\n        if (head == null)\n            return;\n\n        do {\n            swapped = false;\n            current = head;\n\n            while (current.next != null) {\n                if (current.data > current.next.data) {\n                    swap(current, current.next);\n                    swapped = true;\n                }\n                current = current.next;\n            }\n        } while (swapped);\n    }",
			"rawText": "static void bubbleSort(Node head) {\n        boolean swapped;\n        Node current;\n\n        if (head == null)\n            return;\n\n        do {\n            swapped = false;\n            current = head;\n\n            while (current.next != null) {\n                if (current.data > current.next.data) {\n                    swap(current, current.next);\n                    swapped = true;\n                }\n                current = current.next;\n            }\n        } while (swapped);\n    }",
			"textAlign": "left",
			"verticalAlign": "top",
			"containerId": null,
			"originalText": "static void bubbleSort(Node head) {\n        boolean swapped;\n        Node current;\n\n        if (head == null)\n            return;\n\n        do {\n            swapped = false;\n            current = head;\n\n            while (current.next != null) {\n                if (current.data > current.next.data) {\n                    swap(current, current.next);\n                    swapped = true;\n                }\n                current = current.next;\n            }\n        } while (swapped);\n    }",
			"lineHeight": 1.25
		},
		{
			"type": "rectangle",
			"version": 289,
			"versionNonce": 667712925,
			"isDeleted": false,
			"id": "p36q4gCPRuKUw0BUxQOWq",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 340.8623775766461,
			"y": -495.09315729639286,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 620.7102264572547,
			"height": 544.7886489530974,
			"seed": 1194770685,
			"groupIds": [
				"UoB7gHIT5nj5R7eKY8Roy"
			],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"id": "Ydq0fv-TYAcZHWCTGGfG4",
					"type": "arrow"
				}
			],
			"updated": 1716542138826,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 592,
			"versionNonce": 1736013491,
			"isDeleted": false,
			"id": "YkpO8jV0",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 386.46723562715306,
			"y": 129.79283180062373,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 604.4395751953125,
			"height": 175,
			"seed": 1665164787,
			"groupIds": [
				"QWj0smyf7JvN3zIFhhz8W"
			],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1716542138826,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "static Node insertAtTheBegin(Node start_ref, int data) {\n        Node ptr1 = new Node(data);\n\n        ptr1.next = start_ref;\n        start_ref = ptr1;\n        return start_ref; // Return the updated start_ref\n    }",
			"rawText": "static Node insertAtTheBegin(Node start_ref, int data) {\n        Node ptr1 = new Node(data);\n\n        ptr1.next = start_ref;\n        start_ref = ptr1;\n        return start_ref; // Return the updated start_ref\n    }",
			"textAlign": "left",
			"verticalAlign": "top",
			"containerId": null,
			"originalText": "static Node insertAtTheBegin(Node start_ref, int data) {\n        Node ptr1 = new Node(data);\n\n        ptr1.next = start_ref;\n        start_ref = ptr1;\n        return start_ref; // Return the updated start_ref\n    }",
			"lineHeight": 1.25
		},
		{
			"type": "rectangle",
			"version": 643,
			"versionNonce": 311805,
			"isDeleted": false,
			"id": "uwmc1p9mxC6btoGXAzEWZ",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 359.47125955194383,
			"y": 98.69921609161122,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 680.6854255752593,
			"height": 240.07172908749442,
			"seed": 769676403,
			"groupIds": [
				"QWj0smyf7JvN3zIFhhz8W"
			],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"id": "dRSaQvYZaRimaufMluhm-",
					"type": "arrow"
				}
			],
			"updated": 1716542138826,
			"link": null,
			"locked": false
		},
		{
			"type": "arrow",
			"version": 1046,
			"versionNonce": 18753619,
			"isDeleted": false,
			"id": "dRSaQvYZaRimaufMluhm-",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 29.092576252026674,
			"y": 117.62073233183835,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 326.52202071419345,
			"height": 12.961304326383669,
			"seed": 1655317619,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1716542138826,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "5fhjcDTD",
				"focus": 0.06850239112113615,
				"gap": 6.864244551809236
			},
			"endBinding": {
				"elementId": "uwmc1p9mxC6btoGXAzEWZ",
				"focus": 0.33350880639088976,
				"gap": 3.8566625857236545
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "arrow",
			"points": [
				[
					0,
					0
				],
				[
					203.53864348913567,
					0.0317060897849899
				],
				[
					326.52202071419345,
					12.961304326383669
				]
			]
		},
		{
			"type": "text",
			"version": 255,
			"versionNonce": 1165326941,
			"isDeleted": false,
			"id": "N0hMDC6j",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 329.33161016887607,
			"y": 412.4378411645742,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 408.1596374511719,
			"height": 125,
			"seed": 1632262259,
			"groupIds": [
				"R3MIOpZylWr8GxEqm9q64"
			],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1716542138826,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "static void swap(Node ptr1, Node ptr2) {\n        int tmp = ptr2.data;\n        ptr2.data = ptr1.data;\n        ptr1.data = tmp;\n    }",
			"rawText": "static void swap(Node ptr1, Node ptr2) {\n        int tmp = ptr2.data;\n        ptr2.data = ptr1.data;\n        ptr1.data = tmp;\n    }",
			"textAlign": "left",
			"verticalAlign": "top",
			"containerId": null,
			"originalText": "static void swap(Node ptr1, Node ptr2) {\n        int tmp = ptr2.data;\n        ptr2.data = ptr1.data;\n        ptr1.data = tmp;\n    }",
			"lineHeight": 1.25
		},
		{
			"type": "rectangle",
			"version": 358,
			"versionNonce": 310093299,
			"isDeleted": false,
			"id": "FfnjyyuZJOKAHgXNqcnrm",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 302.199119181079,
			"y": 394.89765088425673,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 475.7781318186271,
			"height": 160.05437222001262,
			"seed": 1041271133,
			"groupIds": [
				"R3MIOpZylWr8GxEqm9q64"
			],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"id": "26CnpcMihqmC99KnL4u8H",
					"type": "arrow"
				}
			],
			"updated": 1716542138826,
			"link": null,
			"locked": false
		},
		{
			"type": "arrow",
			"version": 409,
			"versionNonce": 552609469,
			"isDeleted": false,
			"id": "26CnpcMihqmC99KnL4u8H",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -141.61440927251277,
			"y": 167.1752241063651,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 483.39852976085683,
			"height": 224.43368814683336,
			"seed": 905066355,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1716542138826,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "Fda7xEGv",
				"focus": -0.773123146602528,
				"gap": 7.146789574728473
			},
			"endBinding": {
				"elementId": "FfnjyyuZJOKAHgXNqcnrm",
				"focus": -0.2297061325197078,
				"gap": 3.288738631058237
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "arrow",
			"points": [
				[
					0,
					0
				],
				[
					250.20922086547841,
					59.355552875780745
				],
				[
					483.39852976085683,
					224.43368814683336
				]
			]
		},
		{
			"type": "text",
			"version": 248,
			"versionNonce": 622216989,
			"isDeleted": false,
			"id": "7b8P8qBw",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 245.66985485096035,
			"y": 648.2841209118952,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 443.41973876953125,
			"height": 175,
			"seed": 1633447667,
			"groupIds": [
				"QA2RsudAiv_TZh7riFe0q"
			],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1716542138826,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "static void printList(Node n) {\n        while (n != null) {\n            System.out.print(n.data + \" -> \");\n            n = n.next;\n        }\n        System.out.println();\n    }",
			"rawText": "static void printList(Node n) {\n        while (n != null) {\n            System.out.print(n.data + \" -> \");\n            n = n.next;\n        }\n        System.out.println();\n    }",
			"textAlign": "left",
			"verticalAlign": "top",
			"containerId": null,
			"originalText": "static void printList(Node n) {\n        while (n != null) {\n            System.out.print(n.data + \" -> \");\n            n = n.next;\n        }\n        System.out.println();\n    }",
			"lineHeight": 1.25
		},
		{
			"type": "rectangle",
			"version": 336,
			"versionNonce": 329975091,
			"isDeleted": false,
			"id": "asZb2WKgVeLVogOBI09oc",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 205.10815960033705,
			"y": 632.6624242283635,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 534.9763471981453,
			"height": 207.1936283709769,
			"seed": 829659603,
			"groupIds": [
				"QA2RsudAiv_TZh7riFe0q"
			],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"id": "h7szNsyxKUqrTUwk2jbE4",
					"type": "arrow"
				}
			],
			"updated": 1716542138826,
			"link": null,
			"locked": false
		},
		{
			"type": "arrow",
			"version": 418,
			"versionNonce": 2098849491,
			"isDeleted": false,
			"id": "h7szNsyxKUqrTUwk2jbE4",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -251.24070307227842,
			"y": 216.22078178944372,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 549.2131564056198,
			"height": 410.96032774893143,
			"seed": 986892669,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1716542138826,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "ZU0YLV5E",
				"focus": -0.7654296995810426,
				"gap": 5.729186440146577
			},
			"endBinding": {
				"elementId": "asZb2WKgVeLVogOBI09oc",
				"focus": -0.21475538021030127,
				"gap": 5.481314689988267
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "arrow",
			"points": [
				[
					0,
					0
				],
				[
					276.4163309178582,
					105.22947934480368
				],
				[
					549.2131564056198,
					410.96032774893143
				]
			]
		},
		{
			"type": "text",
			"version": 172,
			"versionNonce": 1727718365,
			"isDeleted": false,
			"id": "Sn5GRWPs",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 160.05688665812227,
			"y": 947.1424873279175,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 529.99951171875,
			"height": 450,
			"seed": 380022835,
			"groupIds": [
				"ZZOhdRRz80sW54G_TRdQ9"
			],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1716542138826,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "public static void main(String[] args) {\n        int[] arr = { 78, 20, 10, 32, 1, 5 };\n        int listSize = arr.length;\n\n        Node start = null;\n\n        // Create linked list from the array arr[]\n        for (int i = listSize - 1; i >= 0; i--)\n            start = insertAtTheBegin(start, arr[i]);\n\n        System.out.println(\"Linked list before sorting\");\n        printList(start);\n\n        bubbleSort(start);\n\n        System.out.println(\"Linked list after sorting\");\n        printList(start);\n    }",
			"rawText": "public static void main(String[] args) {\n        int[] arr = { 78, 20, 10, 32, 1, 5 };\n        int listSize = arr.length;\n\n        Node start = null;\n\n        // Create linked list from the array arr[]\n        for (int i = listSize - 1; i >= 0; i--)\n            start = insertAtTheBegin(start, arr[i]);\n\n        System.out.println(\"Linked list before sorting\");\n        printList(start);\n\n        bubbleSort(start);\n\n        System.out.println(\"Linked list after sorting\");\n        printList(start);\n    }",
			"textAlign": "left",
			"verticalAlign": "top",
			"containerId": null,
			"originalText": "public static void main(String[] args) {\n        int[] arr = { 78, 20, 10, 32, 1, 5 };\n        int listSize = arr.length;\n\n        Node start = null;\n\n        // Create linked list from the array arr[]\n        for (int i = listSize - 1; i >= 0; i--)\n            start = insertAtTheBegin(start, arr[i]);\n\n        System.out.println(\"Linked list before sorting\");\n        printList(start);\n\n        bubbleSort(start);\n\n        System.out.println(\"Linked list after sorting\");\n        printList(start);\n    }",
			"lineHeight": 1.25
		},
		{
			"type": "rectangle",
			"version": 310,
			"versionNonce": 1165726835,
			"isDeleted": false,
			"id": "NVjQL_0XMyKxXswczLLN7",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 122.78401367678157,
			"y": 929.6022970475999,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 604.0408621090629,
			"height": 495.5108563387623,
			"seed": 910816669,
			"groupIds": [
				"ZZOhdRRz80sW54G_TRdQ9"
			],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"id": "R1xErAlqvChUqZ5SOWA8E",
					"type": "arrow"
				}
			],
			"updated": 1716542138826,
			"link": null,
			"locked": false
		},
		{
			"type": "arrow",
			"version": 506,
			"versionNonce": 286023741,
			"isDeleted": false,
			"id": "R1xErAlqvChUqZ5SOWA8E",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -224.0737356080258,
			"y": 257.21376217578904,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 396.03008297892865,
			"height": 663.587631802619,
			"seed": 79953789,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1716542138826,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "Z5qAhFIg",
				"focus": -0.8853758308773118,
				"gap": 2.5603534197945805
			},
			"endBinding": {
				"elementId": "NVjQL_0XMyKxXswczLLN7",
				"focus": -0.3835857842051228,
				"gap": 8.800903069192486
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "arrow",
			"points": [
				[
					0,
					0
				],
				[
					208.54897199286359,
					182.43366784146576
				],
				[
					396.03008297892865,
					663.587631802619
				]
			]
		},
		{
			"type": "text",
			"version": 249,
			"versionNonce": 479628819,
			"isDeleted": false,
			"id": "L3bU2Yjw",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 258.03135938706964,
			"y": -781.9725553150574,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 258.119873046875,
			"height": 175,
			"seed": 1655069789,
			"groupIds": [
				"56Fz8JbVLclVKMSTcdnLV"
			],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1716542138826,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "int data;\n    Node next;\n\n    Node(int data) {\n        this.data = data;\n        this.next = null;\n    }",
			"rawText": "int data;\n    Node next;\n\n    Node(int data) {\n        this.data = data;\n        this.next = null;\n    }",
			"textAlign": "left",
			"verticalAlign": "top",
			"containerId": null,
			"originalText": "int data;\n    Node next;\n\n    Node(int data) {\n        this.data = data;\n        this.next = null;\n    }",
			"lineHeight": 1.25
		},
		{
			"type": "rectangle",
			"version": 295,
			"versionNonce": 141512861,
			"isDeleted": false,
			"id": "9KTnIPNjEfjr8Nl62dyd4",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 229.19734717773815,
			"y": -799.6260541673842,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 321.2936252381427,
			"height": 217.7264858453625,
			"seed": 1872068317,
			"groupIds": [
				"56Fz8JbVLclVKMSTcdnLV"
			],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"id": "jWX2q8nCdtEbmDM9A4Pqr",
					"type": "arrow"
				}
			],
			"updated": 1716542138826,
			"link": null,
			"locked": false
		},
		{
			"type": "arrow",
			"version": 390,
			"versionNonce": 1969312691,
			"isDeleted": false,
			"id": "jWX2q8nCdtEbmDM9A4Pqr",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -353.13895218037646,
			"y": -185.07210427746702,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 669.6023906411134,
			"height": 384.22863094682566,
			"seed": 1426948317,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1716542138826,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "LW9Wdz9ogdBwmuWhCRAJc",
				"focus": 0.4016669629124709,
				"gap": 8.307586760546272
			},
			"endBinding": {
				"elementId": "9KTnIPNjEfjr8Nl62dyd4",
				"focus": -0.253058768017027,
				"gap": 12.59883309772897
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "arrow",
			"points": [
				[
					0,
					0
				],
				[
					322.3210285493128,
					-98.2228204189031
				],
				[
					669.6023906411134,
					-384.22863094682566
				]
			]
		},
		{
			"type": "ellipse",
			"version": 97,
			"versionNonce": 1857321363,
			"isDeleted": false,
			"id": "LW9Wdz9ogdBwmuWhCRAJc",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -567.8088674695754,
			"y": -240.68502461213694,
			"strokeColor": "#e03131",
			"backgroundColor": "transparent",
			"width": 206.77355320816616,
			"height": 123.39713072280284,
			"seed": 687952499,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [
				{
					"id": "jWX2q8nCdtEbmDM9A4Pqr",
					"type": "arrow"
				}
			],
			"updated": 1716542331806,
			"link": null,
			"locked": false
		},
		{
			"type": "line",
			"version": 271,
			"versionNonce": 599756125,
			"isDeleted": false,
			"id": "c5gj1x3Irs50Ybr9_mo6-",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -483.5434912768162,
			"y": 13.591725828546714,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 3.266145330800839,
			"height": 244.90364512570386,
			"seed": 733058269,
			"groupIds": [
				"6Db912Gp6Ndjcw3SWN_X4",
				"YZLhmlc_8hPpV2dK1mLlH"
			],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1716542138826,
			"link": null,
			"locked": false,
			"startBinding": null,
			"endBinding": null,
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": null,
			"points": [
				[
					0,
					0
				],
				[
					-3.266145330800839,
					244.90364512570386
				]
			]
		},
		{
			"type": "line",
			"version": 148,
			"versionNonce": 600851187,
			"isDeleted": false,
			"id": "3ZBr8WybznN-rcelsbqHn",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -484.36001203538126,
			"y": 65.03334347317309,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 49.80851383095563,
			"height": 0.8165207585650478,
			"seed": 859657277,
			"groupIds": [
				"6Db912Gp6Ndjcw3SWN_X4",
				"YZLhmlc_8hPpV2dK1mLlH"
			],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1716542138826,
			"link": null,
			"locked": false,
			"startBinding": null,
			"endBinding": null,
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": null,
			"points": [
				[
					0,
					0
				],
				[
					49.80851383095563,
					0.8165207585650478
				]
			]
		},
		{
			"type": "line",
			"version": 203,
			"versionNonce": 1920981437,
			"isDeleted": false,
			"id": "HnQHIPPiLvCZ3hbzrUkxh",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -482.4664779556622,
			"y": 117.25120226336236,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 49.80851383095563,
			"height": 0.8165207585650478,
			"seed": 40056541,
			"groupIds": [
				"6Db912Gp6Ndjcw3SWN_X4",
				"YZLhmlc_8hPpV2dK1mLlH"
			],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1716542138826,
			"link": null,
			"locked": false,
			"startBinding": null,
			"endBinding": null,
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": null,
			"points": [
				[
					0,
					0
				],
				[
					49.80851383095563,
					0.8165207585650478
				]
			]
		},
		{
			"type": "line",
			"version": 180,
			"versionNonce": 1498508435,
			"isDeleted": false,
			"id": "RyPf06U3-bKDdJYSqHKHP",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -484.5078110003451,
			"y": 167.26386185809446,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 49.80851383095563,
			"height": 0.8165207585650478,
			"seed": 1441479645,
			"groupIds": [
				"6Db912Gp6Ndjcw3SWN_X4",
				"YZLhmlc_8hPpV2dK1mLlH"
			],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1716542138826,
			"link": null,
			"locked": false,
			"startBinding": null,
			"endBinding": null,
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": null,
			"points": [
				[
					0,
					0
				],
				[
					49.80851383095563,
					0.8165207585650478
				]
			]
		},
		{
			"type": "line",
			"version": 192,
			"versionNonce": 808950301,
			"isDeleted": false,
			"id": "U13j7H2R7MY--rUrTNb8I",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -483.69129024178005,
			"y": 218.0930422113916,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 49.80851383095563,
			"height": 0.8165207585650478,
			"seed": 91784253,
			"groupIds": [
				"6Db912Gp6Ndjcw3SWN_X4",
				"YZLhmlc_8hPpV2dK1mLlH"
			],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1716542138826,
			"link": null,
			"locked": false,
			"startBinding": null,
			"endBinding": null,
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": null,
			"points": [
				[
					0,
					0
				],
				[
					49.80851383095563,
					0.8165207585650478
				]
			]
		},
		{
			"type": "line",
			"version": 198,
			"versionNonce": 1144807987,
			"isDeleted": false,
			"id": "S_hGLH9DjHHPPTuH7FFuF",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -484.3036652365687,
			"y": 257.69489081893255,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 49.80851383095563,
			"height": 0.8165207585650478,
			"seed": 106093853,
			"groupIds": [
				"6Db912Gp6Ndjcw3SWN_X4",
				"YZLhmlc_8hPpV2dK1mLlH"
			],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1716542138826,
			"link": null,
			"locked": false,
			"startBinding": null,
			"endBinding": null,
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": null,
			"points": [
				[
					0,
					0
				],
				[
					49.80851383095563,
					0.8165207585650478
				]
			]
		},
		{
			"type": "text",
			"version": 225,
			"versionNonce": 1867546109,
			"isDeleted": false,
			"id": "sqsuwFhN",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -563.495315399033,
			"y": -40.6620978045903,
			"strokeColor": "#f08c00",
			"backgroundColor": "transparent",
			"width": 170.4456329345703,
			"height": 41.47652709656745,
			"seed": 1232321789,
			"groupIds": [
				"6Db912Gp6Ndjcw3SWN_X4",
				"YZLhmlc_8hPpV2dK1mLlH"
			],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1716542343678,
			"link": null,
			"locked": false,
			"fontSize": 33.18122167725396,
			"fontFamily": 1,
			"text": "Main class",
			"rawText": "Main class",
			"textAlign": "left",
			"verticalAlign": "top",
			"containerId": null,
			"originalText": "Main class",
			"lineHeight": 1.25
		},
		{
			"type": "text",
			"version": 165,
			"versionNonce": 762815443,
			"isDeleted": false,
			"id": "jWQt4XRr",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -415.97541733504335,
			"y": 54.30705357142955,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 218.05978393554688,
			"height": 25,
			"seed": 1553516541,
			"groupIds": [
				"6Db912Gp6Ndjcw3SWN_X4",
				"YZLhmlc_8hPpV2dK1mLlH"
			],
			"frameId": null,
			"roundness": null,
			"boundElements": [
				{
					"id": "Ydq0fv-TYAcZHWCTGGfG4",
					"type": "arrow"
				}
			],
			"updated": 1716542138826,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "bubbleSort(Node head)",
			"rawText": "bubbleSort(Node head)",
			"textAlign": "left",
			"verticalAlign": "top",
			"containerId": null,
			"originalText": "bubbleSort(Node head)",
			"lineHeight": 1.25
		},
		{
			"type": "text",
			"version": 201,
			"versionNonce": 1109620445,
			"isDeleted": false,
			"id": "5fhjcDTD",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -415.77127157126694,
			"y": 104.22693170143151,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 437.9996032714844,
			"height": 25,
			"seed": 601432189,
			"groupIds": [
				"6Db912Gp6Ndjcw3SWN_X4",
				"YZLhmlc_8hPpV2dK1mLlH"
			],
			"frameId": null,
			"roundness": null,
			"boundElements": [
				{
					"id": "dRSaQvYZaRimaufMluhm-",
					"type": "arrow"
				}
			],
			"updated": 1716542138826,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "insertAtTheBegin(Node start_ref, int data)",
			"rawText": "insertAtTheBegin(Node start_ref, int data)",
			"textAlign": "left",
			"verticalAlign": "top",
			"containerId": null,
			"originalText": "insertAtTheBegin(Node start_ref, int data)",
			"lineHeight": 1.25
		},
		{
			"type": "text",
			"version": 274,
			"versionNonce": 2098835827,
			"isDeleted": false,
			"id": "Z5qAhFIg",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -419.8539376606329,
			"y": 243.8540994984367,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 193.2198486328125,
			"height": 25,
			"seed": 1065525469,
			"groupIds": [
				"6Db912Gp6Ndjcw3SWN_X4",
				"YZLhmlc_8hPpV2dK1mLlH"
			],
			"frameId": null,
			"roundness": null,
			"boundElements": [
				{
					"id": "R1xErAlqvChUqZ5SOWA8E",
					"type": "arrow"
				}
			],
			"updated": 1716542138826,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "main (String[] args)",
			"rawText": "main (String[] args)",
			"textAlign": "left",
			"verticalAlign": "top",
			"containerId": null,
			"originalText": "main (String[] args)",
			"lineHeight": 1.25
		},
		{
			"type": "text",
			"version": 248,
			"versionNonce": 1068143421,
			"isDeleted": false,
			"id": "ZU0YLV5E",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -419.64972960031565,
			"y": 203.84402165988348,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 162.67984008789062,
			"height": 25,
			"seed": 1971282909,
			"groupIds": [
				"6Db912Gp6Ndjcw3SWN_X4",
				"YZLhmlc_8hPpV2dK1mLlH"
			],
			"frameId": null,
			"roundness": null,
			"boundElements": [
				{
					"id": "h7szNsyxKUqrTUwk2jbE4",
					"type": "arrow"
				}
			],
			"updated": 1716542138826,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "printList(Node n)",
			"rawText": "printList(Node n)",
			"textAlign": "left",
			"verticalAlign": "top",
			"containerId": null,
			"originalText": "printList(Node n)",
			"lineHeight": 1.25
		},
		{
			"type": "text",
			"version": 310,
			"versionNonce": 1416170259,
			"isDeleted": false,
			"id": "Fda7xEGv",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -416.9409473823975,
			"y": 155.4270832049183,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 268.17974853515625,
			"height": 25,
			"seed": 1429741171,
			"groupIds": [
				"6Db912Gp6Ndjcw3SWN_X4",
				"YZLhmlc_8hPpV2dK1mLlH"
			],
			"frameId": null,
			"roundness": null,
			"boundElements": [
				{
					"id": "26CnpcMihqmC99KnL4u8H",
					"type": "arrow"
				}
			],
			"updated": 1716542138826,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "swap(Node ptr1, Node ptr2)",
			"rawText": "swap(Node ptr1, Node ptr2)",
			"textAlign": "left",
			"verticalAlign": "top",
			"containerId": null,
			"originalText": "swap(Node ptr1, Node ptr2)",
			"lineHeight": 1.25
		},
		{
			"type": "ellipse",
			"version": 134,
			"versionNonce": 561296883,
			"isDeleted": false,
			"id": "vGmuQbUAbTGZ-IsuZuTyE",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -597.8243032309108,
			"y": -70.59704640860093,
			"strokeColor": "#f08c00",
			"backgroundColor": "transparent",
			"width": 235.12148596426005,
			"height": 96.71663736078915,
			"seed": 1035384659,
			"groupIds": [
				"YZLhmlc_8hPpV2dK1mLlH"
			],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1716542327050,
			"link": null,
			"locked": false
		},
		{
			"type": "rectangle",
			"version": 430,
			"versionNonce": 1158170685,
			"isDeleted": false,
			"id": "KkzbSgQ1rtoy-MUsGDqUf",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -1569.0537133264377,
			"y": -988.5238397833389,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 2888.42516730185,
			"height": 2564.82312740578,
			"seed": 785145523,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [],
			"updated": 1716543486070,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 122,
			"versionNonce": 2058020531,
			"isDeleted": false,
			"id": "mfBis018",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -1478.3007747507636,
			"y": -902.8026741351483,
			"strokeColor": "#1971c2",
			"backgroundColor": "transparent",
			"width": 1392.03857421875,
			"height": 106.27317831562209,
			"seed": 606178621,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1716542194951,
			"link": null,
			"locked": false,
			"fontSize": 85.01854265249767,
			"fontFamily": 1,
			"text": "Sort linked list using Bubble Sort",
			"rawText": "Sort linked list using Bubble Sort",
			"textAlign": "left",
			"verticalAlign": "top",
			"containerId": null,
			"originalText": "Sort linked list using Bubble Sort",
			"lineHeight": 1.25
		},
		{
			"type": "text",
			"version": 262,
			"versionNonce": 979663859,
			"isDeleted": false,
			"id": "K8lWEsOv",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1593.4933226684725,
			"y": -955.1325254832008,
			"strokeColor": "#1971c2",
			"backgroundColor": "transparent",
			"width": 1392.03857421875,
			"height": 106.27317831562209,
			"seed": 883962579,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1716542303106,
			"link": null,
			"locked": false,
			"fontSize": 85.01854265249767,
			"fontFamily": 1,
			"text": "Sort linked list using Bubble Sort",
			"rawText": "Sort linked list using Bubble Sort",
			"textAlign": "left",
			"verticalAlign": "top",
			"containerId": null,
			"originalText": "Sort linked list using Bubble Sort",
			"lineHeight": 1.25
		},
		{
			"id": "W9g5SpAO",
			"type": "text",
			"x": -908.3806794691045,
			"y": 527.6207941220341,
			"width": 360.4598083496094,
			"height": 525,
			"angle": 0,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"groupIds": [
				"F_H42UUS-3auG7CNzQU6K"
			],
			"frameId": null,
			"roundness": null,
			"seed": 1619698368,
			"version": 54,
			"versionNonce": 1590266560,
			"isDeleted": false,
			"boundElements": null,
			"updated": 1716558768197,
			"link": null,
			"locked": false,
			"text": "if (head==null) return;\n    \n    Node p = head;\n    Node k = tail;\n    \n    while(p != null) {\n        Node q = head;\n        While(q != k) {\n            if (q.info > q.next.info) {\n                int temp = q.info;\n                q.info = q.next.info;\n                q.next.info = temp;\n                isSwap = true;\n            }\n            q = q.next;\n        }\n        p = p.next;\n    }\n    if (isSwap == false) break;\n    k = q;\n    p = p.next;",
			"rawText": "if (head==null) return;\n    \n    Node p = head;\n    Node k = tail;\n    \n    while(p != null) {\n        Node q = head;\n        While(q != k) {\n            if (q.info > q.next.info) {\n                int temp = q.info;\n                q.info = q.next.info;\n                q.next.info = temp;\n                isSwap = true;\n            }\n            q = q.next;\n        }\n        p = p.next;\n    }\n    if (isSwap == false) break;\n    k = q;\n    p = p.next;",
			"fontSize": 20,
			"fontFamily": 1,
			"textAlign": "left",
			"verticalAlign": "top",
			"containerId": null,
			"originalText": "if (head==null) return;\n    \n    Node p = head;\n    Node k = tail;\n    \n    while(p != null) {\n        Node q = head;\n        While(q != k) {\n            if (q.info > q.next.info) {\n                int temp = q.info;\n                q.info = q.next.info;\n                q.next.info = temp;\n                isSwap = true;\n            }\n            q = q.next;\n        }\n        p = p.next;\n    }\n    if (isSwap == false) break;\n    k = q;\n    p = p.next;",
			"lineHeight": 1.25
		},
		{
			"id": "uIwXcHuxznn8Kh1LWruiC",
			"type": "rectangle",
			"x": -961.9826518063599,
			"y": 506.2494081739263,
			"width": 457.89003142732713,
			"height": 574.9063141370831,
			"angle": 0,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"groupIds": [
				"F_H42UUS-3auG7CNzQU6K"
			],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"seed": 1620537664,
			"version": 176,
			"versionNonce": 1254765248,
			"isDeleted": false,
			"boundElements": null,
			"updated": 1716558768197,
			"link": null,
			"locked": false
		}
	],
	"appState": {
		"theme": "dark",
		"viewBackgroundColor": "#ffffff",
		"currentItemStrokeColor": "#1e1e1e",
		"currentItemBackgroundColor": "transparent",
		"currentItemFillStyle": "solid",
		"currentItemStrokeWidth": 2,
		"currentItemStrokeStyle": "solid",
		"currentItemRoughness": 1,
		"currentItemOpacity": 100,
		"currentItemFontFamily": 1,
		"currentItemFontSize": 20,
		"currentItemTextAlign": "left",
		"currentItemStartArrowhead": null,
		"currentItemEndArrowhead": "arrow",
		"scrollX": 2420.656288370171,
		"scrollY": 720.4105707181556,
		"zoom": {
			"value": 0.29118013062139564
		},
		"currentItemRoundness": "round",
		"gridSize": null,
		"gridColor": {
			"Bold": "#C9C9C9FF",
			"Regular": "#EDEDEDFF"
		},
		"currentStrokeOptions": null,
		"previousGridSize": null,
		"frameRendering": {
			"enabled": true,
			"clip": true,
			"name": true,
			"outline": true
		},
		"objectsSnapModeEnabled": false
	},
	"files": {}
}
```
%%