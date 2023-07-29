<?= $this->extend('admin/layout/template'); ?>
<?= $this->section('content'); ?>
<?= $this->include('admin/layout/fungsi') ?>
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                <div class="form-group row">
                    <div class="col-sm-6">
                        <a href="<?= base_url('supply') ?>" class="btn btn-default"><i class="fas fa-undo"></i> Kembali</a>
                        <a href="<?= base_url('supply/print/' . $suplai['id_suplai']) ?>" class="btn btn-danger" target="_blank"><i class="fas fa-print"></i> Print</a>
                    </div>
                    <div class="col-sm-6">
                        <p class="float-right">Tanggal input : <?= datetime($suplai['created_at']) ?></p>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">ID</label>
                    <p class="col-sm-10 col-form-label"><?= $suplai['id_suplai'] ?></p>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Penyuplai</label>
                    <p class="col-sm-10 col-form-label"><?= $suplai['penyuplai'] ?></p>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Tanggal Masuk</label>
                    <p class="col-sm-10 col-form-label"><?= tanggal($suplai['tanggal']) ?></p>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Keterangan</label>
                    <p class="col-sm-10 col-form-label"><?= nl2br($suplai['keterangan']) ?></p>
                </div>

                <div class="form-group">
                    <table id="dataTable1" class="table table-bordered table-hover table-striped table-valign-middle">
                        <thead align="center">
                            <tr>
                                <td style="width: 70px;">No.</td>
                                <td>Nama Barang</td>
                                <td style="width: 200px;">Jumlah</td>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $i = 1;
                            foreach ($suplaiDetail as $data) : ?>
                                <tr align="center">
                                    <td><?= $i++ ?></td>
                                    <td align="left"><?= $data['nm_barang'] ?></td>
                                    <td><?= ribuan($data['jumlah']) . ' ' . $data['satuan'] ?></td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<?= $this->endSection(); ?>