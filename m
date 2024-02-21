Return-Path: <linux-leds+bounces-893-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D445A85EBF3
	for <lists+linux-leds@lfdr.de>; Wed, 21 Feb 2024 23:45:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 14077B248CB
	for <lists+linux-leds@lfdr.de>; Wed, 21 Feb 2024 22:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68C69129A82;
	Wed, 21 Feb 2024 22:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CBIhantO"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929B612AAC6
	for <linux-leds@vger.kernel.org>; Wed, 21 Feb 2024 22:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708555551; cv=none; b=QAJ4EQywWV0bfvdyAXlomc9J5R3m06+k4kOez9zsXYj96/W29oYyvJkcqdy2LHYKcm3/XZrI4gXOgaCz+eEIuUzjsdRHm/BAt0KS4QCMR3qti330jkMgqY+fzshiFvkzFoAs66ulfgVeeqSO0NAy9K+7mzx1Ek56ZDgk8XiS0h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708555551; c=relaxed/simple;
	bh=PzPmVzNR72x1DSNGKMlcRbhI9DT2jbL/sgZikt4MkkQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bUAYnnaJWOmKRANliSTV3xAc9hi2uZ8dHmdFIJ/Ei55TFc5ji21xb2yA7V6gyzRhJ7cUB0NgwlfMNxxfcKHLkoh4xNIrKVZyU8PO1IRJXMTMeohFhKaYT+an06eeXBflZt55fRYJjCPMQCTNmFBKCnrC9y2y9sPkvaYFSTpi4mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CBIhantO; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dcbd1d4904dso7968355276.3
        for <linux-leds@vger.kernel.org>; Wed, 21 Feb 2024 14:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708555542; x=1709160342; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tLealWf5HBstatX5jbeT2siWwuvRI4tzv53uDOTCcKI=;
        b=CBIhantOZlZ+uRI0NZLRnfNfKOPmxZRiUNDr6ksmw3kpBlT8EpGW+GTnXRFEINAsl5
         0ezEqbqfa3GRY53cAlDGKtXhvL8g0cTalLgomkFWnzfqTeaY4Y2y/yDHCSS00tpHgt6E
         G0/Evap/sfAR2DZD36H+nMQdE6+ZCOq7hhSCSg3kdEmEfR0uPI7TfkgXspOBhx4OGCQD
         bE5GD9u3mwGKl7PkqLi7cp46DhwE1r6nmSNxoHhISdoITndrP/KY4BOYG1Z2HpLhgWdX
         X6LWmMhbEbDiEkJGQ/Rtmz/QkPPmAeNdJtjhy0nvap6c6nD9/ezFr1xbonNbQXz3dYwH
         +4GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708555542; x=1709160342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tLealWf5HBstatX5jbeT2siWwuvRI4tzv53uDOTCcKI=;
        b=OQ6yWEasru0PuqlwgCBDFz/OJ3KFr28IBDyZ2rhTABM5ev8UW5qsjharHjEBlKUfyM
         Xo0OfGofIo6kEZ2JM3XVk6gbDrCnd5oXPhITI+tnRjifZjY2O2Lr6rweCmD48noI3AS+
         IyBGM+xFLyVRDmh2+NxHAuBf7tWSIu/0MnYacXh1c5sDokaSBfeqDmFPbe5kXObcO3Bn
         izde+Pppdsl8bCdajKTf81eQiX1MMDeOPD1d9KtFJE0WgD7fmmNP9aQS6vLtcPEICshC
         yHV+PIbePS7Y6Z/K4owAkb5ImiBSHV3gJ1mURIr2TzdUsftdSp/DhRMr5CLR6m08VNBd
         TN6g==
X-Forwarded-Encrypted: i=1; AJvYcCUAuPem+aGeyrAbV8vMre8unMemgGTRQH8SwRH2ksnoDZA+bvUyxATeQUfBptnUI0ocFui60VA9BMHWyJ6RIlPOwCwpirI+xcwRJQ==
X-Gm-Message-State: AOJu0Ywnc2tL/ECWPAhEGKEuP6jnT1igTgChenYrFH0fiNfZSH05TN9b
	nsQlH6WpmWSSLwyZJzmem89hmpDrbWcaDj2OFAJKVGq2dlJ7hIgw7pjhnfUqzOQ02J6a5g6+AyA
	EeSjYxugosb41bQkrIlDN2S1FOX1Gh2Nc0ByQzA==
X-Google-Smtp-Source: AGHT+IEAbOt0U475gEe5FkMJwU7SU74wskhh7ls1GEZkCyuz898a19Y3NlIdf1mAPQo4igt+D+F2bAX0hsvHDSXIFM0=
X-Received: by 2002:a0d:d60a:0:b0:604:b6b2:1fc9 with SMTP id
 y10-20020a0dd60a000000b00604b6b21fc9mr19084807ywd.49.1708555541895; Wed, 21
 Feb 2024 14:45:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240220111111.133826-1-herve.codina@bootlin.com> <20240220111111.133826-3-herve.codina@bootlin.com>
In-Reply-To: <20240220111111.133826-3-herve.codina@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Feb 2024 23:45:31 +0100
Message-ID: <CACRpkdZA1a6xxPL7hP_B4e0b5PoCv8CNhnxvM+dR5TGYkYv7Nw@mail.gmail.com>
Subject: Re: [PATCH 2/2] leds: gpio: Add devlinks between the gpio consumed
 and the gpio leds device
To: Herve Codina <herve.codina@bootlin.com>, Saravana Kannan <saravanak@google.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Saravana needs to look at this patch too, so I am top-posting.

Yours,
Linus Walleij

On Tue, Feb 20, 2024 at 12:11=E2=80=AFPM Herve Codina <herve.codina@bootlin=
.com> wrote:

> When a gpio is removed, the gpio leds consumer need to be removed first.
> This dependency consumer/supplier can be described by devlink links.
> In case of device-tree, even if some devlinks are created due to the
> presence of gpio phandles in the gpio leds children, these links do not
> help in removing the gpio leds device (i.e. the real consumer) before
> the consumed gpio.
> We can reach cases where the gpio are no more present and the gpio leds
> driver continue to have leds using these gpio.
> Further more, when the gpio come back, the gpio leds still use the old
> removed one.
>
> Indeed, the gpio are consumed by the parent of the consumer used in the
> devlink creation due to phandles. A link is missing between the gpio and
> the real gpio consumer, the gpio leds device itself.
>
> Use the newly introduced gpiod_device_add_link() to create this
> missing link between the gpio leds devices and the gpios.
> With that done, if a gpio is removed, the gpio leds is removed and the
> resources are correctly released.
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  drivers/leds/leds-gpio.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> index 83fcd7b6afff..b3ec8ecbe5da 100644
> --- a/drivers/leds/leds-gpio.c
> +++ b/drivers/leds/leds-gpio.c
> @@ -150,6 +150,7 @@ static struct gpio_leds_priv *gpio_leds_create(struct=
 device *dev)
>  {
>         struct fwnode_handle *child;
>         struct gpio_leds_priv *priv;
> +       struct device_link *link;
>         int count, ret;
>
>         count =3D device_get_child_node_count(dev);
> @@ -197,6 +198,20 @@ static struct gpio_leds_priv *gpio_leds_create(struc=
t device *dev)
>                 /* Set gpiod label to match the corresponding LED name. *=
/
>                 gpiod_set_consumer_name(led_dat->gpiod,
>                                         led_dat->cdev.dev->kobj.name);
> +
> +               /*
> +                * Create a link between the GPIO and the gpio-leds devic=
e.
> +                * This allow to have a relationship between the gpio use=
d and
> +                * the gpio-leds device in order to automatically remove =
the
> +                * gpio-leds device (consumer) when a GPIO (supplier) is =
removed.
> +                */
> +               link =3D gpiod_device_add_link(dev, led_dat->gpiod,
> +                                            DL_FLAG_AUTOREMOVE_CONSUMER)=
;
> +               if (IS_ERR(link)) {
> +                       fwnode_handle_put(child);
> +                       return ERR_CAST(link);
> +               }
> +
>                 priv->num_leds++;
>         }
>
> --
> 2.43.0
>

