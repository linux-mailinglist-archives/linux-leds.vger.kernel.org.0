Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80392388DA0
	for <lists+linux-leds@lfdr.de>; Wed, 19 May 2021 14:11:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353377AbhESMMZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 19 May 2021 08:12:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:44044 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1353353AbhESMMZ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 19 May 2021 08:12:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B797E6135B;
        Wed, 19 May 2021 12:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621426266;
        bh=1qGV1MEizSI4H+PzauK7wt07zh4w9jKuGzN0hqDRmMw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Jny1YNCSR14BHEWUkL74Lp1M5E7GpOYnPe0RJyTdCH2kp9hoDcl+odlnPVWAtQHUr
         GGzhFK5AeC7TVLLAdQnnVCoKHo88OgGknrf5EK8TM34fupoH8Yw0G8GJp/ZNjO85vB
         ayobCEuQbS2u00+ou7JttnnStaLHa28Cw0WbAEsQEh+ZYLkd7Gr2NSa0Z3NClYAwld
         rWBx3xkdHM9cy8pGjsQmbAM7HabJwnEHg8ShVpunfdyC4hz78xJQLSIuPUJvdTwdJ9
         sUbcsVfgbd7PGRLFLdQ2DvSpKxXmME+Wlmq9SOLF3WlmsXzIHK7Tts2j97l0yrBOsk
         B0C0EPuH3RXBA==
Date:   Wed, 19 May 2021 14:11:02 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Pavel Machek <pavel@ucw.cz>, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 16/17] leds: leds-nuc: add support for changing the
 ethernet type indicator
Message-ID: <20210519141102.0161a9d9@thinkpad>
In-Reply-To: <20210519121812.4285b3ea@coco.lan>
References: <cover.1621349813.git.mchehab+huawei@kernel.org>
        <792598f4a1a3219b6517057c92559b0f0a95b419.1621349814.git.mchehab+huawei@kernel.org>
        <20210519100253.49b155e9@thinkpad>
        <20210519121812.4285b3ea@coco.lan>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 19 May 2021 12:18:12 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Em Wed, 19 May 2021 10:02:53 +0200
> Marek Beh=C3=BAn <kabel@kernel.org> escreveu:
>=20
> > What possible configurations does this support?
> >=20
> > Does this blink on rx/tx activity for a specific ethernet port?
> >  =20
>=20
> When the indicator is set to monitor Ethernet, it can work on either
> LAN1, LAN2 or both LAN interfaces.
>=20
> > There is a work in progress to add support for transparent offloading of
> > LED triggers, with the netdev trigger being the first target.
> >=20
> > This means that after that is done, you could implement this driver so
> > that when netdev trigger is enabled on a supported interface, your
> > driver will offload the blinking to the HW. =20
>=20
> On NUC leds, this is already offloaded to HW/firmware.=20
>=20
> All it takes is to tell the BIOS via ACPI/WMI what LED will be used
> for monitoring the Ethernet activity, and on what port(s).

Can the LED be put into software controlled mode and also into HW
controlled mode so that HW blinks the LED on ethernet activity?

If so, then this is what I am talking about: transparent HW offloading
of LED triggers:
- I have a LED in /sys/class/leds
- I set "netdev" trigger on this LED
- I set ethernet interface for which the LED should blink
- if the HW can blink the LED for that particular ethernet interface,
  the driver should use HW blinking...

> > This should probably also work for HDD activity, but this would need a
> > blockdev trigger first... =20
>=20
> HDD activity is also HW/firmware monitored. The only thing the Kernel
> needs to to is to select what LED will be set as the HDD activity
> indicator.

Ditto as above, if we had a "blockdev" LED trigger.

Marek
