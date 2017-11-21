# win2016setuid
A powershell script for setting AD Unix attributes on Windows Server 2016

Microsoft has removed Unix Identiy Management from Windows Server 2016 [1].
As a consequence, the tab "Unix atributes" has disappeared from the user properties in AD domain user management.
However, the Unix attributes still appear to exist in Windows Server 2016 and can be set and modified programmatically.

The script adds the following AD attributes to an existing user:
* msSFU30Name
* uid
* msSFU30NisDomain
* uidNumber
* gidNumber
* loginShell
* unixHomeDirectory

Users should carefully check the values assigned to the respective attributes, since some of them depend on the individual domain.

The script has been deployed and tested on a Win 2016 Server Essentials instance, which was integrated as DC into an existing AD domain running a Windows Server 2008 DC controller.
Feedback on deployments in other configurations is welcome.

[1] https://blogs.technet.microsoft.com/activedirectoryua/2016/02/09/identity-management-for-unix-idmu-is-deprecated-in-windows-server/
