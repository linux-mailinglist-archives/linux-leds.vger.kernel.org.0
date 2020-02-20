Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3805F165B52
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2020 11:19:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbgBTKT5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 20 Feb 2020 05:19:57 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:43119 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726837AbgBTKTv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 20 Feb 2020 05:19:51 -0500
Received: by mail-io1-f66.google.com with SMTP id n21so4028405ioo.10
        for <linux-leds@vger.kernel.org>; Thu, 20 Feb 2020 02:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RSkbSzQFKatU/Nz6Rp1qN4oZDs3Z4cqqLDqeNH59guo=;
        b=kjx/NQD3Qkv7NEGn91Aip3DxCh0RzZJcTTt9NwWOHCsAWQNvUymY9dING/uKp/aVKr
         KgtgJ1CuKzOKuDTIOpGaRkU72UbdoxkTu1xBJvqRNVZVri3z57K4b/U2qzKIEsSBxNM3
         Tj/qsWPVDJ/iAgbmCT9bYofBhYuVfArqA6HCazLUG9qOh25w15ZaIqoEGVdjdQP5bg61
         lWKfIsAJ1imAovRwKhLEOmoucpqbb1JW6b+KcBR920s3mE8iqm10nb7v1KKUTGGEBI5B
         gf6RKfExxQP9GtgK3nZygOhUUlYmfISApi5Q36/QiQffRZSq/FNe/XQlxddBdM94kCf4
         HrhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RSkbSzQFKatU/Nz6Rp1qN4oZDs3Z4cqqLDqeNH59guo=;
        b=SbLg5Dqlc4bh5CJT4R0/iTaVJxZFg2grVEaXD8wXhq4/0Ah4twutn8mmBv1L6xIvgZ
         SJKkZEfUVnqAB3KFj5dprI9MnMDiIxW3kTaxV9iTmNCA3qmgOXvPK47FoY/glBIUzpeJ
         P3/TdC6Sg4wzFWL3rn1IHfqqnJpFK14AjU8P+kVcsuLYDyTjizLJyOxPdIu/K/gKQYO3
         joQ34PevnpM2giG3vqndgOH0AtYcYBXOMNRBL/tfOln5Q8o9MOJViHN/uAThYbrGeRxr
         Z6H6anrOq9rqvG00wykdrfXPY8JWg5HKCwTpM3jgVBOuddmHShryY3sUiCzQr1lKSQhd
         qVkQ==
X-Gm-Message-State: APjAAAXN43gNaf6rTtXvnqazG8xmgIzPgJFcuEUd750+YlA9KkTeMvIC
        2LL5cRIlTYeMdcJx/9mab5v0/BCAlBHa754oZl16sA==
X-Google-Smtp-Source: APXvYqw+HHFsilzmJ9kYjMOEhixSgKp9xidKItJIJp7tFe6MHgufzszPMPZkLQ/3nwhIOZxGa/3LzjfqS5zzHNYui/I=
X-Received: by 2002:a05:6638:5b1:: with SMTP id b17mr24498386jar.66.1582193989361;
 Thu, 20 Feb 2020 02:19:49 -0800 (PST)
MIME-Version: 1.0
References: <1582018657-5720-1-git-send-email-nbelin@baylibre.com> <04642127-0e68-43b1-9b6c-0dbb56dc9bfe@ti.com>
In-Reply-To: <04642127-0e68-43b1-9b6c-0dbb56dc9bfe@ti.com>
From:   Nicolas Belin <nbelin@baylibre.com>
Date:   Thu, 20 Feb 2020 11:19:38 +0100
Message-ID: <CAJZgTGGREREnozgwsm26EwSoM6hXawNfOK7hF0soOkKzMqwD7Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] leds: add support for apa102c leds
To:     Dan Murphy <dmurphy@ti.com>
Cc:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Dan,

Le mar. 18 f=C3=A9vr. 2020 =C3=A0 13:47, Dan Murphy <dmurphy@ti.com> a =C3=
=A9crit :
>
> Hellp
>
> On 2/18/20 3:37 AM, Nicolas Belin wrote:
> > This patch series adds the driver and its related documentation
> > for the APA102C RGB Leds.
> >
> > Patch 1 adds the APA102C led manufacturer to the vendor-prefixes list.
> >
> > Patch 2 Documents the APA102C led driver.
> >
> > Patch 3 contains the actual driver code and modifications in the Kconfi=
g
> > and the Makefile.
>
> Is this something that can benefit from the Multicolor framework patches?
>
> https://lore.kernel.org/patchwork/project/lkml/list/?series=3D427513
>
> Can you RFC the APA102C driver on top of the Multicolor FW to see how it
> blends?

Sure, the Multicolor framework will probably improve my driver !
I'll send you a new version once I have tested it.

>
> Dan
>

Thanks,

Nicolas
