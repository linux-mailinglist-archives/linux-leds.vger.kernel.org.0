Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2A9E33FD19
	for <lists+linux-leds@lfdr.de>; Thu, 18 Mar 2021 03:12:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230391AbhCRCLx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 17 Mar 2021 22:11:53 -0400
Received: from smtp2.axis.com ([195.60.68.18]:39726 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230486AbhCRCLn (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 17 Mar 2021 22:11:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1616033503;
  x=1647569503;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=79JSNtFL9rJhQrhCSR7TSC+YDAGv+A8hVh/ky4qOLNI=;
  b=fbXRvepNIABmiTus012nyXOPpYIP7EH48DTcKk1Tj2p6qO1VSGUts7K7
   po0vFXBMeONjpNTmzkMvYEwXnnU78HfTeb/f7/5/pbXD835fbEgTOOPxM
   6aJVbVmhil4/xAImSiaU0Bg1gvrcF7vEwWmBQx77/nlaRbMws5j4DT70+
   fo+XcE4q0wN27DgMnU6oFs0sGCd57j67qO9gwjyViYBWtgJifEhm/7J7Q
   9lLSTVcPRDPmKvSmux+B1Daywf3LvdQFuQH61VC9ESF2Zg4N7OxmtHtNz
   v6ZQ5PVeXqonI2DXR1EDL0AvlDmaLayM7i5OkW8U6Qt/qtd6zO7zHpIye
   A==;
From:   Hermes Zhang <Hermes.Zhang@axis.com>
To:     Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>
CC:     Dan Murphy <dmurphy@ti.com>, kernel <kernel@axis.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: RE: [PATCH] leds: leds-dual-gpio: Add dual GPIO LEDs driver
Thread-Topic: [PATCH] leds: leds-dual-gpio: Add dual GPIO LEDs driver
Thread-Index: AQHXFnc53ECqmB4gek68ETSLZV586Kp/A6+AgAoFnGA=
Date:   Thu, 18 Mar 2021 02:11:42 +0000
Message-ID: <fbeb1c97406c4ea8b6527ccbb25d5fe9@XBOX01.axis.com>
References: <20210311130408.10820-1-chenhui.zhang@axis.com>
 <20210311180225.GA11650@duo.ucw.cz>
In-Reply-To: <20210311180225.GA11650@duo.ucw.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

> > +	priv =3D devm_kzalloc(dev, sizeof(struct gpio_dual_leds_priv),
> GFP_KERNEL);
> > +	if (!priv)
> > +		return -ENOMEM;
> > +
> > +	priv->low_gpio =3D devm_gpiod_get(dev, "low", GPIOD_OUT_LOW);
> > +	ret =3D PTR_ERR_OR_ZERO(priv->low_gpio);
> > +	if (ret) {
> > +		dev_err(dev, "cannot get low-gpios %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	priv->high_gpio =3D devm_gpiod_get(dev, "high", GPIOD_OUT_LOW);
> > +	ret =3D PTR_ERR_OR_ZERO(priv->high_gpio);
> > +	if (ret) {
> > +		dev_err(dev, "cannot get high-gpios %d\n", ret);
> > +		return ret;
> > +	}
>=20
> Actually... I'd call it led-0 and led-1 or something. Someone may/will co=
me
> with 4-bit GPIO LED one day, and it would be cool if this could be used w=
ith
> minimal effort.
>=20
> Calling it multi_led in the driver/bindings would bnot be bad, either.
>=20

Hi all,

I have try to use leds-regulator to implement my case, most works. But the =
only thing doesn't work is the enable-gpio. In my case, we don't have a rea=
l enable gpio, so when we set LED_OFF, it could not off the LED as we expec=
ted.=20

So I think I will back to the new multi LED driver, but make it more generi=
c.=20

Best Regards,
Hermes
