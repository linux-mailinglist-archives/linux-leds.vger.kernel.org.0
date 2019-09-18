Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBB18B5DF3
	for <lists+linux-leds@lfdr.de>; Wed, 18 Sep 2019 09:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728716AbfIRHXm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Sep 2019 03:23:42 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:40270 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728728AbfIRHXm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Sep 2019 03:23:42 -0400
Received: by mail-pg1-f193.google.com with SMTP id w10so3471285pgj.7;
        Wed, 18 Sep 2019 00:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2UrT7kWXq7Zv08Ux1ZFLXJe97a76AVYSBPn7eC+0dXc=;
        b=QDVRfN5zmScR1Bqy85j7Aa/Cwhhp+1jdOzVCqNtz6M/p+LuItCJZIxaYIuuyigZuqs
         PJcTyWD/Mp+skwAxUC205hMV0XMWhnU/HxVtjqZOdDA946uj0EGS3pYRchE1L5MEkOmd
         q9QVplok9A7tUfVeMjUb1cY7uWttGIMxL8JRFZvkRVBjUFHbK5sesP/iCKFB4pqdpNp9
         fyLmAPX93FeA1jO3mb2EZ5ympIz/IYBuizLx51p7iXyStOBecZHotROXrPK+C4xxpB13
         X48pfb28LfbLUiIaVGJ+SyfLgM6AhYALzXrZGdOqokjvHUf4X4RicUjkZAlEIpI6SarT
         swoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2UrT7kWXq7Zv08Ux1ZFLXJe97a76AVYSBPn7eC+0dXc=;
        b=JWUTYO+v09CwNQB6qGS+V0Q58RW86pPlVL/HBBeL4U4DS30UJRXMafCB6Egqze9qpU
         J+uth4LKA/HWBBNxAZRMSYJBR25EchCfJtwq7Xyc3uBIHvNTKJcjIJ7WaKMgmbTtjaus
         pArbIysUNAuq3+ni8d+DniVJgpYLK7jaR6qVI0bodRor/8a9qnAX4NddKcwe96Q/E7MP
         23/fZCq6BqtAO9OeSgAQyiy3B3mD7/f7JeumIS/9ZnXj8fRjrmfhgBPpwEQTwBo1T4x3
         ze/RPBHaP5VpQoUPu/gZ5N7hzzZ2cGObDPUwM5JSSHyMeAhBX0v0IGzu9Y+TEKr3gNco
         SX1g==
X-Gm-Message-State: APjAAAWMFKfR3YgrahuM1tr5M2R+etHB6EE+kNJ1OOcWyVVx63yuwXnF
        hzz4qNKLzc/yV8ue39gX8ELfTOJSQ06lK624/EU=
X-Google-Smtp-Source: APXvYqx4GGiFYwR2caQijMB5QqJkgEa5lLfYzz9p0wIQOCj8rKC7aTmkjVrj7uSonkgit/GoTghxfejYgajtCBnUyVo=
X-Received: by 2002:a63:1020:: with SMTP id f32mr2722800pgl.203.1568791421343;
 Wed, 18 Sep 2019 00:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190916222133.9119-1-jacek.anaszewski@gmail.com>
 <CAHk-=wgxNj_RBpE0xRYnMQ9W6PtyLx+LS+pZ_BqG31vute1iAg@mail.gmail.com> <CAHk-=wjAVTCZ9-X6ETA7SASNhrOyJuCgn792E_Wmn+JaEQ8N0Q@mail.gmail.com>
In-Reply-To: <CAHk-=wjAVTCZ9-X6ETA7SASNhrOyJuCgn792E_Wmn+JaEQ8N0Q@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 18 Sep 2019 10:23:28 +0300
Message-ID: <CAHp75VeRiNLhmWaSHnw=DhrgyFrshO5hzpnhAwsM+ZiMyaCSTw@mail.gmail.com>
Subject: Re: [GIT PULL] LED updates for 5.4-rc1
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        ada@thorsis.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Dan Murphy <dmurphy@ti.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Joe Perches <joe@perches.com>, kw@linux.com,
        Linus Walleij <linus.walleij@linaro.org>,
        nishkadg.linux@gmail.com, nstoughton@logitech.com, oleg@kaa.org.ua,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Tony Lindgren <tony@atomide.com>, wenwen@cs.uga.edu,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Sep 18, 2019 at 10:16 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, Sep 17, 2019 at 6:13 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > So this is fine and I've pulled it,
>
> Famous last words. I now get a new warning:
>
> drivers/i2c/i2c-core-acpi.c:347:12: warning:
> =E2=80=98i2c_acpi_find_match_adapter=E2=80=99 defined but not used [-Wunu=
sed-function]
>   347 | static int i2c_acpi_find_match_adapter(struct device *dev,
> const void *data)
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> with this pull request.  I'll have to look at it after dinner.
>
>               Linus

One of those *device core* patch broke i2c ACPI, which has been fixed by
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
drivers/i2c/i2c-core-acpi.c?id=3D644bf60088955421051e716ab9c8fe7fb7997fd7

As I read above the merge commit didn't take this patch.

Solution might be to merge this PR after corresponding bundle of
device core stuff.

--=20
With Best Regards,
Andy Shevchenko
