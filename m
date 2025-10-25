Return-Path: <linux-leds+bounces-5876-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0BCC09069
	for <lists+linux-leds@lfdr.de>; Sat, 25 Oct 2025 14:42:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BE9654E02D6
	for <lists+linux-leds@lfdr.de>; Sat, 25 Oct 2025 12:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 575472FBDE9;
	Sat, 25 Oct 2025 12:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=klarinett.li header.i=@klarinett.li header.b="zpnV/IOQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2DA250C06;
	Sat, 25 Oct 2025 12:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.243.197.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761396168; cv=none; b=FAdHVnF7oy/5nrub0y1vtvhmtl/yuteFjOQi3EkveoS8w7i7v/UJifj1cYce9Suju6ILVX3t+Wf/+aLVNdWp01+cJbkPEYd/BrXs9J4MUdvqsKjADv3t+X/x4DEGiRiMuhKlEb+GMlrIl8p05RcvoieRnBrUSy77s6gjMcGEId0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761396168; c=relaxed/simple;
	bh=zjsOv7gJgjzpeM6gwPXZvXT1zgKeR0+kDKb77Gc7lwM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=qea75t+r2Rb8r7uebDYifRUrTsuLDpDa4BHRBfaUj29/QiCsM2HX6TFGH/SvsMt40WFUWW8twW4cYHLmsTTiNyjZsBDnPSklcjO3eVWhZcXHg2x50WX447kCuTNwJnqzu5EddLVf9uDmyk6dqpDYBk+jsIJTflSaivvbn1Airls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=klarinett.li; spf=pass smtp.mailfrom=klarinett.li; dkim=pass (1024-bit key) header.d=klarinett.li header.i=@klarinett.li header.b=zpnV/IOQ; arc=none smtp.client-ip=212.243.197.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=klarinett.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=klarinett.li
Received: from localhost (localhost [127.0.0.1])
	by mail.hostpark.net (Postfix) with ESMTP id B015D162CA;
	Sat, 25 Oct 2025 14:42:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=klarinett.li; h=
	x-mailer:references:message-id:content-transfer-encoding:date
	:date:in-reply-to:from:from:subject:subject:mime-version
	:content-type:content-type; s=sel2011a; t=1761396156; bh=zjsOv7g
	JgjzpeM6gwPXZvXT1zgKeR0+kDKb77Gc7lwM=; b=zpnV/IOQ8aFYB+rBHNBYLDF
	X0mYieaeDwQDucfJYgEzL5oEsai1XybD/T/q/6pvtplAYhYmea2iRAqdLeSUVL+z
	ctvuWTQ9OkycPsYriubSXqHwUvIE1WtrKYfKjx6kfjQeO9WkBS7QP5wa56hiorSM
	4PWJsrgrfoKx/ZoCR/CY=
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
 by localhost (mail0.hostpark.net [127.0.0.1]) (amavis, port 10224) with ESMTP
 id Vrj6O67yuTfg; Sat, 25 Oct 2025 14:42:36 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.hostpark.net (Postfix) with ESMTPSA id A3F2A162C2;
	Sat, 25 Oct 2025 14:42:34 +0200 (CEST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.100.1.1.5\))
Subject: Re: [PATCH] leds: leds-lp50xx: enable chip before any communication
From: Christian Hitz <christian@klarinett.li>
In-Reply-To: <20251025113758.GA29337@google.com>
Date: Sat, 25 Oct 2025 14:42:24 +0200
Cc: Pavel Machek <pavel@kernel.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Dan Murphy <dmurphy@ti.com>,
 Christian Hitz <christian.hitz@bbv.ch>,
 stable@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>,
 linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D09EA9A0-6EC5-45D5-B75C-FF79C8A201E0@klarinett.li>
References: <20251016145623.2863553-1-christian@klarinett.li>
 <20251025113758.GA29337@google.com>
To: Lee Jones <lee@kernel.org>
X-Mailer: Apple Mail (2.3864.100.1.1.5)

Hi Lee

> Am 25.10.2025 um 13:37 schrieb Lee Jones <lee@kernel.org>:
>=20
> On Thu, 16 Oct 2025, Christian Hitz wrote:
>=20
>> From: Christian Hitz <christian.hitz@bbv.ch>
>>=20
>> If a GPIO is used to control the chip's enable pin, it needs to be =
pulled
>> high before any SPI communication is attempted.
>> Split lp50xx_enable_disable() into two distinct functions to enforce
>> correct ordering.
>> Observe correct timing after manipulating the enable GPIO and SPI
>> communication.
>=20
> Is this currently broken?  How did it test okay before?

Yes, the driver ist currently broken when used with an enable GPIO.

Assume the used enable GPIO is low when the probe function is entered. =
In this case
the device is in SHUTDOWN mode and does not react to i2c commands.

- The call to lp50xx_reset() on line 548 has therefore no effect as i2c =
is not possible yet.
- Then - on line 552 - lp50xx_enable_disable() is called. As =
"priv->enable_gpio=E2=80=9C has not
yet been initialized, setting the GPIO has no effect. Also the i2c =
enable command is not
executed as the device is still in SHUTDOWN.
- On line 556 lp50xx_probe_dt() finally the rest of the DT is parsed and =
the configured=20
priv->enable_gpio is set up.

As a result the device is still in SHUTDOWN mode and not ready for =
operation.

>=20
> You need to explain more about why you are changing the semantics.
>=20
> See below.
>=20
>> Fixes: 242b81170fb8 ("leds: lp50xx: Add the LP50XX family of the RGB =
LED driver")
>>=20
>> Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
>> Cc: stable@vger.kernel.org
>> ---
>> drivers/leds/leds-lp50xx.c | 51 =
+++++++++++++++++++++++++++-----------
>> 1 file changed, 36 insertions(+), 15 deletions(-)
>>=20
>> diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
>> index d19b6a459151..f23e9ae434e4 100644
>> --- a/drivers/leds/leds-lp50xx.c
>> +++ b/drivers/leds/leds-lp50xx.c
>> @@ -52,6 +52,8 @@
>>=20
>> #define LP50XX_SW_RESET 0xff
>> #define LP50XX_CHIP_EN BIT(6)
>> +#define LP50XX_START_TIME_US 500
>> +#define LP50XX_RESET_TIME_US 3
>>=20
>> /* There are 3 LED outputs per bank */
>> #define LP50XX_LEDS_PER_MODULE 3
>> @@ -374,19 +376,42 @@ static int lp50xx_reset(struct lp50xx *priv)
>> return regmap_write(priv->regmap, priv->chip_info->reset_reg, =
LP50XX_SW_RESET);
>> }
>>=20
>> -static int lp50xx_enable_disable(struct lp50xx *priv, int =
enable_disable)
>> +static int lp50xx_enable(struct lp50xx *priv)
>> {
>> int ret;
>>=20
>> - ret =3D gpiod_direction_output(priv->enable_gpio, enable_disable);
>> + if (priv->enable_gpio) {
>=20
> Why have you added this check back in?
>=20
> See: 5d2bfb3fb95b ("leds: lp50xx: Get rid of redundant check in =
lp50xx_enable_disable()")

I have re-added the check because of the =E2=80=9Eudelay()=E2=80=9C call =
below. This delay is not necessary=20
when there is no enable_gpio. I assumed that it is better to do a double =
check here than to wait
500us in cases where no enable_gpio is used.

>=20
>> + ret =3D gpiod_direction_output(priv->enable_gpio, 1);
>=20
> Take the opportunity to define the magic numbers '0' and '1'.

Will do.

>=20
>> + if (ret)
>> + return ret;
>> +
>> + udelay(LP50XX_START_TIME_US);
>> + } else {
>=20
> In this old code we did both.  Why are we now choosing?

Coming out of SHUTDOWN state the device is already reset and =
lp50xx_reset() is a no-op.
To ensure a clean reset in all cases (also when enable GPIO was already =
high before) I will
make the reset unconditional again.

Thanks for the review and comments. I will prepare a v2 to include the =
comments and expand
the commit message.

Regards
Christian=20

>=20
>> + ret =3D lp50xx_reset(priv);
>> + if (ret)
>> + return ret;
>> + }
>> +
>> + return regmap_write(priv->regmap, LP50XX_DEV_CFG0, LP50XX_CHIP_EN);
>> +}
>> +
>> +static int lp50xx_disable(struct lp50xx *priv)
>> +{
>> + int ret;
>> +
>> + ret =3D regmap_write(priv->regmap, LP50XX_DEV_CFG0, 0);
>> if (ret)
>> return ret;
>>=20
>> - if (enable_disable)
>> - return regmap_write(priv->regmap, LP50XX_DEV_CFG0, LP50XX_CHIP_EN);
>> - else
>> - return regmap_write(priv->regmap, LP50XX_DEV_CFG0, 0);
>> + if (priv->enable_gpio) {
>> + ret =3D gpiod_direction_output(priv->enable_gpio, 0);
>> + if (ret)
>> + return ret;
>> +
>> + udelay(LP50XX_RESET_TIME_US);
>> + }
>>=20
>> + return 0;
>> }
>>=20
>> static int lp50xx_probe_leds(struct fwnode_handle *child, struct =
lp50xx *priv,
>> @@ -453,6 +478,10 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
>> return dev_err_probe(priv->dev, PTR_ERR(priv->enable_gpio),
>>     "Failed to get enable GPIO\n");
>>=20
>> + ret =3D lp50xx_enable(priv);
>> + if (ret)
>> + return ret;
>> +
>> priv->regulator =3D devm_regulator_get(priv->dev, "vled");
>> if (IS_ERR(priv->regulator))
>> priv->regulator =3D NULL;
>> @@ -550,14 +579,6 @@ static int lp50xx_probe(struct i2c_client =
*client)
>> return ret;
>> }
>>=20
>> - ret =3D lp50xx_reset(led);
>> - if (ret)
>> - return ret;
>> -
>> - ret =3D lp50xx_enable_disable(led, 1);
>> - if (ret)
>> - return ret;
>> -
>> return lp50xx_probe_dt(led);
>> }
>>=20
>> @@ -566,7 +587,7 @@ static void lp50xx_remove(struct i2c_client =
*client)
>> struct lp50xx *led =3D i2c_get_clientdata(client);
>> int ret;
>>=20
>> - ret =3D lp50xx_enable_disable(led, 0);
>> + ret =3D lp50xx_disable(led);
>> if (ret)
>> dev_err(led->dev, "Failed to disable chip\n");
>>=20
>> --=20
>> 2.51.0
>>=20
>=20
> --=20
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]


