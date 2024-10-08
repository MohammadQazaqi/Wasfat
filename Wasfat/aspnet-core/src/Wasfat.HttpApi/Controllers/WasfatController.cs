using Wasfat.Localization;
using Volo.Abp.AspNetCore.Mvc;

namespace Wasfat.Controllers;

/* Inherit your controllers from this class.
 */
public abstract class WasfatController : AbpControllerBase
{
    protected WasfatController()
    {
        LocalizationResource = typeof(WasfatResource);
    }
}
