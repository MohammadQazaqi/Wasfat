using Wasfat.EntityFrameworkCore;
using Volo.Abp.Modularity;

namespace Wasfat;

[DependsOn(
    typeof(WasfatEntityFrameworkCoreTestModule)
    )]
public class WasfatDomainTestModule : AbpModule
{

}
