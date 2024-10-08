using System.Threading.Tasks;
using Volo.Abp.DependencyInjection;

namespace Wasfat.Data;

/* This is used if database provider does't define
 * IWasfatDbSchemaMigrator implementation.
 */
public class NullWasfatDbSchemaMigrator : IWasfatDbSchemaMigrator, ITransientDependency
{
    public Task MigrateAsync()
    {
        return Task.CompletedTask;
    }
}
