using System;
using System.Collections.Generic;
using System.Text;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;

namespace Wasfat.Recipes
{
    public interface IRecipeAppService : ICrudAppService<
             RecipeDto,
             int,
             PagedAndSortedResultRequestDto>
    {
    }
}
