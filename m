Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4DA421CC1D
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2020 01:18:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727906AbgGLXSo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 12 Jul 2020 19:18:44 -0400
Received: from mail.nic.cz ([217.31.204.67]:34040 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727785AbgGLXSn (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 12 Jul 2020 19:18:43 -0400
Received: from localhost (unknown [172.20.6.135])
        by mail.nic.cz (Postfix) with ESMTPSA id 1C496140637;
        Mon, 13 Jul 2020 01:18:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1594595922; bh=oWEGZNZzPfZSyReuwO/r4sDrMA3Ym1alNAfm/HZaDUE=;
        h=Date:From:To;
        b=dgarWx6WIlF5MziAb8hhRGF0jJpKwHv1ukVGYMshFaJ0BLFHVaS8AdZqUmwhGKiSX
         TIGAe3AjNYw36p8Iw4ZKT/60tRNhn2hHflEqIfi0hpAviHIOBJVodrF7tYQBIbD3bV
         d0rmZU6noMPs44fDiolwpvRhhT9L2OTiTvTeMdgw=
Date:   Mon, 13 Jul 2020 01:18:41 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     =?UTF-8?B?T25kxZllag==?= Jirman <megous@megous.com>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
Subject: Re: [PATCH RFC] leds: Add support for per-LED device triggers
Message-ID: <20200713011841.25904273@nic.cz>
In-Reply-To: <20200713011544.0adc51f1@nic.cz>
References: <20200702144712.1994685-1-megous@megous.com>
        <20200711100409.GA18901@amd>
        <20200711210111.5ysijhexgyzyr7u7@core.my.home>
        <20200712072554.GC4721@duo.ucw.cz>
        <20200712134911.r3lig4hgyqhmslth@core.my.home>
        <20200712191111.GA20592@amd>
        <20200712223821.742ljr4qxdrx3aqv@core.my.home>
        <20200713011544.0adc51f1@nic.cz>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,URIBL_BLOCKED,
        USER_IN_WHITELIST shortcircuit=ham autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 13 Jul 2020 01:15:44 +0200
Marek Behun <marek.behun@nic.cz> wrote:

> On Mon, 13 Jul 2020 00:38:21 +0200
> Ond=C5=99ej Jirman <megous@megous.com> wrote:
>=20
> > So after trying to use this, this seems to disallow the use of multiple=
 HW
> > triggers per LED. That's fine by me, because using one HW sysfs configu=
red
> > trigger per LED that use case is my proposal, but is it desireable in g=
eneral? =20
>=20
> Why? If you register one LED and several triggers, all sharing the same
> trigger_type pointer, I think it should work.
>=20
> Marek

The problem arises when I have two LEDs and two HW triggers, and the
hardware allows setting one HW trigger on both LEDs and other HW
trigger only on one LED. But this could simply be ignored - the
set_trigger function could simply return -ENOTSUPP or something.

Marek
