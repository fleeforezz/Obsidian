
# Install [[HACS]]

> To get inside home assistant container type:

```shell
sudo docker exec -it homeassistant bash
```

> Run the HACS download script.

```shell
wget -O - https://get.hacs.xyz | bash -
```

## Badge template

```
#Showing the state of a temperature in a template card:
{{ states('sensor.your_temperature_sensor') }}

#Change the colour of the light depending on status:
{% if is_state('light.your_light', 'on') %}
  orange
{% endif %}

#Welcome template:
{% set time = now().hour %}
{% if (time >= 18) %}
  Good Evening, {{user}}!
{% elif (time >= 12) %}
  Good Afternoon, {{user}}!
{% elif (time >= 5) %}
  Good Morning, {{user}}!
{% else %}
  Hello, {{user}}!
{% endif %}
```
