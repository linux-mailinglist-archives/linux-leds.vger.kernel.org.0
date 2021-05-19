Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C740E3892D1
	for <lists+linux-leds@lfdr.de>; Wed, 19 May 2021 17:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354031AbhESPlw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 19 May 2021 11:41:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:57728 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1354956AbhESPlq (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 19 May 2021 11:41:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 403C5611AB;
        Wed, 19 May 2021 15:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621438826;
        bh=B9Wi5vr77hBniV2pQ1WqogIZWptWfeFj78jtjRtVE3w=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=HSM2BtVsD55HD85d41Eay6q6uGWZP2R0DmQVJAz0t8yyuJC/HpjzyFMdONHB66qhw
         4U13gvbBno2oUFxRarpwUcWo0ZxoyZXxbyj9OhvhqcYJUzJ3AKJkZgT8qxBre9mxIj
         8cD8m9LWWDJKK33V+w0ReWBVl5RFQgkqweQJi+BHdp5jrRlxS4V5n/qbpYf+mkMEAg
         FCMwyYDs+LaTP/P0KR+NmYG7Z3IKjFmi/yV2HJL56TsIxCfGjek53PHpWEuI5Crt4A
         QIEUwZ6l3VsNSmPhu6hR4ZdJ0a4z3ZT7mO8kREO/ovRatNqsdfa9f+Ark3vglUABBe
         QXYhUJtll78jg==
Date:   Wed, 19 May 2021 17:40:17 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>, linuxarm@huawei.com,
        mauro.chehab@huawei.com, gregkh@linuxfoundation.org,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 06/17] leds: leds-nuc: allow changing the LED colors
Message-ID: <20210519174017.2f8295e1@coco.lan>
In-Reply-To: <20210519140451.0eae7d47@thinkpad>
References: <cover.1621349813.git.mchehab+huawei@kernel.org>
        <f1fb0d3b7404bab46ba22a670ab58eb0e8b2389e.1621349814.git.mchehab+huawei@kernel.org>
        <20210519095713.07be987d@thinkpad>
        <20210519120507.3ab8c6a4@coco.lan>
        <20210519110725.GB24621@duo.ucw.cz>
        <20210519140040.5c685336@coco.lan>
        <20210519140451.0eae7d47@thinkpad>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Em Wed, 19 May 2021 14:04:51 +0200
Marek Beh=C3=BAn <kabel@kernel.org> escreveu:

> On Wed, 19 May 2021 14:00:40 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
>=20
> > Em Wed, 19 May 2021 13:07:25 +0200
> > Pavel Machek <pavel@ucw.cz> escreveu:
> >=20
> > > Hi!
> > >  =20
> > > > > We have multicolor LED framerwork in Linux. This should be implem=
ented
> > > > > via that framework. Please do not implement your own way for RGB =
leds.
> > > > >=20
> > > > > Marek   =20
> > > >=20
> > > > I saw the multicolor LED framework, but IMO it won't fit here.
> > > >=20
> > > > See, Linux doesn't have direct access to the LED. The access is
> > > > provided via ACPI WMI.   =20
> > >=20
> > > So?
> > >  =20
> > > > The way BIOS reports the type of the led is via a bitmap flag.
> > > > So, the same LED can be represented with either single-color
> > > > or multi-color one. See:
> > > > 	https://www.intel.com/content/dam/support/us/en/documents/intel-nu=
c/WMI-Spec-Intel-NUC-NUC10ixFNx.pdf
> > > >=20
> > > > 	Table 2.2 LED Color Type
> > > > 	Bit Number	Type
> > > > 	0		Dual-color Blue / Amber
> > > > 	1		Dual-color Blue / White
> > > > 	2		RGB-color
> > > > 	3		Single-color LED
> > > >=20
> > > > Also as each NUC can support up to 7, and they may have a mix of
> > > > single color, dual color and RGB LEDs, if we would use the
> > > > multicolor class for the colored ones, that would mean that the
> > > > code will need to be duplicated, as, depending on what the BIOS
> > > > reports, the LED would need to be exposed either as via
> > > > led-multicolor-class or as leds-class.   =20
> > >=20
> > > So?
> > >  =20
> > > > Worse than that, there's even a WMI command that would allow
> > > > to "switch LED type" (see page 8). On other words, the BIOS can
> > > > expose a "virtual" single-color LED, but actually implemented
> > > > in hardware using a RGB one, and this can be changed in real time. =
  =20
> > >=20
> > > So you simply always use it as RGB one? =20
> >=20
> > Hmm... are you meaning that I should only use the multicolor led class,
> > even when the BIOS is reporting the LEDs as single color?
> >=20
> > I can surely do that.
>=20
> No. If the BIOS reports that the LED is single color, register a
> classic LED. If the BIOS reports a RGB LED, register a multi-color
> LED...

Ok. I'll try to change the code to work with both APIs. Let's hope
it won't result on too much code duplication.

-

I have one doubt about how to use this API. It is meant just
for the RGB LEDs, right?

NUC also have dual-color and multi-colored leds that don't
allow specifying the intensity of each component. All it lets
is to change the color (being, for instance, either blue or
white).

For those, the API should basically show the names of the
supported colors for each LED, letting the user change it
to some other color.

How should I map such leds? via led-class or via=20
led-class-multicolor?

Thanks,
Mauro
