<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Database\Eloquent\SoftDeletes;
use PHPOpenSourceSaver\JWTAuth\Contracts\JWTSubject;


class User extends Authenticatable implements JWTSubject
{
    use HasApiTokens, HasFactory, Notifiable, SoftDeletes;

    protected $table = 'utenti';
    protected $primaryKey = 'idUtente';
    public $incrementing = true;
    protected $keyType = 'int';

    protected $fillable = [
        'nome',
        'cognome',
        'sesso',
        'email',
        'password',
        'ruolo',
        'crediti',
        'abbonamento_attivo',
        'film_preferiti',
        'serie_preferiti',
    ];

    protected $casts = [
        'film_preferiti' => 'array',
        'serie_preferiti' => 'array',
        'abbonamento_attivo' => 'boolean',
    ];

    /**
     * Route model binding su idUtente
     */
    public function getRouteKeyName()
    {
        return 'idUtente';
    }

    /**
     * Relazioni
     */
    public function pagamenti()
    {
        return $this->hasMany(Pagamento::class, 'idUtente', 'idUtente');
    }

    public function indirizzi()
    {
        return $this->hasMany(TipologiaIndirizzo::class, 'user_id', 'idUtente');
    }

    public function credito()
    {
        return $this->hasOne(Credito::class, 'utente_id', 'idUtente');
    }

    public function preferiti()
    {
        return $this->hasMany(Preferito::class, 'idUtente', 'idUtente');
    }

    /**
     * JWT Methods
     */
    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    public function getJWTCustomClaims()
    {
        return [];
    }

    /**
     * Helpers
     */
    public function haRuolo($ruolo)
    {
        return $this->ruolo === $ruolo;
    }

    public function aggiungiCrediti($importo)
    {
        $this->crediti += $importo;
        $this->save();
    }

    public function scalaCrediti($importo)
    {
        if ($this->crediti >= $importo) {
            $this->crediti -= $importo;
            $this->save();
            return true;
        }
        return false;
    }
}
