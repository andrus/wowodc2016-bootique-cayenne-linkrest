A simple Bootique/Cayenne/LinkRest app created live at WOWODC 2016.

## Prerequisites - MySQL setup 

I used Docker on OSX with Kitematic (but you don't have to) :

```
docker run --name bq-mysql -e MYSQL_ROOT_PASSWORD=root -p 3306:3306 -d mysql:5.7
```

If this finishes successfully, MySQL should be available at 192.168.99.100:3306, and you can load the data:

```
cat demodb.sql | mysql -p -u root -h 192.168.99.100
```
