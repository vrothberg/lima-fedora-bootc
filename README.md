# lima-fedora-bootc
A Lima template to create and run fedora-bootc VMs on the Mac.  [Lima](https://lima-vm.io/) is a widely used tool on the Mac to run Linux VMs and offers a convenient experience in the terminal to create, run and manage VMs.  This project here aims to allow for running [Fedora bootc](https://docs.fedoraproject.org/en-US/bootc/) VMs via lima.  For more information on bootc, please refer to the [upstream documentation](https://containers.github.io/bootc/).  The instructions below assume that you are running [Podman](https://podman.io/) on an ARM Mac.  You can install Lima via `brew install lima`.

## Create a disk image
In order to boot a VM, we first need to create a raw disk image.  The first step in that process is adding some packages to the `fedora-bootc` base container image via `make build-container-image`.  Run `make build-raw-image` to creat the raw disk image which will be placed in the `./output` directory.

The conversion to a disk image uses the [bootc-image-builder](https://github.com/osbuild/bootc-image-builder) tool which requires your local podman-machine to run in rootful mode:
```bash
$ podman machine stop   # if already running
Waiting for VM to exit...
Machine "podman-machine-default" stopped successfully
$ podman machine set --rootful
$ podman machine start
```

If you prefer running CentOS Stream, run `make DOCKERFILE=Dockerfile-centos-stream build-container-image`.

## Run a fedora-bootc VM
To create and run a local fedora-bootc via Lima:
```bash
$ limactl create fedora-bootc.yaml
$ limactl start fedora-bootc
```

Now you are ready to SSH into the container via `limactl shell fedora-bootc`.
