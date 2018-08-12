# Meeseeks
VM setup for Malware RE labs

### Download and install a hypervisor of your choice.
* Vmware Workstation (you can get a trial license for 30 days)
* Virtualbox (free)
* Hyper-V (pre-installed in some MSFT enterprise machines)

### Set up Carrie, the Victim VM
1. Download VM from here https://developer.microsoft.com/en-us/microsoft-edge/tools/vms/
2. Select Win7, and the hypervisor you will be using. Import the VM into your hypervisor.
3. Take a snapshot at this stage. Call it "Initial"
4. Follow the instructions in Carrie.ps1
5. Take a snapshot at this stage. Call it "Clean"

### Set up Sue, the Sniffer VM
1. Download a REMnux image here: https://remnux.org/
2. Import the image into your hypervisor
3. Take a snapshot at this stage. Call it "Initial"
4. In the terminal window, run
    
        wget <url to raw Sue.sh>
        sudo chmod +x Sue.sh
        sudo ./Sue.sh

5. Take a snapshot at this stage. Call it "Ready"

### For both VMs
1. Go to Settings > Network and change the network adapter to "Host-only Adapter"
2. Devices->Drag and Drop->Bidrectional
3. Devices->Shared Clipboard->Bidirectional