<?php
/**
 * La configuration de base de votre installation WordPress.
 *
 * Ce fichier contient les réglages de configuration suivants : réglages MySQL,
 * préfixe de table, clés secrètes, langue utilisée, et ABSPATH.
 * Vous pouvez en savoir plus à leur sujet en allant sur
 * {@link http://codex.wordpress.org/fr:Modifier_wp-config.php Modifier
 * wp-config.php}. C’est votre hébergeur qui doit vous donner vos
 * codes MySQL.
 *
 * Ce fichier est utilisé par le script de création de wp-config.php pendant
 * le processus d’installation. Vous n’avez pas à utiliser le site web, vous
 * pouvez simplement renommer ce fichier en "wp-config.php" et remplir les
 * valeurs.
 *
 * @package WordPress
 */

// ** Réglages MySQL - Votre hébergeur doit vous fournir ces informations. ** //
/** Nom de la base de données de WordPress. */
define( 'DB_NAME', 'wordpress' );

/** Utilisateur de la base de données MySQL. */
define( 'DB_USER', 'admin' );

/** Mot de passe de la base de données MySQL. */
define( 'DB_PASSWORD', 'admin' );

/** Adresse de l’hébergement MySQL. */
define( 'DB_HOST', 'localhost' );

/** Jeu de caractères à utiliser par la base de données lors de la création des tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** Type de collation de la base de données.
 * N’y touchez que si vous savez ce que vous faites.
 */
define('DB_COLLATE', '');

/**#@+
 * Clés uniques d’authentification et salage.
 *
 * Remplacez les valeurs par défaut par des phrases uniques !
 * Vous pouvez générer des phrases aléatoires en utilisant
 * {@link https://api.wordpress.org/secret-key/1.1/salt/ le service de clefs secrètes de WordPress.org}.
 * Vous pouvez modifier ces phrases à n’importe quel moment, afin d’invalider tous les cookies existants.
 * Cela forcera également tous les utilisateurs à se reconnecter.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '5o^)xNek`1Rg-,@<huyS/0TTIvXkdt1^2-7s]8xzf}wA/8plpvp@uT-%N=vW9,7{' );
define( 'SECURE_AUTH_KEY',  'oM_Dv*P?+[tq][&8yv6@G?vP|_4N<VGPA).nDm;<+rSA45]=)%t2,5`}J<Gq$<lD' );
define( 'LOGGED_IN_KEY',    'xZTc29Jvv&7`dxpX*3wQVN1+Z%cJ`u&.QQj;[0POa!JHq;^]ai5UB{&1x%TWQb}9' );
define( 'NONCE_KEY',        '/c0m4hLf3P.z2=^m_-, 1Ei8:,D]LJ(K`l7O_9y?_^%f&1}%%dR+yD|A_A!d:Xq@' );
define( 'AUTH_SALT',        'Ig@ppNg &-XU@lF.Lo,7){P~|8rpo/nR{FIDd_?aflF=tz3YR$M?3$eJUW}_u?ah' );
define( 'SECURE_AUTH_SALT', '+KuoWv8o,H6&iUy?7hWT*0jUz=`j6t&wt#T<jt76*`Rslj9gT:.U9{Gn[HDB[%#&' );
define( 'LOGGED_IN_SALT',   'KpN(N=d-o7gF4{?4aj^wMx*CsuHk.hsC,|GKwQJ $`h0N) hM(i4~|I]eQsc^eWk' );
define( 'NONCE_SALT',       '<G8CYKrfV9YfdxJdT({/mDOE*W|w9Yx}$Rs|RG!<@yWQxNmdHLFc/In~<LDl,|G$' );
/**#@-*/

/**
 * Préfixe de base de données pour les tables de WordPress.
 *
 * Vous pouvez installer plusieurs WordPress sur une seule base de données
 * si vous leur donnez chacune un préfixe unique.
 * N’utilisez que des chiffres, des lettres non-accentuées, et des caractères soulignés !
 */
$table_prefix = 'wp_';

/**
 * Pour les développeurs : le mode déboguage de WordPress.
 *
 * En passant la valeur suivante à "true", vous activez l’affichage des
 * notifications d’erreurs pendant vos essais.
 * Il est fortemment recommandé que les développeurs d’extensions et
 * de thèmes se servent de WP_DEBUG dans leur environnement de
 * développement.
 *
 * Pour plus d’information sur les autres constantes qui peuvent être utilisées
 * pour le déboguage, rendez-vous sur le Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* C’est tout, ne touchez pas à ce qui suit ! Bonne publication. */

/** Chemin absolu vers le dossier de WordPress. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Réglage des variables de WordPress et de ses fichiers inclus. */
require_once(ABSPATH . 'wp-settings.php');
