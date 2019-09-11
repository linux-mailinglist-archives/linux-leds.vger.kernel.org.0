Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63FFAB04D4
	for <lists+linux-leds@lfdr.de>; Wed, 11 Sep 2019 22:25:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729277AbfIKUZ1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Sep 2019 16:25:27 -0400
Received: from mail.andi.de1.cc ([85.214.55.253]:35838 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729054AbfIKUZ1 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 11 Sep 2019 16:25:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=KHbCcZ8BvWWbKPSh5z+H7SgPQzQ4ifBlCer1pX9BQL0=; b=hf05DHewho7GMIGCsH6/PGeoio
        TGv5pVTLJKtBGYQuR9O23JhXG5QQBFQf0V2+KLqVOFIomAerLdkInBvA12Nh22VovQPgot39NQJJF
        064uTu5vshQfNEAFAkSfKJs+GTMkN5eWl7TkiwuP9es2KdReiUOZjp8+XSaY1uEhNT6s=;
Received: from p200300ccff0b59001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0b:5900:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1i89Aw-0003L7-B7; Wed, 11 Sep 2019 22:25:14 +0200
Date:   Wed, 11 Sep 2019 22:25:13 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Daniel Thompson <daniel.thompson@linaro.org>,
        <lee.jones@linaro.org>, <jingoohan1@gmail.com>,
        <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <b.zolnierkie@samsung.com>,
        <dri-devel@lists.freedesktop.org>, <linux-leds@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-fbdev@vger.kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v2 2/2] backlight: lm3630a: add an enable gpio for the
 HWEN pin
Message-ID: <20190911222513.489b5235@aktux>
In-Reply-To: <a3f10318-11f4-3b78-47e5-d9add8a46791@ti.com>
References: <20190910212909.18095-1-andreas@kemnade.info>
        <20190910212909.18095-3-andreas@kemnade.info>
        <20190911102533.not4ta3xwgm6bhjo@holly.lan>
        <a3f10318-11f4-3b78-47e5-d9add8a46791@ti.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Score: -1.0 (-)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 11 Sep 2019 13:48:36 -0500
Dan Murphy <dmurphy@ti.com> wrote:


> >> @@ -535,6 +538,13 @@ static int lm3630a_probe(struct i2c_client *clien=
t,
> >>   	}
> >>   	pchip->pdata =3D pdata;
> >>  =20
> >> +	pchip->enable_gpio =3D devm_gpiod_get_optional(&client->dev, "enable=
",
> >> +						GPIOD_OUT_HIGH);
> >> +	if (IS_ERR(pchip->enable_gpio)) {
> >> +		rval =3D PTR_ERR(pchip->enable_gpio);
> >> +		return rval; =20
>=20
> the enable gpio is optional so if it fails you log the error and move on
>
well, if the gpio is not there, then it returns NULL.
It might return e.g. -EDEFER. So I need to check for errors here.
=20
> Also on driver removal did you want to set the GPIO to low to disable=20
> the device to save power?
>=20
page 5 of the datasheet says:

Ishdn =3D Typ. 1=C2=B5A max. 4=C2=B5A.
For HWEN=3DVin, I2c shutdown  (I guess this means outputs powered off)
ond for HWEN=3DGND.

So are we really saving something here?

Regards,
Andreas
