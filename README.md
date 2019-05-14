# elasticsearch-realestate
Visualize real estate sales in France between 2014-2018 with Elasticsearch - Kibana. Import with Filebeat and Logstash

In 2019, the french government released publicly all the real estate sales made between 2014-2018.
In this project, we gonna use Elasticsearch and Kibana to visualize the real estate market.


We first download and enter in Elasticsearch the BANO data, which is the list of all the known addresses in France.
From there, we will be able to query Elasticsearch by address and get the geo coordinates in return. This will allows us to visualize our data in a map.

When it's done, we'll use logstash to enrich our real estate data and add geo locations with longitude-latitude.
Finally, we'll upload that into our Elasticsearch cluster, and visualize the result through Kibana.



# Sources
To run this project, you first need to get the real estates .csv files, from https://www.data.gouv.fr/fr/datasets/demandes-de-valeurs-foncieres/

Then, we'll need to download locally (or on your server if you use a server) the BANO files. To get them, simply execute the BANO/download.sh file.
Put it into a bano-data folder.


# Elasticsearch configuration
This project uses an Elasticsearch instance hosted on Amazon Elasticsearch.
Once your ES is running, you'll have to change your access credentials / host in the logstash *.conf files

# Upload the BANO to query the coordinates
First, we'll correct, enrich and upload our BANO data.
Go into the BANO folder, and execute the import.sh file.
First ensure that your logstash executable is in the PATH.

When it's done, your BANO data are loaded in your Elasticsearch instance. You are now able to _search data from Elasticsearch, as well as enriching the real estate addresses with geo-coordinates


# Enrich the real estate data with geo-coordinates and upload in Elasticsearch
Go into the valeursfoncieres folder.

From there, we will execute logstash to enrich our data and load them into Elasticsearch.
Load logstash through the logstash -r -f bano-enrich.conf command.

Logstash is now running and listening for filebeat. We'll then use filebeat to read our data and stream it into Logstash.
Simply launch the filebeat_launch.sh shell, and the data will be enriched and loaded.


# Verify and Analyse
The data are now indexed into our Elasticsearch instance. You can verity it by running a 
``` GET realestates/_search ```
or
``` GET realestates/_mapping ```


If everything is fine, you can now log into Kibana and analyze the data.
