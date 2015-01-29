Web Sim monitor (Php/Html)
===

**DEMO :** http://sakarias.eu/monitor/

1. Download the files
2. Upload them to your webhost
3. Ensure the apache directory is writable (chmod 777 -R)
4. Drop the "Monitor.lsl" inside a prim, edit it to change the url
5. Wait some seconds and it will start logging the sim stats

<img src="http://i.imgur.com/GlxsF3i.png" style="width:50%;">

(This is a basic template, you can mod it to fit your needs, it's using raw text files to store values right now, so it might be good to delete the text files once every few days so they don't get huge.
I will create a mysql version later.)
