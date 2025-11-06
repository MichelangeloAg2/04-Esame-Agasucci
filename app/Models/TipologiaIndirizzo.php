<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class TipologiaIndirizzo extends Model
{
    use HasFactory, SoftDeletes;
    protected $table = 'tipologiaIndirizzi';
    protected $primaryKey = 'idTipologiaIndirizzo';
    protected $fillable = ['user_id', 'via', 'citta', 'cap', 'provincia', 'stato'];



    public function utente()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
