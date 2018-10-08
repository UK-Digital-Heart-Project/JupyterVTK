FROM jupyter/scipy-notebook:265297f221de
USER jovyan

RUN git clone https://github.com/UK-Digital-Heart-Project/JupyterVTK.git

WORKDIR myK3D-jupyter

RUN pip install jupyter-pip ipywidgets vtk k3d

RUN jupyter nbextension install --py --user widgetsnbextension
RUN jupyter nbextension install --py --user k3d

RUN jupyter nbextension enable --py --user widgetsnbextension
RUN jupyter nbextension enable --py --user k3d

RUN mkdir -p $HOME/.jupyter
RUN echo "c.NotebookApp.token = ''" >> $HOME/.jupyter/jupyter_notebook_config.py
RUN echo "c.NotebookApp.password=''" >> $HOME/.jupyter/jupyter_notebook_config.py
RUN echo "c.NotebookApp.password_required=False" >> $HOME/.jupyter/jupyter_notebook_config.py
