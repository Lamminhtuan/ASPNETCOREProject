using FinalProject.Models;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.EntityFrameworkCore;
var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();
builder.Services.AddDbContext<ASPContext>(options => options.UseSqlServer(builder.Configuration.GetConnectionString("constring")));
builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme).AddCookie(options =>
{
    options.LoginPath = "/Taikhoans/DangNhap";
    options.Cookie.Name = "ASPCookie";
});
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
app.UseAuthentication();
app.UseAuthorization();
app.UseCookiePolicy();
app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
