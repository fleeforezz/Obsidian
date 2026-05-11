>[!note]
> item = _context.Currencies.FirstOrDefault(c => c.CurrencyCode == "CAD");. `In SQL this line of code mean where currencyCode is CAD`. This like a condit>ion to execute the query
## Create

```C#
// insert
Console.WriteLine("Insert into Currency(CurencyCode, CurrencyName) value('CAD', Canada)");
item = _context.Currencies.FirstOrDefault(c => c.CurrencyCode == "CAD");
if (item != null) 
{
	item = new Currency();
	item.CurrencyCode = "CAD";
	item.CurrencyName = "Canada";
	_context.Add(item);
	_context.SaveChanges();
}
```

## Read

```C#
var AppointmentDetail = _context.AppointmentDetails.ToArray();

Console.WriteLine("Select * from <Table>");
foreach (var item in AppointmentDetail)
{
	Console.WriteLine("Appointment Detail Id: " + item.AppointmentDetailId);
	Console.WriteLine("Appointment Id: " + item.AppointmentId);
	Console.WriteLine("Service Id: " + item.ServiceId);
	Console.WriteLine("Is Perdiodic: " + item.IsPeriodic);
	Console.WriteLine("Day: " + item.Day);
	Console.WriteLine("Month: " + item.Month);
	Console.WriteLine("Year: " + item.Year);
}
```

## Read with condition

```C#
Console.WriteLine("Select * from Currencies where CurrencyCode = 'VND'");
var item = _context.Currencies.FirstOrDefault(c => c.CurrencyCode == "VND");
if (item != null)
{
    Console.WriteLine(item.CurrencyName);
}
```

## Update

```C#
// update
Console.WriteLine("Update Currency(CurencyCode = N"VND", CurrencyName) where CurrencyCode = "VND"");
item = _context.Currencies.FirstOrDefault(c => c.CurrencyCode == "VND");
if (item != null)
{
	item.CurrencyName = "Đồng";
	_context.Update(item);
	_context.SaveChanges();
}
```

## Delete

```C#
Console.WriteLine("Delete Currency where CurrencyCode = "VND"");
item = _context.Currencies.FirstOrDefault(c => c.CurrencyCode == "VND");
if (item != null)
{
	_context.Remove(item);
	_context.SaveChanges();
}
```
