using Wasfat.EntityFrameworkCore;
using Volo.Abp.Autofac;
using Volo.Abp.Modularity;

namespace Wasfat.DbMigrator;

[DependsOn(
    typeof(AbpAutofacModule),
    typeof(WasfatEntityFrameworkCoreModule),
    typeof(WasfatApplicationContractsModule)
    )]
public class WasfatDbMigratorModule : AbpModule
{
}
