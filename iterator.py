#!/usr/bin/python
#
# import requests module
#
# requester.py


import requests

# As needed, use tokens/headers for appropriate privliges 
headers = {'Cookie': 'cookie_name=cookie_value'}

# create loops for modularity
# As required, iterate on the appropriate perameter 
n = 0
outfile=open("bugfiles.txt", "a")
while n <= 100:
	page = requests.get('http://domain_name/file_download.php?file_id='+str(n)+'&type=bug', headers=headers)
	result = page.url+"\n"+page.content+"\n\n"
	outfile.write(result)
	n+=1
#mamadou is practicing