import webbrowser
import os

url = 'file://' + os.getcwd() + '/' + os.environ["Wego"] + '/' + 'report.html'
webbrowser.open(url, 1)
