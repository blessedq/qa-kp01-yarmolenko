import sys
import pip._vendor.requests as requests

n = len(sys.argv)
Request = "http://localhost:8888/" + sys.argv[2]

response = ""
if sys.argv[1] == "get":
	response = requests.get(Request)
if sys.argv[1] == "post":
	response = requests.post(Request)
if sys.argv[1] == "patch":
	response = requests.patch(Request)
if sys.argv[1] == "delete":
	response = requests.delete(Request)

print("Response: ", response.status_code + response.json())

