class CfgPatches
{
	class Armakart
	{
		// Meta information for editor
		name = "Armakart";
		author = "Njpatman";
		requiredAddons[] = {"CBA_main"};
		units[] = {};
		weapons[] = {};
	};
};

class CfgMissions
{
	class MPMissions
	{
		//--- ZEUS
		class ATF_Armakart_Persistent // class name MUST match the name in the 'directory' path
		{
			directory = "NJP_Armakart\Scenarios\ATF_Armakart_Persistent.Stratis"; // <--- match
		};
	};
};