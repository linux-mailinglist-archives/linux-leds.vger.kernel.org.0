Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E3623241B4
	for <lists+linux-leds@lfdr.de>; Wed, 24 Feb 2021 17:19:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233671AbhBXQHM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 24 Feb 2021 11:07:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236978AbhBXPzR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 24 Feb 2021 10:55:17 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEA06C06178C;
        Wed, 24 Feb 2021 07:54:31 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id e10so2145404wro.12;
        Wed, 24 Feb 2021 07:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=cIVtxfG8PJc7xzU/5yPYZk5RJ7dYzO6e765nl1gKTTg=;
        b=ZAs1eOXFbfh0ERrHdvDEdQt0e84kJOA19L8bSIyIbf0Ii152RG4CF0Q66ZTXoYbMji
         hZGFOXBPmDlmWlLGlwTtk62iBL/z4EZLZ/jwEW096EL034qq2clXzU1mO+tlilyuWdsi
         VjzPo+ZvlBIj74fCGj9MPn/XsdiH8FscHoWyxCKPzX6t/TOiVVq8uR1MWmEbQwFbCe3i
         b1/V5PWv9XfHyAFeMomu/7zqF0t4YJTdzObJZhg0rcfW7CaVhZBssCQUq9FZt4LO2NPX
         0Ea7cHqZL/aVj6MZjq3eqTDE3XV4X0hVDHsVDC4Ii7k/zeIup//XX5dAOJLx4w45GdT0
         cwrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=cIVtxfG8PJc7xzU/5yPYZk5RJ7dYzO6e765nl1gKTTg=;
        b=Duc90RmVWB6fI8fqEgy3dWdqAhnT0DMlj/uQkm2j7U//+YOMtshY5KxSs3gFjNQIo3
         5MEPRvN1x+GpwQycKIy1N8vC/R9SVX4hLu+if6iN7ZssT72Ix6PiyVBzLWh6otLL3s8A
         seurjhYp/nNsX69gyYWpg6y8/ACqf+JeE31Lg88Svk1N4PkuKappItvWuiLGGNo7GJ3C
         qJCn2yyUw66yxJT6o0qFm/rXgdGxhPynIu3LAclsl+xG0pBvyW32RSzaKUw8AgRkEFoJ
         l5wi0+m5r79rhFuX91CTQjX3ffDegte799d7YAxMIVbVnVRmHdmfZw43XiWSjArsvr/f
         D2pA==
X-Gm-Message-State: AOAM533RXCS42ziBCXEMWOGG3OXHpAhspXo86muZlp/a6xkJuEVAJDlz
        VDoYG9EENCDXJb1Nu2xGN54K0D99k5HkiKa4
X-Google-Smtp-Source: ABdhPJz7+cTh18NFbXg9TODOeyRY9Y0uuWTTNOW7OT3+zPcaBaOxtJ731r11a3hBG3NWUv1ZKgq3rA==
X-Received: by 2002:adf:d20c:: with SMTP id j12mr32225015wrh.76.1614182070166;
        Wed, 24 Feb 2021 07:54:30 -0800 (PST)
Received: from macbook-pro-alvaro.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id l4sm4231055wrt.42.2021.02.24.07.54.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Feb 2021 07:54:29 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v2 0/2] leds: bcm63x8: improve read and write functions
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <a9a9fb30-2d90-33ff-9b80-af9d03b69c69@gmail.com>
Date:   Wed, 24 Feb 2021 16:54:29 +0100
Cc:     Jonas Gorski <jonas.gorski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <B9E7BB0F-00E7-40CC-9571-E17E574E1C3F@gmail.com>
References: <20210224101110.20179-1-noltari@gmail.com>
 <a9a9fb30-2d90-33ff-9b80-af9d03b69c69@gmail.com>
To:     Florian Fainelli <f.fainelli@gmail.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Florian,

> El 24 feb 2021, a las 16:45, Florian Fainelli <f.fainelli@gmail.com> =
escribi=C3=B3:
>=20
>=20
>=20
> On 2/24/2021 2:11 AM, =C3=81lvaro Fern=C3=A1ndez Rojas wrote:
>> This code is proven to work in BMIPS BE/LE and ARM BE/LE.
>> See bcm2835-rng and bcmgenet.c:
>> =
https://github.com/torvalds/linux/blob/3b9cdafb5358eb9f3790de2f728f765fef1=
00731/drivers/char/hw_random/bcm2835-rng.c#L42-L60
>> =
https://github.com/torvalds/linux/blob/3b9cdafb5358eb9f3790de2f728f765fef1=
00731/drivers/net/ethernet/broadcom/genet/bcmgenet.c#L71-L88
>=20
> What is the motivation for doing this? bcm2835-rng and bcmgenet are =
used
> across MIPS and ARM platforms therefore they need to be compatible =
with
> both, but these two LEDs drivers are super specialized, are you =
working
> on porting the 6328 LED driver to the newer ARM-based DSL SoCs such as
> 63138 and 63148?

I just wanted to have all bmips drivers in line (at least regarding =
read/write).
If I remember correctly someone told me that this controller was also =
present on some little endian SoCs, but you can confirm that :).
Unfortunately I haven=E2=80=99t got any devices with ARM-based DSL SoCs, =
so the answer is no.

> --=20
> Florian

Best regards,
=C3=81lvaro.=
