
internal static class EntryPoint
{
    public static void Main(string[] args) 
    {
        var builder = Host.CreateDefaultBuilder(args).ConfigureWebHostDefaults(webBuilder => 
        {
            webBuilder.UseStartup<StartUp>()
                .UseKestrel(options => { })
                .UseUrls("http://*:5000");
        });

        var app = builder.Build();
        app.Run();
    }

    public class StartUp 
    {
        public void ConfigureServices(IServiceCollection services) 
        {
            services.AddControllers();
        }

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env) 
        {
            app.UseRouting();
            app.UseEndpoints(endpoints => 
            {
                endpoints.MapControllers();
            });
        }
    }
}