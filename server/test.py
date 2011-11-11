import urllib2, random

number = 0

while(1):
    x_coord = random.randrange(1,1280)
    y_coord = random.randrange(1,800)
    url = "http://75.102.65.203:8080/move/%s/%s" % (x_coord, y_coord) 
    urllib2.urlopen(url).read()
