# Meeseeks
VM setup for Malware RE labs. Follow the steps below, **celebrate at the correct times**, and create issues on github if you face any problems.

### Download and install a hypervisor of your choice.
* Vmware Workstation (you can get a trial license for 30 days)
* Virtualbox (free)
* Hyper-V (pre-installed in some MSFT enterprise machines)

### Set up Carrie, the Victim VM
1. Download VM from [here](https://developer.microsoft.com/en-us/microsoft-edge/tools/vms/)
2. Select Win7 with IE8, and the hypervisor you will be using. Import the VM into your hypervisor.
3. Take a snapshot at this stage. Call it "Initial"
4. Follow the instructions in Carrie.ps1
5. Take a snapshot at this stage. Call it "Clean"
6. ** Celebrate!! ** [Sample jig for celebration](https://www.youtube.com/watch?v=7PCkvCPvDXk)

### Set up Sue, the Sniffer VM
1. Download a REMnux image [here](https://remnux.org/)
2. Import the image into your hypervisor
3. Take a snapshot at this stage. Call it "Initial"
4. In the terminal window, run
    
        wget <url to raw Sue.sh>
        sudo chmod +x Sue.sh
        sudo ./Sue.sh

5. Take a snapshot at this stage. Call it "Ready"
6. ** Celebrate!! ** [Sample jig for celebration](https://www.youtube.com/watch?v=OPf0YbXqDm0)

### For both VMs
1. Go to Settings > Network and change the network adapter to "Host-only Adapter"
2. Devices->Drag and Drop->Bidrectional
3. Devices->Shared Clipboard->Bidirectional

### Testing your setup
1. Ping from Carrie to Sue.
        
        PS C:\Users\IEUser> ping 192.168.12.1

2. Ping from Sue to Carrie.
        
        remnux@remnux:~$ ping 192.168.12.2

3. Start inetsim on Sue by
    
        remnux@remnux:~$ inetsim

4. Open Google chrome on Carrie and type 192.168.12.1 in the address bar. You should see the the default html page for Inetsim

### Celebrate with favourite snack, ice cream or dance jig
* Celebration is a really important part of learning. [Here](https://www.youtube.com/watch?v=vjW8wmF5VWc) is another classy dance song in case you need ideas.
