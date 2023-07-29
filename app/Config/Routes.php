<?php

namespace Config;

// Create a new instance of our RouteCollection class.
$routes = Services::routes();

/*
 * --------------------------------------------------------------------
 * Router Setup
 * --------------------------------------------------------------------
 */
$routes->setDefaultNamespace('App\Controllers');
$routes->setDefaultController('Home');
$routes->setDefaultMethod('index');
$routes->setTranslateURIDashes(false);
$routes->set404Override();
// The Auto Routing (Legacy) is very dangerous. It is easy to create vulnerable apps
// where controller filters or CSRF protection are bypassed.
// If you don't want to define all routes, please use the Auto Routing (Improved).
// Set `$autoRoutesImproved` to true in `app/Config/Feature.php` and set the following to true.
// $routes->setAutoRoute(false);

/*
 * --------------------------------------------------------------------
 * Route Definitions
 * --------------------------------------------------------------------
 */

// We get a performance increase by specifying the default
// route since we don't have to scan directories.
$routes->get('/', 'Login::index', ['filter' => 'noauth']);
$routes->match(['get', 'post'], '/login', 'Login::masuk', ['filter' => 'noauth']);
$routes->get('/logout', 'Login::keluar', ['filter' => 'auth']);

$routes->get('/dashboard', 'Dashboard::index', ['filter' => 'auth']);

$routes->get('/settings', 'Web::index', ['filter' => 'auth', 'filter' => 'authadmin']);
$routes->get('/settings/edit', 'Web::ubah', ['filter' => 'auth', 'filter' => 'authadmin']);
$routes->post('/settings/update/(:segment)', 'Web::ubah_data/$1', ['filter' => 'auth', 'filter' => 'authadmin']);

$routes->get('/admin', 'Users::index', ['filter' => 'auth', 'filter' => 'authadmin']);
$routes->get('/admin/add', 'Users::tambah', ['filter' => 'auth', 'filter' => 'authadmin']);
$routes->post('/admin/save', 'Users::simpan', ['filter' => 'auth', 'filter' => 'authadmin']);
$routes->get('/admin/edit/(:segment)', 'Users::ubah/$1', ['filter' => 'auth', 'filter' => 'authadmin']);
$routes->post('/admin/update/(:segment)', 'Users::ubah_data/$1', ['filter' => 'auth', 'filter' => 'authadmin']);
$routes->get('/admin/(:segment)', 'Users::detail/$1', ['filter' => 'auth', 'filter' => 'authadmin']);
$routes->post('/admin/searching', 'Users::pencarian', ['filter' => 'auth', 'filter' => 'authadmin']);
$routes->get('/admin/search/(:segment)', 'Users::cari/$1', ['filter' => 'auth', 'filter' => 'authadmin']);

$routes->get('/profile', 'Users::profil', ['filter' => 'auth']);
$routes->get('/password', 'Users::pass', ['filter' => 'auth']);
$routes->post('/newpassword', 'Users::ubah_password', ['filter' => 'auth']);

$routes->get('/items', 'Barang::data_barang', ['filter' => 'authoperator']);
$routes->get('/item', 'Barang::index', ['filter' => 'authoperator']);
$routes->get('/item/add', 'Barang::tambah', ['filter' => 'authoperator']);
$routes->post('/item/save', 'Barang::simpan', ['filter' => 'authoperator']);
$routes->get('/item/edit/(:segment)', 'Barang::ubah/$1', ['filter' => 'authoperator']);
$routes->post('/item/update/(:segment)', 'Barang::ubah_data/$1', ['filter' => 'authoperator']);
$routes->get('/item/(:segment)', 'Barang::detail/$1', ['filter' => 'authoperator']);
$routes->post('/item/searching', 'Barang::pencarian', ['filter' => 'authoperator']);
$routes->get('/item/search/(:segment)', 'Barang::cari/$1', ['filter' => 'authoperator']);

$routes->get('/supply', 'Suplai::index', ['filter' => 'authoperator']);
$routes->get('/supply/new', 'Suplai::tambah', ['filter' => 'authoperator']);
$routes->post('/supply/add', 'Suplai::tambah_barang', ['filter' => 'authoperator']);
$routes->post('/supply/edit', 'Suplai::edit_barang', ['filter' => 'authoperator']);
$routes->get('/supply/delete/(:any)', 'Suplai::hapus_barang/$1', ['filter' => 'authoperator']);
$routes->get('/supply/clear', 'Suplai::clear', ['filter' => 'authoperator']);
$routes->post('/supply/save', 'Suplai::simpan', ['filter' => 'authoperator']);
$routes->get('/supply/(:segment)', 'Suplai::detail/$1', ['filter' => 'authoperator']);
$routes->post('/supply/searching', 'Suplai::pencarian', ['filter' => 'authoperator']);
$routes->get('/supply/search/(:segment)', 'Suplai::cari/$1', ['filter' => 'auth']);
$routes->get('/supply/print/(:segment)', 'Suplai::print/$1', ['filter' => 'auth']);

$routes->get('/export', 'Keluar::index', ['filter' => 'authoperator']);
$routes->get('/export/new', 'Keluar::tambah', ['filter' => 'authoperator']);
$routes->post('/export/add', 'Keluar::tambah_barang', ['filter' => 'authoperator']);
$routes->post('/export/edit', 'Keluar::edit_barang', ['filter' => 'authoperator']);
$routes->get('/export/delete/(:any)', 'Keluar::hapus_barang/$1', ['filter' => 'authoperator']);
$routes->get('/export/clear', 'Keluar::clear', ['filter' => 'authoperator']);
$routes->post('/export/save', 'Keluar::simpan', ['filter' => 'authoperator']);
$routes->get('/export/(:segment)', 'Keluar::detail/$1', ['filter' => 'auth']);
$routes->post('/export/searching', 'Keluar::pencarian', ['filter' => 'auth']);
$routes->get('/export/search/(:segment)', 'Keluar::cari/$1', ['filter' => 'authkasir']);
$routes->get('/export/print/(:segment)', 'Keluar::print/$1', ['filter' => 'authkasir']);

$routes->get('/history', 'History::index', ['filter' => 'authkasir']);
$routes->post('/history/searching', 'History::pencarian', ['filter' => 'authkasir']);
$routes->get('/history/search/(:segment)', 'History::cari/$1', ['filter' => 'authkasir']);

/*
 * --------------------------------------------------------------------
 * Additional Routing
 * --------------------------------------------------------------------
 *
 * There will often be times that you need additional routing and you
 * need it to be able to override any defaults in this file. Environment
 * based routes is one such time. require() additional route files here
 * to make that happen.
 *
 * You will have access to the $routes object within that file without
 * needing to reload it.
 */
if (is_file(APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php')) {
    require APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php';
}
