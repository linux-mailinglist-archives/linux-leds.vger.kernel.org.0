Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEDFB17EC4F
	for <lists+linux-leds@lfdr.de>; Mon,  9 Mar 2020 23:52:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbgCIWwQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 9 Mar 2020 18:52:16 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:47360 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726656AbgCIWwP (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 9 Mar 2020 18:52:15 -0400
Received: by mail.z3ntu.xyz (Postfix, from userid 182)
        id E5BE3C3FAC; Mon,  9 Mar 2020 22:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1583794332; bh=gQwhg6Y3501OZkUxA6UXYJ1D5RqvkeFPm6/Cqf5YXUA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=YCKeCIdFS7oLDvN3u1GGs5WpVo2300tfLiL6UOsUoDcSVZH+/8TNRsIMdzGbNSsnI
         2oSQAsC36AtVwVDhZBEivXV1n/r7udCF+9DtDu/7HINaEGQ1OZlEKLggI/fogXsZ7N
         u+V9+zmcwwh+vVsXKqY/MqpQesZS1OWTBCg+TRRo=
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on arch-vps
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
        PDS_OTHER_BAD_TLD,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.4
Received: from g550jk.localnet (80-110-126-226.cgn.dynamic.surfer.at [80.110.126.226])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id A5234C3FAC;
        Mon,  9 Mar 2020 22:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1583794327; bh=gQwhg6Y3501OZkUxA6UXYJ1D5RqvkeFPm6/Cqf5YXUA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=MWbyA1l+96Lqvu6rN9XUN0a6ng9lpjIdsEQkZysaXBPY4zArOd5F34z/AukWmKY9o
         6mQ9lUeVpk2raOj09KWarUmACYAVDPEQ7ovigM76FVny4eAs5itD+L+UH0+YRFbYK4
         PCbNXI1Ok+BzV1vjL539vF+uwIw91rMcEOxbJPXQ=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     Sakari Ailus <sakari.ailus@iki.fi>, Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Icenowy Zheng <icenowy@aosc.io>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 3/3] leds: add sgm3140 driver
Date:   Mon, 09 Mar 2020 23:52:06 +0100
Message-ID: <2804366.mvXUDI8C0e@g550jk>
In-Reply-To: <20200309224926.GA2917@duo.ucw.cz>
References: <20200309203558.305725-1-luca@z3ntu.xyz> <20200309221805.GD2619@valkosipuli.retiisi.org.uk> <20200309224926.GA2917@duo.ucw.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel

On Montag, 9. M=E4rz 2020 23:49:27 CET Pavel Machek wrote:
> Hi!
>=20
> > > +#define FLASH_TIMEOUT_DEFAULT		250000 /* 250ms */
> > > +#define FLASH_MAX_TIMEOUT_DEFAULT	300000 /* 300ms */
> >=20
> > Add U, and you can remove the cast elsewhere.
>=20
> I'll disagree here. Avoid U, avoid cast. Neither is needed.

If neither cast to u32 nor the U suffix is used, then this warning will be=
=20
printed:

In file included from ./include/asm-generic/bug.h:19,
                 from ./arch/arm64/include/asm/bug.h:26,
                 from ./include/linux/bug.h:5,
                 from ./include/linux/gpio/consumer.h:5,
                 from drivers/leds/leds-sgm3140.c:4:
drivers/leds/leds-sgm3140.c: In function 'sgm3140_probe':
=2E/include/linux/kernel.h:835:29: warning: comparison of distinct pointer =
types=20
lacks a cast
  835 |   (!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
      |                             ^~
=2E/include/linux/kernel.h:849:4: note: in expansion of macro '__typecheck'
  849 |   (__typecheck(x, y) && __no_side_effects(x, y))
      |    ^~~~~~~~~~~
=2E/include/linux/kernel.h:859:24: note: in expansion of macro '__safe_cmp'
  859 |  __builtin_choose_expr(__safe_cmp(x, y), \
      |                        ^~~~~~~~~~
=2E/include/linux/kernel.h:868:19: note: in expansion of macro '__careful_c=
mp'
  868 | #define min(x, y) __careful_cmp(x, y, <)
      |                   ^~~~~~~~~~~~~
drivers/leds/leds-sgm3140.c:187:18: note: in expansion of macro 'min'
  187 |  priv->timeout =3D min(priv->max_timeout, FLASH_TIMEOUT_DEFAULT);
      |                  ^~~

So one of both is needed.

>=20
> Best regards,
> 							=09
	Pavel

Regards
Luca


