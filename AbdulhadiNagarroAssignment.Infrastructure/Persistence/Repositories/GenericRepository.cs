using System;
namespace AbdulhadiNagarroAssignment.Infrastructure.Persistence.Repositories
{
	public abstract class GenericRepository
	{

        protected readonly AccountsManagerContext context;

        public GenericRepository(AccountsManagerContext context)
        {
            this.context = context;
        }
	}
}

