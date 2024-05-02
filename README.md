# trivy-repo
deb/rpm repository for Trivy

## Debian/Ubuntu

```
$ sudo apt-get install wget apt-transport-https gnupg
$ wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --dearmor | sudo tee /usr/share/keyrings/trivy.gpg > /dev/null
$ echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb generic main" | sudo tee -a /etc/apt/sources.list.d/trivy.list
$ sudo apt-get update
$ sudo apt-get install trivy
```

## RHEL/CentOS

Add repository setting

```
$ sudo tee /etc/yum.repos.d/trivy.repo << 'EOF'
[trivy]
name=Trivy repository
baseurl=https://aquasecurity.github.io/trivy-repo/rpm/releases/$basearch/
gpgcheck=1
enabled=1
gpgkey=https://aquasecurity.github.io/trivy-repo/rpm/public.key
EOF
```
Using `yum`:
```
$ sudo yum -y update
$ sudo yum -y install trivy
```
Using `dnf`:
```
$ sudo dnf -y update
$ sudo dnf -y install trivy
```