Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 071E740495C
	for <lists+linux-leds@lfdr.de>; Thu,  9 Sep 2021 13:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235347AbhIILhn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Sep 2021 07:37:43 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:37949 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234507AbhIILhm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 9 Sep 2021 07:37:42 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 940EF5C00F3;
        Thu,  9 Sep 2021 07:36:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 09 Sep 2021 07:36:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=z
        84Fbf3nPIOdOiXOQMfNzoMo7KM6upDGdYQZme8uE40=; b=A5Ro0B/bexRjW5jH9
        /sRMdr69iL7D7zSJ6FQ1pebvuDqU3neVr4XW834tUPeaWoQxswa9BP5CeN9OYe5z
        SWWXUbK5zw5pTQm1pQYNA8TWDFFqtIm5wsArThwsZwbSYlpv2TvUqVxVLUnZL4Dk
        HvF+7bUlsqLe2JEjiJJe9X3JqvxEbGVj4CeRxrJqbv80Yx0aVJLnziIs/FaDK5tX
        9fRmFdnyJvyTYrXL42hYSsxJlApmyLDxpa0K68BioBIQQaaeLXc67qdiOWlav9lI
        HuFPDvdQILGnYYbkDznep+GHcruwCUi5yqnEY3jLWV2u/z94NJ7syo6bmac4fEDT
        YVhHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=z84Fbf3nPIOdOiXOQMfNzoMo7KM6upDGdYQZme8uE
        40=; b=LsEj1CJ0XNCVHJf8clPu6PPpahWO/Q/H42GSCqAhoLvn1q5C51S6v14ls
        rcjIJtiqaB6JlpDzBv/ub4mC+2UrJp/bQMyCa8Ymt7rUdy7/E6oFgx7kaHQlWJ0w
        fCjsGbvbww59CCDSKvlMsHcZkw+11wylwCNhKU7RxZUTUtDdNFszzfhA8urS08Ld
        EJLG4LHhZdG/WHpiiSUHNqAMvBN+sd8lqoMtb5wKlnID39JduMmx8OgytGfHO6Fd
        J6BGxyeDw5iZnHpKSyWCEL4r90BB91XfwkJ4ZIHeahARcOgoNbCjAz4kaYO+gvw8
        PaOfx1G9/CROer8pxunqLi1XIZVMQ==
X-ME-Sender: <xms:v_E5YVq71b4SknKQLhYv71rBLPnlevsKaHW0jia4qF5UDc_xOfr6ug>
    <xme:v_E5YXq9QVKrbckJse1A0o3ASelHdfJ-AAHYXaJsReVsqKljtu2_3TnYguU3HkXxv
    K0dXbOa-Xr4MXKQJOw>
X-ME-Received: <xmr:v_E5YSOhEYZ5Buzrx5ybSK3AoQZ0CH1x151pKimpaSCCFWaKzXdGNzm-Uv36krjaPveHraPUJqzvWdR2oJh334vvQuDK22l_E9Hq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudefledggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpefgjeettdejgffgffdvteeutdehtdehgeehueetkeefgefhtdetjeekledu
    gedvudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:v_E5YQ56bhfJMHCXV2mXJOWig8UG9hs6v7DfJmlHcfwdLNSbG_zSfQ>
    <xmx:v_E5YU5Q3iAZVz422qgI49UpQw4y77lBG07T6Xdj3KbouFer5dsgPg>
    <xmx:v_E5YYjhnOcM5mzQzeDptKN7Wb5G8UOaTt2an6Kuc1bQHg5DpPw1vQ>
    <xmx:wPE5YWsYR4nxvR3Y1MVsjfNqpMd2gDhD2EWhetf4fDVkbRoKyZ8tRg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Sep 2021 07:36:31 -0400 (EDT)
Date:   Thu, 9 Sep 2021 13:36:28 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Icenowy Zheng <icenowy@aosc.io>, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] leds: sunxi: New driver for the R329/D1 LED
 controller
Message-ID: <20210909113628.ojbtbao7jlb6ophy@gilmour>
References: <20210902234228.32223-1-samuel@sholland.org>
 <20210902234228.32223-2-samuel@sholland.org>
 <20210903103638.5yhuvkyf62i3rp6a@gilmour>
 <70c76fe4-41e4-7232-c961-785193a68859@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <70c76fe4-41e4-7232-c961-785193a68859@sholland.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On Sun, Sep 05, 2021 at 11:17:19PM -0500, Samuel Holland wrote:
> Hi,
>=20
> On 9/3/21 5:36 AM, Maxime Ripard wrote:
> > On Thu, Sep 02, 2021 at 06:42:28PM -0500, Samuel Holland wrote:
> >> Some Allwinner sunxi SoCs, starting with the R329, contain an LED
> >> controller designed to drive RGB LED pixels. Add a driver for it using
> >> the multicolor LED framework, and with LEDs defined in the device tree.
> >>
> >> Signed-off-by: Samuel Holland <samuel@sholland.org>
> >> ---
> >>  drivers/leds/Kconfig      |   8 +
> >>  drivers/leds/Makefile     |   1 +
> >>  drivers/leds/leds-sunxi.c | 562 ++++++++++++++++++++++++++++++++++++++
> >>  3 files changed, 571 insertions(+)
> >>  create mode 100644 drivers/leds/leds-sunxi.c
> >>
> >> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> >> index ed800f5da7d8..559d2ca0a7f4 100644
> >> --- a/drivers/leds/Kconfig
> >> +++ b/drivers/leds/Kconfig
> >> @@ -297,6 +297,14 @@ config LEDS_SUNFIRE
> >>  	  This option enables support for the Left, Middle, and Right
> >>  	  LEDs on the I/O and CPU boards of SunFire UltraSPARC servers.
> >> =20
> >> +config LEDS_SUNXI
> >> +	tristate "LED support for Allwinner sunxi LED controller"
> >> +	depends on LEDS_CLASS
> >> +	depends on ARCH_SUNXI || COMPILE_TEST
> >> +	help
> >> +	  This option enables support for the LED controller provided in
> >> +	  some Allwinner sunxi SoCs.
> >> +
> >=20
> > Same comment for the name
>=20
> Are you concerned about the help text only, or do you also want me to ren=
ame the
> Kconfig symbol?

The driver, the driver symbols and the Kconfig symbol would be nice

> I am happy to change the help text to something like: "This option enables
> support for the LED controller provided in the Allwinner R329 and D1 SoCs=
=2E"
>=20
> But I don't know of any satisfying way to rename the Kconfig symbol. Ther=
e is no
> general category name for "R329 and D1."

Yeah, this is not ideal, but the issue is that nothing is telling us
whether or not it will support *only* the R329 and D1. Chances are it's
going to be featured in a number of other SoCs in the future, so if we
were to have the entire list of supported SoCs in the Kconfig symbol and
driver name, we'd have to always change them everytime a new SoC support
is introduced.

It would be a pain, and it's pretty much guaranteed that someone is
going to forget at some point. To mitigate this, we took the approach to
use the same semantic than the DT compatible: the driver name doesn't
really define the list of all the SoCs supported but matches every SoC
(more or less) compatible with that SoC.

If you want to have the entire list in the Kconfig help though, I don't
see anything wrong with that. Even if it goes unmaintained, it wouldn't
really be a big deal.

Maxime
