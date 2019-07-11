Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3E9165243
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jul 2019 09:10:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728142AbfGKHKc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 11 Jul 2019 03:10:32 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:35921 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728111AbfGKHKc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 11 Jul 2019 03:10:32 -0400
Received: by mail-ot1-f65.google.com with SMTP id r6so4831553oti.3
        for <linux-leds@vger.kernel.org>; Thu, 11 Jul 2019 00:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5QYIfHPIlfmRtCQvyPOySkoWCDyp5b9YQkj6qSPvh/g=;
        b=mfPpdebgOD4LVGLKp7098D4o7JIjH8lgG2lbAMgeu5MAxR1y+tEhEoSe5FAa5DeXeM
         84fAEt+VYnp28bY5gakzpFd0AeydaFuZWux8dVRiT98FoPFhzAR6bmprKvVFNw+QU/LS
         HDe93co8H6gh2atDchQ/x975D6UaT65CviKc10xkdY1BSGHcijJyOb3ts8wNxCmlXNtT
         egDJ7no4K4A2dVe69U+AZ/USlN269oDR2q1FSTObPmQXqxc2UwkS4v6QbzxBuBiU7vP5
         fIVTHW2WiapT90iyVlN7mKYTxAsEC9GPGsVK5hqV9PaahMfj0bXlVz9DQWIjj6t7bA2O
         bd6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5QYIfHPIlfmRtCQvyPOySkoWCDyp5b9YQkj6qSPvh/g=;
        b=LgNqQSCesmDcIL92Dx6Bvk+nKuPhy3o/vVaPBreZQ+h/e2Ygux3j567gQf6Q86p645
         dMjBY009Rz20e3uXE/p7Vp5x3TaSAMlOlfP1pOJ6pvPbBe1MvVLTD07zC53TD9bOXbno
         nn4a2IzgVyhQiTlpTp/RoGLiB4XDgPmPQ8VY9eb9QD4Bi7BBfGX/0/WDVhAEEW4rbznP
         J02zj7C+BnlHFWGfohnV76NWmwaDqzWBJjXCw5QpJwJRwNL+wyaM+vtlI/VkoDtofWDt
         xhanealTibltd5UDBheYP4chJNR1m+FrYmgal9FmX8dPz0YEW77zK74AD4xDwmcY6haa
         K9Yw==
X-Gm-Message-State: APjAAAVmEVOennBp772DxB6dnq33iHj4sI8/JZxctslP3lHZHKiTPYAR
        4q9uv++9qzABFc1aZLw3DXwAGt0RqJeCsExZwpHGew==
X-Google-Smtp-Source: APXvYqzrVv3m1BGfIT/ehA1hFtahsooQHkrclJmbhdjBJ8W9xffhFPecnmI71s2fi+0QK8W2JwqKVkOu4gyCOSkrAvE=
X-Received: by 2002:a05:6830:210f:: with SMTP id i15mr2185630otc.250.1562829031090;
 Thu, 11 Jul 2019 00:10:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190709173509.14016-1-nishkadg.linux@gmail.com>
In-Reply-To: <20190709173509.14016-1-nishkadg.linux@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 11 Jul 2019 09:10:20 +0200
Message-ID: <CAMpxmJX82_ur2uySoSwOUYruZT1kvvZHMTGKYbkQpH4O238-Rw@mail.gmail.com>
Subject: Re: [PATCH] leds: leds-max77650: Add of_node_put() before return
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, dmurphy@ti.com,
        Linux LED Subsystem <linux-leds@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

wt., 9 lip 2019 o 19:35 Nishka Dasgupta <nishkadg.linux@gmail.com> napisa=
=C5=82(a):
>
> Each iteration of for_each_child_of_node puts the previous
> node, but in the case of a return from the middle of the loop, there is
> no put, thus causing a memory leak. Hence add an of_node_put before the
> return in five places.
> Issue found with Coccinelle.
>
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---
>  drivers/leds/leds-max77650.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/leds/leds-max77650.c b/drivers/leds/leds-max77650.c
> index 6b74ce9cac12..417820f77c32 100644
> --- a/drivers/leds/leds-max77650.c
> +++ b/drivers/leds/leds-max77650.c
> @@ -93,8 +93,10 @@ static int max77650_led_probe(struct platform_device *=
pdev)
>
>         for_each_child_of_node(of_node, child) {
>                 rv =3D of_property_read_u32(child, "reg", &reg);
> -               if (rv || reg >=3D MAX77650_LED_NUM_LEDS)
> +               if (rv || reg >=3D MAX77650_LED_NUM_LEDS) {
> +                       of_node_put(child);
>                         return -EINVAL;
> +               }
>
>                 led =3D &leds[reg];
>                 led->map =3D map;
> @@ -109,24 +111,32 @@ static int max77650_led_probe(struct platform_devic=
e *pdev)
>                 } else {
>                         led->cdev.name =3D devm_kasprintf(dev, GFP_KERNEL=
,
>                                                         "max77650:%s", la=
bel);
> -                       if (!led->cdev.name)
> +                       if (!led->cdev.name) {
> +                               of_node_put(child);
>                                 return -ENOMEM;
> +                       }
>                 }
>
>                 of_property_read_string(child, "linux,default-trigger",
>                                         &led->cdev.default_trigger);
>
>                 rv =3D devm_of_led_classdev_register(dev, child, &led->cd=
ev);
> -               if (rv)
> +               if (rv) {
> +                       of_node_put(child);
>                         return rv;
> +               }
>
>                 rv =3D regmap_write(map, led->regA, MAX77650_LED_A_DEFAUL=
T);
> -               if (rv)
> +               if (rv) {
> +                       of_node_put(child);
>                         return rv;
> +               }
>
>                 rv =3D regmap_write(map, led->regB, MAX77650_LED_B_DEFAUL=
T);
> -               if (rv)
> +               if (rv) {
> +                       of_node_put(child);
>                         return rv;
> +               }
>         }
>
>         return regmap_write(map,
> --
> 2.19.1
>

How about a label at the end of probe instead of adding this before
every return?

Bart
