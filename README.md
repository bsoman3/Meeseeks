# Meeseeks
VM setup for Malware RE labs. Follow the steps below, **celebrate at the correct times**, and create issues on github if you face any problems.

### Download and install a hypervisor of your choice.
* Vmware Workstation (you can get a trial license for 30 days)
* Virtualbox (free) <- preferred
* Hyper-V (pre-installed in some MSFT enterprise machines)

### Set up Carrie, the Victim VM
1. Download VM from [here](https://developer.microsoft.com/en-us/microsoft-edge/tools/vms/).
2. Select Win7 with IE8, and the hypervisor you will be using. Import the VM into your hypervisor.
3. Use the Settings menu to increase the RAM to 2048
4. Take a snapshot at this stage. Call it "Initial-Carrie".
5. Enable Shared Clipboard in VM settings.
6. In an administrator powershell, run:

        PS C:\Windows\system32> Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/bsoman3/Meeseeks/master/Carrie.ps1'))

6. Take a snapshot at this stage. Call it "Clean".
7. **Celebrate!!** [Sample jig for celebration](https://www.youtube.com/watch?v=7PCkvCPvDXk)

### Set up Sue, the Sniffer VM
1. Download a REMnux image [here](https://remnux.org/).
2. Import the image into your hypervisor.
3. Take a snapshot at this stage. Call it "Initial-Sue"
4. Enable Shared Clipboard in VM settings.
5. In the terminal window, run
    
        remnux@remnux:~$ wget https://raw.githubusercontent.com/bsoman3/Meeseeks/master/Sue.sh
        remnux@remnux:~$ sudo chmod +x Sue.sh
        remnux@remnux:~$ sudo ./Sue.sh

6. Take a snapshot at this stage. Call it "Ready".
7. **Celebrate!!** [Sample jig for celebration](https://www.youtube.com/watch?v=OPf0YbXqDm0)

### For both VMs
* If you have Virtualbox or VMware
    1. Go to Settings > Network and change the network adapter to "Host-only Adapter".
    2. Devices > Drag and Drop > Bidrectional

* If you have Hyper-V
    1. Create a new Internal Virtual Switch.
    2. Connect both your virtual machines to that switch.
    3. Gotcha: Hyper-V doesn't allow bi-directional clipboard. In the menu bar on the VM window, there is a "Clipboard" option. You will be using that instead.

### Testing your setup
1. Ping from Carrie to Sue.
        
        PS C:\Users\IEUser> ping 192.168.12.1

2. Ping from Sue to Carrie.
        
        remnux@remnux:~$ ping 192.168.12.2

3. Start inetsim on Sue by
    
        remnux@remnux:~$ inetsim

4. Open Google chrome on Carrie and type `192.168.12.1` in the address bar. You should see the the default html page for Inetsim

### Celebrate with favourite snack, ice cream or dance jig
* Celebration is a really important part of learning. [Here](https://www.youtube.com/watch?v=vjW8wmF5VWc) is another classy dance song in case you need ideas.
