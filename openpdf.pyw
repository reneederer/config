import http.server
import socketserver
import subprocess
import os
import re
import time

# Define the directory you want to serve
web_dir = 'c:/'  # Adjust as needed
os.chdir(web_dir)

class CustomHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        # Check if the requested path matches the URL you want to trigger the process
        if self.path.endswith('.pdf'):
            # Convert URL path to a file path
            file_path = re.sub(r'^/+', 'c:/', self.path)  # Adjust the regex to match the URL path
            
            # Start the process to open the PDF file
            pdf_reader_path = r'C:\Program Files (x86)\Foxit Software\Foxit PDF Reader\FoxitPDFReader.exe'
            subprocess.Popen([pdf_reader_path, file_path])
            
            # Send redirect header to indicate the process has started
            self.send_response(302)
            self.send_header('Location', re.sub(r'^(.*?)[^/]*$', r'\1', self.path))
            self.end_headers()
        else:
            super().do_GET()

def main():
    # Define the server port
    PORT = 8970
    
    # Set up the server
    with socketserver.TCPServer(("", PORT), CustomHandler) as httpd:
        print("Serving at port", PORT)
        import ctypes
        import os
        import win32process

        hwnd = ctypes.windll.kernel32.GetConsoleWindow()      
        if hwnd != 0:      
            ctypes.windll.user32.ShowWindow(hwnd, 0)      
            ctypes.windll.kernel32.CloseHandle(hwnd)
            _, pid = win32process.GetWindowThreadProcessId(hwnd)
            os.system('taskkill /PID ' + str(pid) + ' /f')
        httpd.serve_forever()

main()
