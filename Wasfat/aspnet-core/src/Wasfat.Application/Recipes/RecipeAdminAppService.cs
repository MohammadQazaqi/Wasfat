using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;
using Volo.Abp.Domain.Repositories;

namespace Wasfat.Recipes
{
    public class RecipeAdminAppService : CrudAppService<Recipe, RecipeDto, int, PagedAndSortedResultRequestDto>, IRecipeAppService
    {
        public RecipeAdminAppService(
            IRepository<Recipe, int> repository
            )
        : base(repository)
        {
                
        }


        public override async Task<RecipeDto> GetAsync(int id)
        {
            var recipe = await Repository.GetAsync(id);

            // custome logic
            recipe.Name = recipe.Name.Trim();

            var recipeDto = ObjectMapper.Map<Recipe, RecipeDto>(recipe);

            return recipeDto;
        }

    }
}
