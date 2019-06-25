import os

c.NotebookApp.token = ""
c.NotebookApp.password = ""
c.NotebookApp.ip = "0.0.0.0"
c.NotebookApp.port = 8888
c.NotebookApp.open_browser = False
c.NotebookApp.notebook_dir = "/home/user"
c.MultiKernelManager.default_kernel_name = os.environ["DEFAULT_KERNEL_NAME"]
