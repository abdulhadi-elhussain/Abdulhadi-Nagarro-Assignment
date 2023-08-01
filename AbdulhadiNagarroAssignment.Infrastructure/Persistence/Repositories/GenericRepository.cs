using System;
namespace AbdulhadiNagarroAssignment.Infrastructure.Persistence.Repositories
{
	public abstract class GenericRepository
	{

        protected readonly AccountsManagerContext context;

        protected GenericRepository(AccountsManagerContext context)
        {
            this.context = context;
        }
	}
}

