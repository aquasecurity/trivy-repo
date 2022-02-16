# trivy-repo
deb/rpm repository for Trivy

## Debian/Ubuntu

```
$ sudo apt-get install apt-transport-https
$ wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
$ echo deb https://aquasecurity.github.io/trivy-repo/deb [CODE_NAME] main | sudo tee -a /etc/apt/sources.list
$ sudo apt-get update
$ sudo apt-get install trivy
```

`CODE_NAME` can be one of the following supported versions

code name | version
--------- | -------
focal     | Ubuntu 20.04
bionic    | Ubuntu 18.04
xenial    | Ubuntu 16.04
trusty    | Ubuntu 14.04
buster    | Debian 10
stretch   | Debian 9
jessie    | Debian 8
wheezy    | Debian 7

## RHEL/CentOS

Add repository setting

```
$ sudo vim /etc/yum.repos.d/trivy.repo
[trivy]
name=Trivy repository
baseurl=https://aquasecurity.github.io/trivy-repo/rpm/releases/$releasever/$basearch/
gpgcheck=0
enabled=1
$ sudo yum -y update
$ sudo yum -y install trivy
```
