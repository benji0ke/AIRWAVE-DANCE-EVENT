Airwave Dance site

This site is created as a school project to best help and understand Web Development.

How it works

When a user enters [https://benji0ke.github.io/Airwave-Dance-Event/](https://benji0ke.github.io/Airwave-Dance-Event/) in a browser,
the browser breaks the URL into parts — scheme (`https`), hostname (`benji0ke.github.io`), and path (`/Airwave-Dance-Event`). 
It then asks the DNS resolver for the server’s IP address. The resolver follows the DNS chain (root → TLD → authoritative) until it finds the correct IP and sends it back.


The site consists of a Homepage which has links to different pages like about, schedule, registration, judges and contact information.

The website can be run locally using Docker with a lightweght Nginx server

Make sure Docker Desktop is running, then open your terminal inside the project folder and run:

docker build -t web-skeleton

This builds a image called web skeleton

Start a container and map it to you local port by running:
 Docker-compose up

Open browser and visit:
 http://localhost:8080

Browser → localhost:8080 → Docker (Nginx) → /usr/share/nginx/html → home.html

Link To the Live Site 

https://benji0ke.github.io/AIRWAVE-DANCE-EVENT/
