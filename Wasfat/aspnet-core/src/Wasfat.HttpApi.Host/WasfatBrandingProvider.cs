using Volo.Abp.DependencyInjection;
using Volo.Abp.Ui.Branding;

namespace Wasfat;

[Dependency(ReplaceServices = true)]
public class WasfatBrandingProvider : DefaultBrandingProvider
{
    public override string AppName => "Wasfat";
}
