@extends('layouts.client.mainlayout')
@section('title','CRUD')

@section('content')
@if(session('success'))
<div id="notification" class="alert alert-success">
    {{ session('success') }}
</div>
<script>
    setTimeout(function() {
        document.getElementById('notification').style.opacity = '0';
        setTimeout(function() {
            document.getElementById('notification').style.display = 'none';
        }, 500); 
    }, 2000); 
</script>
@endif
<section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Daftar Produk</h1>
          <form class="d-flex mt-3" role="search" action="/crud/cari" method="get">
            <input class="form-control me-2" type="text" name="cari" placeholder="Cari produk..." aria-label="Cari produk..." value="{{ old('cari') }}">
            <button class="btn btn-primary" type="submit">Cari</button>
          </form>
        </div>
      </div>
    </div><!-- /.container-fluid -->
</section>
<section class="content">
    <div class="container-fluid">
        <!-- =========================================================== -->
        <h5 class="mt-1 mb-2"></h5>
        <div class="table-responsive">
            <table class="table table-striped table-dark">
                <thead>
                <tr>
                    <th>No</th>
                    <th>Nama Produk</th>
                    <th>Gambar</th>
                    <th>Kategori</th>
                    <th>Deskripsi</th>
                    <th>Harga</th>
                    <th>Stok</th>
                    <th>Link</th>
                </tr>
                </thead>
                @php
                    $no = ($products->currentPage() - 1) * $products->perPage() + 1;
                @endphp
                @if($products->count() > 0)
                    @foreach ($products as $p)
                    <tbody>
                        <td>{{ $no++ }}</td>
                        <td>{{ ucwords($p->product_name) }}</td>  
                        <td>
                        <img src="{{ asset($p->image) }}" alt="Gambar Produk" width="100">
                        </td>          
                        <td>{{ ucwords($p->category_name) }}</td>  
                        <td>{{ ucwords($p->description) }}</td>                
                        <td>Rp {{ $p->price }}</td>
                        <td>{{ $p->stock }}</td>
                        <td><a class="btn btn-primary" href="{{ $p->link }}" target="_blank" role="button">Link Produk</a></td>
                    </tbody>
                    @endforeach
                @else
                    <td colspan="9">Data tidak ditemukan</td>
                @endif
            </table>
        </div>
      </div>
      <!-- Awal Pagination --> 
      <div class="d-flex justify-content-center">
        <ul class="pagination">
            @if ($products->onFirstPage())
                <li class="page-item disabled"><span class="page-link">Previous</span></li>
            @else
                <li class="page-item"><a class="page-link" href="{{ $products->previousPageUrl() }}">Previous</a></li>
            @endif
        
            @for ($i = max(1, $products->currentPage() - 1); $i <= min($products->lastPage(), $products->currentPage() + 1); $i++)
                <li class="page-item {{ $i == $products->currentPage() ? 'active' : '' }}">
                    <a class="page-link" href="{{ $products->url($i) }}">{{ $i }}</a>
                </li>
            @endfor
            
            @if ($products->hasMorePages())
                <li class="page-item"><a class="page-link" href="{{ $products->nextPageUrl() }}">Next</a></li>
            @else
                <li class="page-item disabled"><span class="page-link">Next</span></li>
            @endif
        </ul>
      </div>
      <!-- Akhir Pagination -->
</section>
@endsection
