Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAFF2220DF4
	for <lists+linux-leds@lfdr.de>; Wed, 15 Jul 2020 15:20:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731728AbgGONUX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 15 Jul 2020 09:20:23 -0400
Received: from mail.nic.cz ([217.31.204.67]:41280 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729900AbgGONUX (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 15 Jul 2020 09:20:23 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTPSA id AAC84140968;
        Wed, 15 Jul 2020 15:20:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1594819221; bh=EhvEo4m4fKGkK7GF8jSxHSKc1eN7KqOotdvfp78dHIE=;
        h=Date:From:To;
        b=FdASlJ7vdxKjyIY/Xqz49mtaP2/xeCzwUwpM08kQJcfFVYoCs84cOKaLYqUXyfgd+
         NoBgXj2NV1/ZrpmNhamXJ2gffI753w1WiLHY+J2HADCMRvmocCGe3ZbS+nGkYULtdN
         2mWcK1PILV6jjZ5y/37lEKdzJjPWNd1XGGBOZWb4=
Date:   Wed, 15 Jul 2020 15:20:17 +0200
From:   Marek =?ISO-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v30 02/16] leds: lp5523: Fix various formatting issues
 in the code
Message-ID: <20200715152017.4961ddc7@dellmb.labs.office.nic.cz>
In-Reply-To: <20200713154544.1683-3-dmurphy@ti.com>
References: <20200713154544.1683-1-dmurphy@ti.com>
        <20200713154544.1683-3-dmurphy@ti.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WHITELIST shortcircuit=ham autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 13 Jul 2020 10:45:30 -0500
Dan Murphy <dmurphy@ti.com> wrote:

> Fix checkpatch errors and warnings for the LP5523.c device
> driver.
>=20
> Acked-by: Pavel Machek <pavel@ucw.cz>
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  drivers/leds/leds-lp5523.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)=20

Reviewed-by: Marek Beh=C3=BAn <marek.behun@nic.cz>
