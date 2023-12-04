Return-Path: <linux-leds+bounces-250-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 205E9803C9F
	for <lists+linux-leds@lfdr.de>; Mon,  4 Dec 2023 19:17:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAC141F211DC
	for <lists+linux-leds@lfdr.de>; Mon,  4 Dec 2023 18:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E87F241E9;
	Mon,  4 Dec 2023 18:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j1Huygik"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CC5D102;
	Mon,  4 Dec 2023 10:17:01 -0800 (PST)
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-67ac0ef6bb8so8697936d6.1;
        Mon, 04 Dec 2023 10:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701713820; x=1702318620; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKrXivUU4s4Ix2KPkaOEslUQnUKTTONTEc2Vza38tik=;
        b=j1HuygikMrss4wFMFaflL5a3Q052DFQw7th+z96H0bHVSeojVlDQ7GuPTTmUI8UcC3
         ia1ncSq6P3bFs2sIsYVL4PTa0osLuXOX0KH9JOkDcdakzcDcuwy2QaU3HA54ez9a5weZ
         hryza/0SOF0IHkgR0I3GAy6620Rtf3t462zXKEEa/E8tphp5YK1dMwXeJEypH93EOHdV
         zKWnwXOGRNnBd2vhpdHJuv8c0HASA245Ig9f++Y4i0skwDbWfJ2nbs2p9TzZ/D2Jsw2c
         sP/SwOMPIOCZK3/gn0zawuyDTRS/lcpR47880h0Z43Py8jOoG1WPwslcvtKjMfdMN9Ug
         HyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701713820; x=1702318620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zKrXivUU4s4Ix2KPkaOEslUQnUKTTONTEc2Vza38tik=;
        b=Eo1fJlTdYNxlvwTA8xLdAFmUDVKRiUUcXXxjEQnDAOl227X7bHtX74+srUBCS3cLtN
         ewLUHTrb5cC5ulapo4UKDLFD52v9gPDMq4uWVPX/F7NgtCeu6Gbv6eVTnHwbosFxIBQ/
         05Y1jvZXG6rXzk7y0lNJB+vVhWgr2SMfeTPnuI5NyAQmJ+yca4TVXML8+ZbtK4GPYSGf
         I7zZ7iQr/Y6c6KaH1AdEdFVrhjz3lK4fPq6qLB74egVPyPcEfkNYmEzNMCQ0lhfRhS6c
         JLGirycTQ+vYi6PHZm29z14mzNPzRXA/sGijPvAPNYnZZUn3joZfOmFZKctz2FOWSuCA
         FotQ==
X-Gm-Message-State: AOJu0YwLYF815m/ypcI7NP9DS3HMAlWzuEZjtRhIW15HhEVpFkFzVhyl
	EgoNQx0noNqV1uNZdIIiclu4gLQ/v17WSjDq0X0=
X-Google-Smtp-Source: AGHT+IENXN54JfD+GXTqScuy8jrajcws4TOEJiG6ht7UYF6f/npWH1zpa4uDEUtYwikXtEemxs1oijBNhnLkIElizdQ=
X-Received: by 2002:a0c:fec7:0:b0:67a:cafa:ce13 with SMTP id
 z7-20020a0cfec7000000b0067acaface13mr1629751qvs.53.1701713820408; Mon, 04 Dec
 2023 10:17:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231204180603.470421-1-gnstark@salutedevices.com> <20231204180603.470421-5-gnstark@salutedevices.com>
In-Reply-To: <20231204180603.470421-5-gnstark@salutedevices.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 4 Dec 2023 20:16:24 +0200
Message-ID: <CAHp75VeNhGFtmjQOR5K52bmb3t6ufqtMoS-1mLkk_swDgO+-gg@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] leds: aw200xx: use devm API to cleanup module's resources
To: George Stark <gnstark@salutedevices.com>
Cc: pavel@ucw.cz, lee@kernel.org, vadimp@nvidia.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, christophe.leroy@csgroup.eu, hdegoede@redhat.com, 
	mazziesaccount@gmail.com, jic23@kernel.org, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kernel@salutedevices.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 4, 2023 at 8:07=E2=80=AFPM George Stark <gnstark@salutedevices.=
com> wrote:
>
> In this driver LEDs are registered using devm_led_classdev_register()
> so they are automatically unregistered after module's remove() is done.
> led_classdev_unregister() calls module's led_set_brightness() to turn off
> the LEDs and that callback uses resources which were destroyed already
> in module's remove() so use devm API instead of remove().

...

> +static void aw200xx_chip_reset_action(void *data)
> +{
> +       const struct aw200xx *chip =3D (struct aw200xx *)data;
> +
> +       aw200xx_chip_reset(chip);
> +}
> +
> +static void aw200xx_disable_action(void *data)
> +{
> +       const struct aw200xx *chip =3D (struct aw200xx *)data;
> +
> +       aw200xx_disable(chip);
> +}

They can be made oneliners.

...

> +       if (devm_mutex_init(&client->dev, &chip->mutex))
> +               return -ENOMEM;

Do not shadow the real error code.

--=20
With Best Regards,
Andy Shevchenko

