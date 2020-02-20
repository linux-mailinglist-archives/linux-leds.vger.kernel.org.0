Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EA96165D04
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2020 12:57:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727705AbgBTL5J (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 20 Feb 2020 06:57:09 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:37834 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727545AbgBTL5J (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 20 Feb 2020 06:57:09 -0500
Received: by mail-pj1-f65.google.com with SMTP id m13so802476pjb.2;
        Thu, 20 Feb 2020 03:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zyM10aVkzbQe75G/ZJhaQ8/QmMoTt48kSiKXx5MsLFY=;
        b=t+NPOgYcqy+UyW8sYh55r1uJucl0R0ISFr1om7ivzNeBR80cnZTsLSQJjZedv8EDUY
         mJkZ/Il8PA+a+XZIvFa9a6wCXBjYIE2+tYEL6g/jWB81xq+avNH28lqXLd6DLq0GA15B
         jRoQ+H4ILyk3TLnkklRSMquZcU87U/D9CbI7mo2Q1gjJAIPQ0+eatMgpdXeOrfSLYVvr
         N9f+SGN8L/XYj8mpwVHnpKBB2w31allwwIUjwgMYvBwcjVZIMjUdADBBcxw67BQaDXL8
         UQkEsPepAez52j52P5JwVkXP12KuypSpoOPkxxP5slabflNDYkNtt49NE53cBy/+o7zQ
         tnXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zyM10aVkzbQe75G/ZJhaQ8/QmMoTt48kSiKXx5MsLFY=;
        b=qBnoD3Ywf4gFf7Fgvyd+DFj2xlVJKtjYQT+1+F26sPiHM4R+8gdWvYnJA1J7UGKIuT
         meoqgkKz9ij3BcUcLuL2WQUA1GsPpEPQ7nfijAhj+QBTw6ERlBluBSdGgvrAwzO++eSp
         gxjGSHssTXqFkM3C0ZMcdQGkJpR1UFOVmi4/zX4nHR9IsCk537kI+J3DCN/d17vkkoLs
         9YcpVhXEru4nhEvL7aVjNoeJLbwX/tVPW/xkDE5FoYHPl3xiZnUlWTFH8QSPNRPBfi4X
         ZyDDkSumFMU0kcAswH0HcVlQgU7x8nhA+EHR2hiFgu1k60oXj4wohJ7PoHlBADQHrfT/
         MIFA==
X-Gm-Message-State: APjAAAVhCholNPbx6P+XVYgXbQCz+ElFNgVGnRl0uEdLX7NfZMfZ/xIE
        z2C2/Cs4DLkCjJPBO+7TIOZjlJWGZvBa2Zu2CmU=
X-Google-Smtp-Source: APXvYqx3BKH3fNOcUKacWCjX06eA80jdskWX4Vw3qpgkDiMclpjW06DHofZcFYaUnd5JuQR2vJfpGhbeg4ah0+FP34U=
X-Received: by 2002:a17:902:54f:: with SMTP id 73mr30132442plf.255.1582199828503;
 Thu, 20 Feb 2020 03:57:08 -0800 (PST)
MIME-Version: 1.0
References: <20200213091600.554-1-uwe@kleine-koenig.org> <20200213091600.554-2-uwe@kleine-koenig.org>
 <CAHp75VcStj5sE3f0uK2deOWC=ojfx-z1fbrh6Lu6jAor9F9PgA@mail.gmail.com>
 <20200220074901.ohcrisjgd26555ya@pengutronix.de> <CAHp75VcxXWputX1y90t8f-c0a3dw2CHU6=ebQ+o6e8Z1GymiDw@mail.gmail.com>
 <20200220105718.eoevd3kb63zzrotu@pengutronix.de> <CAHp75Vd3KN81qxOWJQ7v=GimSLtVymur_iPsf91pka1STc1nfA@mail.gmail.com>
In-Reply-To: <CAHp75Vd3KN81qxOWJQ7v=GimSLtVymur_iPsf91pka1STc1nfA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 20 Feb 2020 13:57:00 +0200
Message-ID: <CAHp75VcC2adjcPUiWaZhXZgocWDPoUJZwGMYNfJWSqyqDAY1Dg@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] lib: new helper kstrtodev_t()
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Sascha Hauer <kernel@pengutronix.de>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Jiri Slaby <jslaby@suse.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Feb 20, 2020 at 1:46 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Feb 20, 2020 at 12:57 PM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> > On Thu, Feb 20, 2020 at 12:22:36PM +0200, Andy Shevchenko wrote:

...

> > Also I don't understand yet, what you want me to do.
>
> I have issues with kstrto() not playing with simple numbers (boolean

s/simple/simple and single/

> is a special case, but still a number at the end).
> I also don't feel good with too narrow usage of the newly introduced help=
er
>
> > Assume I'd be
> > willing to use simple_strtoul, I'd still want to have a function that
> > gives me a dev_t from a given string. Should I put this directly in my
> > led-trigger driver?
>
> I see the following possibilities:

(above doesn't imply the necessity of simple_strto*() use)

> a) put it inside the caller and forget about generic helper
> b) do a generic helper, but 1/ in string_*() namespace, 2/ with a
> delimiter parameter and 3/ possibility to take negative numbers
>
> In b) case, add to the commit message how many potential _existing_
> users may be converted to this.
> Also it would be good to have two versions strict (only \n at the end
> is allowed) and non-strict (based on the amount of users for each
> group).

And don't forget to extend lib/test_string.c accordingly.

--=20
With Best Regards,
Andy Shevchenko
