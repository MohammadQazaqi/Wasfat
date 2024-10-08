using System;
using System.Collections.Generic;
using System.Text;
using Wasfat.Localization;
using Volo.Abp.Application.Services;

namespace Wasfat;

/* Inherit your application services from this class.
 */
public abstract class WasfatAppService : ApplicationService
{
    protected WasfatAppService()
    {
        LocalizationResource = typeof(WasfatResource);
    }
}
