Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9AA5388B89
	for <lists+linux-leds@lfdr.de>; Wed, 19 May 2021 12:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347887AbhESKTm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 19 May 2021 06:19:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:35054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1347871AbhESKTh (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 19 May 2021 06:19:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C549E61244;
        Wed, 19 May 2021 10:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621419498;
        bh=4czM9EYWeLrdCcBbSESA/iLnLGU3ZjPNgJ15BIIYftQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=I3ULXtV0frIXd+jbldhclcCbCjpHhBkpbkewONFQKZXGGIYosRiuIe1Aq+v5xGExw
         sSfsiqTwa3Xpxsof71XapkzyE/EyItT2SyaI+Y726f67/A+MB3SrC7gmxLdpQfP/dt
         Jv2OdHDjJvyuchD3xx3l24J7XRwpVvRTLHqQqcoEyZEPB3Ts+H4i/mHFyvQxMCJxRY
         RAO5aXeie/LVYSvON7mB5YvMDwFGEv2WhMkFBztNJbgmeCeFuaV0q85t8mola1egR7
         LnLp5Ykth1NaHhz9gQGaiB1w5vvuvXd2ZLzChi1sQpbpl6ZwJmZND+rN+hxgpoKOTi
         +2q8byeQ2iyxg==
Date:   Wed, 19 May 2021 12:18:12 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Pavel Machek <pavel@ucw.cz>, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 16/17] leds: leds-nuc: add support for changing the
 ethernet type indicator
Message-ID: <20210519121812.4285b3ea@coco.lan>
In-Reply-To: <20210519100253.49b155e9@thinkpad>
References: <cover.1621349813.git.mchehab+huawei@kernel.org>
        <792598f4a1a3219b6517057c92559b0f0a95b419.1621349814.git.mchehab+huawei@kernel.org>
        <20210519100253.49b155e9@thinkpad>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Em Wed, 19 May 2021 10:02:53 +0200
Marek Beh=C3=BAn <kabel@kernel.org> escreveu:

> What possible configurations does this support?
>=20
> Does this blink on rx/tx activity for a specific ethernet port?
>=20

When the indicator is set to monitor Ethernet, it can work on either
LAN1, LAN2 or both LAN interfaces.

> There is a work in progress to add support for transparent offloading of
> LED triggers, with the netdev trigger being the first target.
>=20
> This means that after that is done, you could implement this driver so
> that when netdev trigger is enabled on a supported interface, your
> driver will offload the blinking to the HW.

On NUC leds, this is already offloaded to HW/firmware.=20

All it takes is to tell the BIOS via ACPI/WMI what LED will be used
for monitoring the Ethernet activity, and on what port(s).
=20
> This should probably also work for HDD activity, but this would need a
> blockdev trigger first...

HDD activity is also HW/firmware monitored. The only thing the Kernel
needs to to is to select what LED will be set as the HDD activity
indicator.

Thanks,
Mauro
