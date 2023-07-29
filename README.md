# PROJECT UAS INVENTORY GUDANG MENGGUNAKAN CODEIGNITER 4
<li>Nama Kelompok:</li>
<li>Nama Anggota:</li>

## System Requirement

1. Minimal PHP 7.4
2. XAMPP sebagai web server
3. Kami menggunakan MySQL sebagai database

## Cara Installasi dan Menjalankan Program

1. Extract Zip File, Kemudian Buka File
2. Ketik <code>composer install</code>
3. Buat database baru bernama <code>inventroy</code>
4. Rename <code>.env.example</code> jadi <code>.env</code> atau ketik <code>cp .env.example .env<code>
5. Konfigurasi database di <code>.env</code> sesuai web server yang digunakan(Kami memakai MySQL)
6. Atur CI_ENVIRONMENT=production jadi CI_ENVIRONMENT=development (optional)
7. Ketik <code>php spark migrate</code> atau Impor inventory.sql ke database yang dibuat pada server
8. Kemudian check terkait ketentuan pada table apakah data masuk atau tidak.
9. Jika dirasa semua vendor sudah diinstal atau diupdate(bisa menggunakan<code>composer update<code> terutama vendor dompdf dan vendor cart https://github.com/jason-napolitano/CodeIgniter4-Cart-Module.
9. Jalankan php spark serve
10. Selesai.

# USER DEFAULT

<b>Admin:</b>
<p>username: admin</p>
<p>password: admin123</p>

<b>Operator:</b>
<p>username: maudy</p>
<p>password: maudy123</p>

<b>Kasir:</b>
<p>username: diki</p>
<p>password: diki123</p>