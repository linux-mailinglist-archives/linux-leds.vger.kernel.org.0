Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3152D271638
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 19:15:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbgITRP4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 20 Sep 2020 13:15:56 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.167]:15058 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgITRP4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 20 Sep 2020 13:15:56 -0400
X-Greylist: delayed 348 seconds by postgrey-1.27 at vger.kernel.org; Sun, 20 Sep 2020 13:15:55 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1600622154;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=dIX4Ure3ywXICBpOX8DQyEiSDMK5Fo1iv1WOCtCQba8=;
        b=jTflMjmJ/1ooTrbOq5zDA7I/MDPihd/O1//Hom0UjZiFRmuPGNA6H4+SM8HWRbn0lH
        ZE7F7zzJmUNTdGgZAlbixYfxOcJYZSqWNpVlABO+fij5sB441RPuKY+FsSw5hMib/Pcc
        uqRt7JKBPjRT5Ucji2NR4c14naV1nTX3lvtRsDdaFpnz8NunODZeKzEmrkB8SuV41OmQ
        jzKgmVgemBptjYinKISA+aEbfZ18LZPvYDV6GSJM4WRNG8PbnI4Csuy9UKZqtphD1YBy
        gIG2Gq0KSt1SB7krKokSWrRNGKFjFeICQPxmuqkr5wp5btUqOqEh8fzNS3A25nkHnqyT
        0BsQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAhw47vfM4="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id n03b0dw8KH9oFgn
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Sun, 20 Sep 2020 19:09:50 +0200 (CEST)
Subject: Re: [PATCH leds + devicetree 01/13] leds: tca6507: Absorb platform data
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200919221548.29984-2-marek.behun@nic.cz>
Date:   Sun, 20 Sep 2020 19:09:50 +0200
Cc:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, NeilBrown <neilb@suse.de>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <BF2585C9-CBED-43D3-9353-2C3E008942D0@goldelico.com>
References: <20200919221548.29984-1-marek.behun@nic.cz> <20200919221548.29984-2-marek.behun@nic.cz>
To:     =?utf-8?Q?Marek_Beh=C3=BAn?= <marek.behun@nic.cz>
X-Mailer: Apple Mail (2.3124)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


> Am 20.09.2020 um 00:15 schrieb Marek Beh=C3=BAn <marek.behun@nic.cz>:
>=20
> The only in-tree usage of this driver is via device-tree. No on else
> includes linux/leds-tca6507.h, so absorb the definition of platdata
> structure.
>=20
> Signed-off-by: Marek Beh=C3=BAn <marek.behun@nic.cz>
> Cc: NeilBrown <neilb@suse.de>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: H. Nikolaus Schaller <hns@goldelico.com>

Tested-by: H. Nikolaus Schaller <hns@goldelico.com>

on GTA04 (omap3-gta04.dtsi).

> ---
> drivers/leds/leds-tca6507.c  | 11 ++++++++++-
> include/linux/leds-tca6507.h | 21 ---------------------
> 2 files changed, 10 insertions(+), 22 deletions(-)
> delete mode 100644 include/linux/leds-tca6507.h
>=20
> diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
> index a7e9fd85b6dd5..b5b5bafe2176e 100644
> --- a/drivers/leds/leds-tca6507.c
> +++ b/drivers/leds/leds-tca6507.c
> @@ -95,7 +95,6 @@
> #include <linux/i2c.h>
> #include <linux/gpio/driver.h>
> #include <linux/workqueue.h>
> -#include <linux/leds-tca6507.h>
> #include <linux/of.h>
>=20
> /* LED select registers determine the source that drives LED outputs =
*/
> @@ -108,6 +107,16 @@
> #define TCA6507_LS_BLINK0	0x6	/* Blink at Bank0 rate */
> #define TCA6507_LS_BLINK1	0x7	/* Blink at Bank1 rate */
>=20
> +struct tca6507_platform_data {
> +	struct led_platform_data leds;
> +#ifdef CONFIG_GPIOLIB
> +	int gpio_base;
> +	void (*setup)(unsigned gpio_base, unsigned ngpio);
> +#endif
> +};
> +
> +#define	TCA6507_MAKE_GPIO 1
> +
> enum {
> 	BANK0,
> 	BANK1,
> diff --git a/include/linux/leds-tca6507.h =
b/include/linux/leds-tca6507.h
> deleted file mode 100644
> index 50d330ed11005..0000000000000
> --- a/include/linux/leds-tca6507.h
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - * TCA6507 LED chip driver.
> - *
> - * Copyright (C) 2011 Neil Brown <neil@brown.name>
> - */
> -
> -#ifndef __LINUX_TCA6507_H
> -#define __LINUX_TCA6507_H
> -#include <linux/leds.h>
> -
> -struct tca6507_platform_data {
> -	struct led_platform_data leds;
> -#ifdef CONFIG_GPIOLIB
> -	int gpio_base;
> -	void (*setup)(unsigned gpio_base, unsigned ngpio);
> -#endif
> -};
> -
> -#define	TCA6507_MAKE_GPIO 1
> -#endif /* __LINUX_TCA6507_H*/
> --=20
> 2.26.2
>=20

