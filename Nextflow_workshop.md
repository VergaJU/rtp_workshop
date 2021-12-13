# Nextflow workshop
Setted unp all the environment, conda basic usage.

Created the conda envirnomnet named *test_env*, installed fastqc into the environment.
```
conda create -n test_env
conda install bioconda::fastqc
conda env export > environment.yml
```
And the ncreate the Dockerfile:
```
FROM nfcore/base:1.14
LABEL authors="Jacopo Verga" \
      description="Docker container containing fastqc"

WORKDIR ./
COPY environment.yml ./
RUN conda env create -f environment.yml && conda clean -a
ENV PATH /opt/conda/envs/test_env/bin:$PATH

```

Build and push in docker:
```
docker build -t vergaju/test $(pwd)
docker login (maybe chmod 666 /var/run/docker.sock will avoid to login everytime)
docker push vergaju/test
```

And pull with singularity:
```
singularity pull --name test.img docker://vergaju/test
```
To open the environment and check fastqc
```
singularity shell test.img 
whereis fastqc
```
The create a new repository in github, inizialise with a README.md file.

