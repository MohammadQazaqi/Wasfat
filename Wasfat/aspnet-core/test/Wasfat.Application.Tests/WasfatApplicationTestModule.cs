using Volo.Abp.Modularity;

namespace Wasfat;

[DependsOn(
    typeof(WasfatApplicationModule),
    typeof(WasfatDomainTestModule)
    )]
public class WasfatApplicationTestModule : AbpModule
{

}
