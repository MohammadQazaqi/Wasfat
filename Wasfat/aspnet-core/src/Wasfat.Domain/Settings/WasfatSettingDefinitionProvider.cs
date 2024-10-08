using Volo.Abp.Settings;

namespace Wasfat.Settings;

public class WasfatSettingDefinitionProvider : SettingDefinitionProvider
{
    public override void Define(ISettingDefinitionContext context)
    {
        //Define your own settings here. Example:
        //context.Add(new SettingDefinition(WasfatSettings.MySetting1));
    }
}
