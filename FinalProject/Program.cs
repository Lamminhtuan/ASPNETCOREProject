using FinalProject.Models;
using Microsoft.EntityFrameworkCore;
var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();
builder.Services.AddDbContext<ASPContext>(options => options.UseSqlServer(builder.Configuration.GetConnectionString("constring")));
var app = builder.Build();
GiohangsDAL.KhoiTao();
CtgiohangsDAL.KhoiTao();
TaikhoansDAL.KhoiTao();
YeuthichesDAL.KhoiTao();
// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
}
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
