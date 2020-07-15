Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DF34220DFD
	for <lists+linux-leds@lfdr.de>; Wed, 15 Jul 2020 15:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731635AbgGONVZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 15 Jul 2020 09:21:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731457AbgGONVY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 15 Jul 2020 09:21:24 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74127C061755;
        Wed, 15 Jul 2020 06:21:24 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTPSA id 2E272140A60;
        Wed, 15 Jul 2020 15:21:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1594819283; bh=WVQHLBnbGbOBnmAoMTDufYi1LLuac3moiz5aaKIoeSc=;
        h=Date:From:To;
        b=G7MA1GLqOdzN1A8ORSkjWh3TMH2VOl8VVZXxMwsqnClzDnvyGrKQXNawRBxbFLu/C
         /MSUJijx16New9hqzZxRrDgrYyaS57ijf3UP3Cl8KHPlm8Kd7avTDvoWvdFoW2T+s1
         UXcBeqbjxIbFR+zYkQNhr6Oz515N+dEq+YP/RuWY=
Date:   Wed, 15 Jul 2020 15:21:22 +0200
From:   Marek =?ISO-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v30 05/16] leds: multicolor: Introduce a multicolor
 class definition
Message-ID: <20200715152122.437016b3@dellmb.labs.office.nic.cz>
In-Reply-To: <20200713154544.1683-6-dmurphy@ti.com>
References: <20200713154544.1683-1-dmurphy@ti.com>
        <20200713154544.1683-6-dmurphy@ti.com>
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

On Mon, 13 Jul 2020 10:45:33 -0500
Dan Murphy <dmurphy@ti.com> wrote:

> Introduce a multicolor class that groups colored LEDs
> within a LED node.
>=20
> The multi color class groups monochrome LEDs and allows controlling
> two aspects of the final combined color: hue and lightness. The
> former is controlled via the intensity file and the latter is
> controlled via brightness file.
>=20
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  .../ABI/testing/sysfs-class-led-multicolor    |  35 +++
>  Documentation/leds/index.rst                  |   1 +
>  Documentation/leds/leds-class-multicolor.rst  |  86 ++++++++
>  drivers/leds/Kconfig                          |  10 +
>  drivers/leds/Makefile                         |   1 +
>  drivers/leds/led-class-multicolor.c           | 204
> ++++++++++++++++++ include/linux/led-class-multicolor.h          |
> 121 +++++++++++ 7 files changed, 458 insertions(+)
>  create mode 100644
> Documentation/ABI/testing/sysfs-class-led-multicolor create mode
> 100644 Documentation/leds/leds-class-multicolor.rst create mode
> 100644 drivers/leds/led-class-multicolor.c create mode 100644
> include/linux/led-class-multicolor.h

Reviewed-by: Marek Beh=C3=BAn <marek.behun@nic.cz>
