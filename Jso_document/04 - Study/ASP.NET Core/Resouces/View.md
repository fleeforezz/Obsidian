> [!note]
> View is a web page (.cshtml) that is responsible for containing presentation logic that merges data along with static design code(HTML)

+  Controller creates an object of ViewModel and fills data in its properties.
+ Controller selects an appropriate view and invorks the same view & supplies object of ViewModel.
+ View access the ViewModel.

![[View.png]]

Test project structure

![[Project Structure.png]]

We will also have to add service:

```C#
builder.Services.AddControllerWithViews();
```

Here is how directory works:

```C#
using Microsoft.AspNetCore.Mvc;

namespace ViewsExample.Controllers 
{
	public class TestController : Controller 
	{
		[Route("home")]
		public IActionResult Index() 
		{
			return View();
		}
	}
}
```

> [!note]
> By default, if we return a View with no name, it will return a view with directory to Views folder like this: Views/Test/Index.cshtml

> [!note]
> "return View("abc");"
> We can also put the same name of the file into View as parament, it will return like this: Views/Test/abc.cshtml
 
+ Views is a folder, Test is a subfolder(followed by Controller's name)
+ Index is the .cshtml file, which is action method's name

If Index.cshtml is not located in Views/Test, [ASP.Net](http://asp.net/) core couldn't recognize that, and that will be error. If it isn't found in Views/Test folder, it will also look for the file in Views/Shared folder.

![[cshtml.png]]

+ View contains HTML markup with Razor markup (C# code in view to render dynamic content).
+ Razor is the view engine that defines syntax to write C# code in the view. "@" is the syntax of Razor syntax.
+ View is NOT supposed to have lots of C# code. Any code written in the view should relate to presenting the content (presentation logic).
+ View should neither directly call the business model, nor call the controller's action methods. But it can send requests to controllers.

### View Data

View data is a directory object that is automatically created up on receiving a request and will automatically sending response to the client.

It is mainly used to send data from controller to view.

ViewData is a property of <mark style="background: #ABF7F7A6;">Microsoft.AspNetCore.Mvc.Controller</mark> class and <mark style="background: #ADCCFFA6;">Microsoft.AspNetCore.Mvc.Razor.RazorPage</mark> class.

It is of <mark style="background: #FFF3A3A6;">Microsoft.AspNet.Mvc.ViewFetures.ViewDataDirectory</mark> type.

```C#
namespace Microsoft.AspNetCore.Mvc
{
	public abstract class Controller : ControllerBase
	{
		public ViewDataDictionary ViewData { get; set; }
	}
}
```

+ It is derived from IDictionary<KeyValuePair<string, object>> type.
+ That means, it acts as a dictionary of key/value pairs.
+ Key is of string type.
+ Value is of object type.

### ViewData - Properties and Methods

+ <mark style="background: #FFB8EBA6;">int Count { get; set; }</mark> //Get the number of elements.
+ <mark style="background: #FF5582A6;">[string key]</mark> //Gets or sets an elements.
+ <mark style="background: #FFB86CA6;">Add(string key, object value)</mark> //Adds a new element. 
+ <mark style="background: #FFF3A3A6;">ContainsKey(string key)</mark> //Determine whether the specified key exists or not.
+ <mark style="background: #BBFABBA6;">Clear()</mark> //Clears (removes) all elements. 

```HTML
<!DOCTYPE html>
<html>
	<head>
		<title>
			@ViewData["title"]
		</title>
		<meta charset="utf-8" />
		<link href="~/css/style.css" rel="stylesheet" />
	</head>
	<body>
	...
```




