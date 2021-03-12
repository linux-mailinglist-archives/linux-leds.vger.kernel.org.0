Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE6DE338791
	for <lists+linux-leds@lfdr.de>; Fri, 12 Mar 2021 09:39:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232313AbhCLIid (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 12 Mar 2021 03:38:33 -0500
Received: from mail.thorsis.com ([92.198.35.195]:55028 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232443AbhCLIiF (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 12 Mar 2021 03:38:05 -0500
X-Greylist: delayed 357 seconds by postgrey-1.27 at vger.kernel.org; Fri, 12 Mar 2021 03:38:04 EST
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id EF9C33356;
        Fri, 12 Mar 2021 09:32:06 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id JI1aur4oo8wz; Fri, 12 Mar 2021 09:32:06 +0100 (CET)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id C62C235C5; Fri, 12 Mar 2021 09:32:04 +0100 (CET)
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.2
From:   Alexander Dahl <ada@thorsis.com>
To:     linux-leds@vger.kernel.org
Cc:     Hermes Zhang <chenhui.zhang@axis.com>, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, kernel@axis.com,
        Hermes Zhang <chenhuiz@axis.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: leds-dual-gpio: Add dual GPIO LEDs driver
Date:   Fri, 12 Mar 2021 09:31:58 +0100
Message-ID: <2315048.uTtSMl1LR1@ada>
In-Reply-To: <20210311130408.10820-1-chenhui.zhang@axis.com>
References: <20210311130408.10820-1-chenhui.zhang@axis.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hallo Hermes,

thanks for your effort.

Am Donnerstag, 11. M=E4rz 2021, 14:04:08 CET schrieb Hermes Zhang:
> From: Hermes Zhang <chenhuiz@axis.com>
>=20
> Introduce a new Dual GPIO LED driver. These two GPIOs LED will act as
> one LED as normal GPIO LED but give the possibility to change the
> intensity in four levels: OFF, LOW, MIDDLE and HIGH.

Interesting use case. Is there any real world hardware wired like that you=
=20
could point to?

> +config LEDS_DUAL_GPIO
> +	tristate "LED Support for Dual GPIO connected LEDs"
> +	depends on LEDS_CLASS
> +	depends on GPIOLIB || COMPILE_TEST
> +	help
> +	  This option enables support for the two LEDs connected to GPIO
> +	  outputs. These two GPIO LEDs act as one LED in the sysfs and
> +	  perform different intensity by enable either one of them or both.

Well, although I never had time to implement that, I suspect that could=20
conflict if someone will eventually write a driver for two pin dual color L=
EDs=20
connected to GPIO pins.  We actually do that on our hardware and I know oth=
ers=20
do, too.

I asked about that back in 2019, see this thread:

https://www.spinics.net/lists/linux-leds/msg11665.html

At the time the multicolor framework was not yet merged, so today I would=20
probably make something which either uses the multicolor framework or at le=
ast=20
has a similar interface to userspace. However, it probably won't surprise y=
ou=20
all, this is not highest priority on my ToDo list. ;-)

(What we actually do is pretend those are separate LEDs and ignore the=20
conflicting case where both GPIOs are on and the LED is dark then.)

Greets
Alex



