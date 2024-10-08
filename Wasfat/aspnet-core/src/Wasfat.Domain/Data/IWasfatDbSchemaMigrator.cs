using System.Threading.Tasks;

namespace Wasfat.Data;

public interface IWasfatDbSchemaMigrator
{
    Task MigrateAsync();
}
