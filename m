Return-Path: <linux-leds+bounces-2332-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF7893CD01
	for <lists+linux-leds@lfdr.de>; Fri, 26 Jul 2024 05:31:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C0F9B209F3
	for <lists+linux-leds@lfdr.de>; Fri, 26 Jul 2024 03:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 925A11A716;
	Fri, 26 Jul 2024 03:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hXcRl5jm"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB1AED8;
	Fri, 26 Jul 2024 03:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721964712; cv=none; b=rRKTLJdDR4mk9R6pYG1Daq7mBzYn5oSdj/nfzqEr2JsF8Oh12ZEsUsvvAtn87Xq72rVlW9kYEhHOquWeIgcb5h7kxa8N8Mb1yE3UP74GA+DBugbzHpFwYYGghG8EaMThpm0IfcWns/DDROdx217gc1O0iza/6DiY5YJVgcJMQPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721964712; c=relaxed/simple;
	bh=wB4ZRIrL2XC91qM492YblhoR+l2yJuhp6KXnkhC4eEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mpVWCK2sKMuTNZ+g8c2fsBiVI36ZNP9WHFuxwOnAnN8p6tGd2PYhUc05YTdHV/kluSSXudD8Q3htdOgd2Drc2BfCyceoArfzJysa8mzF/0Y2rDrlmthlLl9zqHyVcq+rBuGoNiw8MBfF/EnrVKoXqg9JLQCRsPgJHYgxCaZrc1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hXcRl5jm; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1fd78c165eeso2095165ad.2;
        Thu, 25 Jul 2024 20:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721964710; x=1722569510; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1fW7ZV4Va2JuSoO+Cf3WvU21hzFTENmt0nNVN5ukOAQ=;
        b=hXcRl5jmtxMbpfWDz8i9YY/a1OlqmJTSE1kGkfLr+6zSKYp11Gh2hxiFqxG8fdZutY
         u5/4F0WzRSCuVDFFtys78SARm3izxIfW0oDDn3U0+zzIWk9KIU07o5YHIaKqp6zDzpoI
         3fxIfcr7rq1Og5WV7Q9H2KAtm2NVyKnJFl2Y+Me/7/nMl8YZEiQScbJ1zeZSjPI8Gc9L
         TWBBabaEYuDeVFnX3NSNi23lb15QZZnuWJTTFSDJMoebPAE7EdMT+CuG0OgIMbBiioSJ
         XdLdRyu1n7laZuM46gsENgQjVhEnpyp7Zamg+pIkFJ14Rg1NauE91C/SwTpxxX2i2gG9
         bANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721964710; x=1722569510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1fW7ZV4Va2JuSoO+Cf3WvU21hzFTENmt0nNVN5ukOAQ=;
        b=w6PxQwXHLX8nVUGWcBvDlQixP5ZndfEGKRFyv6c8uhLwhCwt6SrH6mtGQgWzGqL/PR
         8S0D5TOgNKRiBL8Vgws53YlshH+JFGXhwnTYjPc3uR7zkc4WlkDsH2bWCtgf77HD/GSR
         9+4Mnk3PT+nPjdPzEBdhGq9RLO2d9CEXvo668i3CF1shbWaFLfwcMQ5Xdvk/0KT2cPk5
         vHkLWanIgewOLHBnB6+EgS9JHd+DCmXDInjXCNXGrFFYdQEYyXWXDE47PLnjokN6HI9d
         yZi98zMTvBtZHo3JKOGjuRWNwXknBEPhppdiP44lBVzfiFEng4p9MSHw7iNt7L9Mhw22
         nAmA==
X-Forwarded-Encrypted: i=1; AJvYcCWTHOgu+FPX4ZgXH0t0P/GrLo+vdwB+UBE8Kd9kFUO848dgxD3rkOf59sGaAivztvtrZ1INOBhRgbvIEnoIqvz2Y2Kr2Bg4PG0QRl2kONbctOqG1GBdgt1xYgNXFv2wnC9u1D/De3NyRA==
X-Gm-Message-State: AOJu0YzLQauwE6cAy68zMI8k299RcT9/F7wz/3HouRi5cHFJ0Ij7ZQ5W
	uLUBHb8sTPVwqbwSMMGN05FY21lCkgNGFfxgoxajGrfbBS86UJH5
X-Google-Smtp-Source: AGHT+IGArxlRKUqIi7rI4POpLExB0YmXp+ngOKRn7FSCpip32UpijpO64pFVvxb4M04Tyo9rXnzcUQ==
X-Received: by 2002:a17:902:da8c:b0:1fd:6ca9:4c0 with SMTP id d9443c01a7336-1fed91d97c8mr43821945ad.18.1721964710202;
        Thu, 25 Jul 2024 20:31:50 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7ee5715sm21612835ad.128.2024.07.25.20.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 20:31:49 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id A690B4937EEA; Fri, 26 Jul 2024 10:31:45 +0700 (WIB)
Date: Fri, 26 Jul 2024 10:31:44 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Guilherme =?utf-8?Q?Gi=C3=A1como_Sim=C3=B5es?= <trintaeoitogc@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux LED Devices <linux-leds@vger.kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Hans de Goede <hdegoede@redhat.com>,
	Lee Jones <lee@kernel.org>
Subject: Re: leds: remove led_brightness
Message-ID: <ZqMYoHUECmrl2Rty@archie.me>
References: <CAM_RzfZWcD8F+6YutbDBo7hGhFm0nbG-Wc0H7bnu4XM03W6_Tg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Df/vGhVmn7C13MvM"
Content-Disposition: inline
In-Reply-To: <CAM_RzfZWcD8F+6YutbDBo7hGhFm0nbG-Wc0H7bnu4XM03W6_Tg@mail.gmail.com>


--Df/vGhVmn7C13MvM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 23, 2024 at 10:03:52AM -0300, Guilherme Gi=C3=A1como Sim=C3=B5e=
s wrote:
> Hi community, I hope this email finds you well
> I maked a change in kernel linux, for fulfill a TODO in
> drivers/leds/TODO that say:
> >* On/off LEDs should have max_brightness of 1
> >* Get rid of enum led_brightness
> >
> >It is really an integer, as maximum is configurable. Get rid of it, or
> >make it into typedef or something.
>=20
> Then I removed the led_brightness. And in the files that enum
> led_brightness was used I replace to "int" ... And in the file
> "include/linux/leds.h" I created constants like:
> +#define LED_OFF  0
> +#define LED_ON   1
> +#define LED_HALF 127
> +#define LED_FULL 255
>=20
> because in some files when has a compare like "brightness =3D=3D LED_OFF"
> it will work yet.
>=20
> The includes/linux/leds.h diff:
> -/* This is obsolete/useless. We now support variable maximum brightness.=
 */
> -enum led_brightness {
> -       LED_OFF         =3D 0,
> -       LED_ON          =3D 1,
> -       LED_HALF        =3D 127,
> -       LED_FULL        =3D 255,
> -};
> +// default values for leds brightness
> +#define LED_OFF  0
> +#define LED_ON   1
> +#define LED_HALF 127
> +#define LED_FULL 255
>=20
>  enum led_default_state {
>         LEDS_DEFSTATE_OFF       =3D 0,
> @@ -127,15 +125,15 @@ struct led_classdev {
>          * that can sleep while setting brightness.
>          */
>         void            (*brightness_set)(struct led_classdev *led_cdev,
> -                                         enum led_brightness brightness);
> +                                         int brightness);
>         /*
>          * Set LED brightness level immediately - it can block the caller=
 for
>          * the time required for accessing a LED device register.
>          */
>         int (*brightness_set_blocking)(struct led_classdev *led_cdev,
> -                                      enum led_brightness brightness);
> +                                      int brightness);
>         /* Get LED brightness level */
> -       enum led_brightness (*brightness_get)(struct led_classdev *led_cd=
ev);
> +       int (*brightness_get)(struct led_classdev *led_cdev);
>=20
>         /*
>          * Activate hardware accelerated blink, delays are in milliseconds
> @@ -486,7 +484,7 @@ int devm_led_trigger_register(struct device *dev,
>  void led_trigger_register_simple(const char *name,
>                                 struct led_trigger **trigger);
>  void led_trigger_unregister_simple(struct led_trigger *trigger);
> -void led_trigger_event(struct led_trigger *trigger,  enum
> led_brightness event);
> +void led_trigger_event(struct led_trigger *trigger,  int event);
>  void led_trigger_blink(struct led_trigger *trigger, unsigned long delay_=
on,
>                        unsigned long delay_off);
>=20
>=20
>=20
> How the kernel has a lot of files that use this led_brightness, the
> change is very very big.
> I have some questions:
>=20
> Does my change make sense?
>=20
> How can I split the change into several patches for sending to
> different email lists and still have the split change make sense in
> the email lists I'm going to send it to? can I reference the commit in
> which I delete the enum?

tl;dr: send the formal patch (see Documentation/process/submitting-patches.=
rst
for how to do that). Make sure to Cc: relevant maintainers (see MAINTAINERS
in the kernel source tree).

Bye!

--=20
An old man doll... just what I always wanted! - Clara

--Df/vGhVmn7C13MvM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZqMYkgAKCRD2uYlJVVFO
oxXwAQCLvO87nzZ+KrPySP5kKy4IRGW7qzfq8Cn4Hw/Z+WwHbAEA/85BYlpyvKL4
BWa/ppbHgcN36DElpv4NVuIlAlIJ7gI=
=WLrH
-----END PGP SIGNATURE-----

--Df/vGhVmn7C13MvM--

