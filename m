Return-Path: <linux-leds+bounces-7976-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJvjLPxN+GmQsQIAu9opvQ
	(envelope-from <linux-leds+bounces-7976-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 04 May 2026 09:42:52 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5808D4B980F
	for <lists+linux-leds@lfdr.de>; Mon, 04 May 2026 09:42:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63752302AE1C
	for <lists+linux-leds@lfdr.de>; Mon,  4 May 2026 07:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2FE03033D6;
	Mon,  4 May 2026 07:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VniDPVhr"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD622F0C79
	for <linux-leds@vger.kernel.org>; Mon,  4 May 2026 07:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777880455; cv=pass; b=bSL5RjQKk7PyeZFK/v3Ht08DaiRncev+VgH7vBrN9g+4/nMUcFfCAPVJLrvcNFLehlq9wm/UkhJ9D5ujDwIsJ4mLip5g1+iCLp4AabwWx1gZFh+FLDwVoCRAwgbyNTUP3EfTPoF3fz9WbtqYlvTAQb4376KZHh/PBxsf5Xugup0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777880455; c=relaxed/simple;
	bh=PimAmDBuePoh/qzM8yI1lcGMvx3ktmORhXvgjq11LY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B2wZGE2OVCKTwcGdBjmTHWKDIxD4TETJLbsX6MIIIE5Qeifie6ou1QjmzWzr080GG0lDe4ClXPkwtnFVLyfZnY39tmBbew87/CnrBuAOSqyJBGcizEkfZ8w5o2ibY9f6iRJIS+sSs32+kaNF0FtEDiC7CCRJ3SI47YzHqOFNiT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VniDPVhr; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2ee1054627bso2385377eec.1
        for <linux-leds@vger.kernel.org>; Mon, 04 May 2026 00:40:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777880453; cv=none;
        d=google.com; s=arc-20240605;
        b=VqIQb8TI3zfjRMu2ksWKIc8/qpzFXhRFQc7oJrpI3MKd5ME56IxasIdb5cpvLLSZkT
         zSKCENFVsiQZF8yQmmXbf2axaIRv5ATKzt8NFMfAh958nrUTKpdYwr057tMdpi8ZAYEe
         lMCzYGH/37FRKW82ewNMGG8dGIT8iKtsym0rG9gVWfEsnlC1MbJACuJWdYgjmchNYxbh
         LFwoWVZANIQ4kXWAW43rFeejMfKaGGe50nwKELovjK+0N4lnYrlHOq2lgHJJbYrDRlT9
         VUIxo7h7kgYTgAhbNZWceMqCxk/uWWyOiWJ3GCL/1ZDzBpFWBUHlWaPIpu/SN6Gp6/GX
         i1cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LCkxhAVa2Kz1UkiVBw7mtm2nSh9PR7uQTdGuhJ6wxIw=;
        fh=LeyHSG+joskkU2fbkNtOgWt8l3AxC0bq5rLhca0LA7Q=;
        b=HOfN/PubYdFCV3Vi51urRR+RYK+C1o7Uufbe2WnvVz0MKduHqWwl76bp1Pwq7uK9ts
         umluGH36Tmq1FFDoZJBopSqxCcf7a75G1SVnTyFUKUlffvWqPEn7UFD0UNTv76ZJ8H1/
         qkaEpFcjo2m4IUNls1jOeZx/RMZQ+L4lcqq2tyVTJCGzX6KkihMALOQgX7pjtMqZoVlS
         +PlEDefQveu2QLXPd2iZvaH+njgaHy5nytUK6px1nnGnwonCpPmzhZ78NsZHYciUzBY0
         IW6hXGCbwY9GpxTCuVE2r7oFc4Qv9uFbVh7TyzvBbO7umLeSZX4yuowvBqxfusqV7zDb
         14kg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777880453; x=1778485253; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LCkxhAVa2Kz1UkiVBw7mtm2nSh9PR7uQTdGuhJ6wxIw=;
        b=VniDPVhrmSQNP8Y5k6ysXC+9H869N3Vwa1K/o2EMU/Zj2i+9sEV/UhaOooiVssNThg
         AosQ0qH55dxnOdH6sPTF1pWmWWO36n011l6DWI9mmZZFvNBZqRW8uKIsvmaN39wYXSJw
         FiJcndlMIHXxGCRfKSW6GGiWK29pFHN5enYSCuEgZuyWM7EyCvqohFI1yC7LZOXhn0XB
         D7BNADLdlUN6sPnlhNYJWOrykQn9kL+9mCCcjGWLUTNMxbDEqqI/GrSK9AVBUKm01TxS
         76mHklzw9lHqjuKsUnHnhNz5s9hLBR2eGuX+C0mb0VilTqpCVjawq34AF97BHPpJ0Tov
         r2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777880453; x=1778485253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LCkxhAVa2Kz1UkiVBw7mtm2nSh9PR7uQTdGuhJ6wxIw=;
        b=bIE3BVoKCj+a1+58nnnAJD3oyPWwT4yYQjtHDuBxswDMXPK2yJ9u3+YxsDVo5PIFXN
         ICJ5oMvo3qKalhLg6QecdPZZmPXqQRhjWkS0W2SFl+pSLrleOWR4t/QsHlE0VTSPb4kU
         XOmMFTi4OgggwfOgIea409JAwFCB4gOA28jjLLRPCX98eiJx5tqSFzAeEYZ1GYJw6edN
         C6xPWGgEFYfE9jSRTP7gTxAth7nnC0bc0a+TsOmGs6v/FgOj9g63Ume3k6YCy9QoMHGe
         iUF98F2MZRixOph9f++1SL+zIbCBAeGWIsn/4pCc7iL1RIQpbAL0zd8j3jYH668AOwLK
         OH4g==
X-Forwarded-Encrypted: i=1; AFNElJ+ShCg2EZZnTyVmgh4IXTX1M9uDivp9YM0KbQNMfGEQU4UapOoa8N/Vm+OEhls5B0SnqyJ+2U1424HO@vger.kernel.org
X-Gm-Message-State: AOJu0YxfM9okl2Jm4VpnnIlgseTO/1D2BoefXnY7pdXSrgxHQtSqzty9
	nMOVCbuBnnnusqOURK3y9LrznkRkCUd1h+Xm5hCjchql0yZfXXFdCtCdSon+BdgmpAvzcOILQiU
	sVSpX7aB/+78fuIrBDp5Y+H+ZtmIf0eY=
X-Gm-Gg: AeBDiesSbx/cr54ENmdKpc6yRGxuVWhKcGTVUTwQufhqQRsqjJlbT5XYeudM6iKwsnV
	gwuvzu/c/4sob86vhPSNv32gb7oMtaRFO5nCj0kOjyFlD85u9lujez1gLxERKJ7+eNlAwQIUOEt
	7GkoP/v8BjPrOBgz12L4Z8al0pl0wvvwSZCcMeodzVa6MyxWJYSWjRCD+gFJoPNy0vD5Dut5RVu
	tIMYE/qFaksO8nE4yAX/yOVOS+tD3TSg1Ugp8QCNMqyO9Wi9XGbbugW3bmHk4e1RwWKTWNEs81a
	IORZwi89Fu+n7NC6TX0=
X-Received: by 2002:a05:693c:3003:b0:2f0:ee2:f6c6 with SMTP id
 5a478bee46e88-2f00ee2fb33mr2488478eec.19.1777880453124; Mon, 04 May 2026
 00:40:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260503164445.215540-1-clamor95@gmail.com> <20260503164445.215540-6-clamor95@gmail.com>
 <afg-ldFd7hockYn-@kekkonen.localdomain>
In-Reply-To: <afg-ldFd7hockYn-@kekkonen.localdomain>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 4 May 2026 10:40:40 +0300
X-Gm-Features: AVHnY4KoMtn8TXLLhoDJp5ms6MrAvqPdKX7PT1fN5YHojIBWSmaMZ63320KsPn0
Message-ID: <CAPVz0n0w90AuczbhdPrWewpKpJC_iJ5u3LsPug5mVPJ+KDnZRQ@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] media: i2c: lm3560: Add support for PM features
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 5808D4B980F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7976-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FREEMAIL_FROM(0.00)[gmail.com]

=D0=BF=D0=BD, 4 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 09:37=
 Sakari Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On Sun, May 03, 2026 at 07:44:44PM +0300, Svyatoslav Ryhel wrote:
> > Add support for power management features to better control the LM3560
> > within the media framework. To achieve the desired PM support, the HWEN
> > GPIO and VIN power supply were added and configured into power on/off
> > sequences. Added PM operations along with the PM configuration setup.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/media/i2c/lm3560.c | 117 ++++++++++++++++++++++++++++++++++---
> >  1 file changed, 110 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
> > index ce4b09d1f208..15741ea5684f 100644
> > --- a/drivers/media/i2c/lm3560.c
> > +++ b/drivers/media/i2c/lm3560.c
> > @@ -12,13 +12,16 @@
> >  #include <linux/bitmap.h>
> >  #include <linux/delay.h>
> >  #include <linux/module.h>
> > +#include <linux/gpio/consumer.h>
> >  #include <linux/i2c.h>
> >  #include <linux/slab.h>
> >  #include <linux/mod_devicetable.h>
> >  #include <linux/mutex.h>
> >  #include <linux/of.h>
> > +#include <linux/pm_runtime.h>
> >  #include <linux/property.h>
> >  #include <linux/regmap.h>
> > +#include <linux/regulator/consumer.h>
> >  #include <linux/videodev2.h>
> >  #include <media/i2c/lm3560.h>
> >  #include <media/v4l2-ctrls.h>
> > @@ -49,6 +52,8 @@ enum led_enable {
> >   * @dev: pointer to &struct device
> >   * @regmap: reg. map for i2c
> >   * @lock: muxtex for serial access.
> > + * @hwen_gpio: line connected to HWEN pin
> > + * @vin_supply: line connected to IN supply (2.5V - 5.5V)
> >   * @led_mode: V4L2 LED mode
> >   * @ctrls_led: V4L2 controls
> >   * @subdev_led: V4L2 subdev
> > @@ -63,6 +68,9 @@ struct lm3560_flash {
> >       struct regmap *regmap;
> >       struct mutex lock;
> >
> > +     struct gpio_desc *hwen_gpio;
> > +     struct regulator *vin_supply;
> > +
> >       enum v4l2_flash_led_mode led_mode;
> >       struct v4l2_ctrl_handler ctrls_led[LM3560_LED_MAX];
> >       struct v4l2_subdev subdev_led[LM3560_LED_MAX];
> > @@ -177,12 +185,17 @@ static int lm3560_get_ctrl(struct v4l2_ctrl *ctrl=
, enum lm3560_led_id led_no)
> >       struct lm3560_flash *flash =3D to_lm3560_flash(ctrl, led_no);
> >       int rval =3D -EINVAL;
> >
> > +     if (!pm_runtime_get_if_in_use(flash->dev))
> > +             return 0;
> > +
> >       if (ctrl->id =3D=3D V4L2_CID_FLASH_FAULT) {
> >               s32 fault =3D 0;
> >               unsigned int reg_val;
> >               rval =3D regmap_read(flash->regmap, REG_FLAG, &reg_val);
> > -             if (rval < 0)
> > +             if (rval < 0) {
> > +                     pm_runtime_put(flash->dev);
> >                       return rval;
> > +             }
> >               if (reg_val & FAULT_SHORT_CIRCUIT)
> >                       fault |=3D V4L2_FLASH_FAULT_SHORT_CIRCUIT;
> >               if (reg_val & FAULT_OVERTEMP)
> > @@ -192,6 +205,8 @@ static int lm3560_get_ctrl(struct v4l2_ctrl *ctrl, =
enum lm3560_led_id led_no)
> >               ctrl->cur.val =3D fault;
> >       }
> >
> > +     pm_runtime_put(flash->dev);
> > +
> >       return rval;
> >  }
> >
> > @@ -201,6 +216,9 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, =
enum lm3560_led_id led_no)
> >       u8 tout_bits;
> >       int rval =3D -EINVAL;
> >
> > +     if (!pm_runtime_get_if_in_use(flash->dev))
>
> This should be pm_runtime_get_if_active().
>

Noted

> > +             return 0;
> > +
> >       switch (ctrl->id) {
> >       case V4L2_CID_FLASH_LED_MODE:
> >               flash->led_mode =3D ctrl->val;
> > @@ -246,6 +264,8 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, =
enum lm3560_led_id led_no)
> >               break;
> >       }
> >
> > +     pm_runtime_put(flash->dev);
> > +
> >       return rval;
> >  }
> >
> > @@ -409,6 +429,38 @@ static int lm3560_init_device(struct lm3560_flash =
*flash)
> >       return rval;
> >  }
> >
> > +static int __maybe_unused lm3560_power_off(struct device *dev)
> > +{
> > +     struct lm3560_flash *flash =3D dev_get_drvdata(dev);
> > +
> > +     gpiod_set_value_cansleep(flash->hwen_gpio, 0);
> > +     regulator_disable(flash->vin_supply);
> > +
> > +     return 0;
> > +}
> > +
> > +static int __maybe_unused lm3560_power_on(struct device *dev)
> > +{
> > +     struct lm3560_flash *flash =3D dev_get_drvdata(dev);
> > +     int rval;
> > +
> > +     rval =3D regulator_enable(flash->vin_supply);
> > +     if (rval < 0) {
> > +             dev_err(flash->dev, "failed to enable vin power supply\n"=
);
> > +             return rval;
> > +     }
> > +
> > +     gpiod_set_value_cansleep(flash->hwen_gpio, 1);
> > +
> > +     rval =3D lm3560_init_device(flash);
> > +     if (rval < 0) {
> > +             lm3560_power_off(dev);
> > +             return rval;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> >  static void lm3560_subdev_cleanup(struct lm3560_flash *flash)
> >  {
> >       int led_no;
> > @@ -442,6 +494,17 @@ static int lm3560_probe(struct i2c_client *client)
> >
> >       bitmap_zero(flash->led_id, LM3560_LED_MAX);
> >
> > +     flash->hwen_gpio =3D devm_gpiod_get_optional(flash->dev, "enable"=
,
> > +                                                GPIOD_OUT_LOW);
> > +     if (IS_ERR(flash->hwen_gpio))
> > +             return dev_err_probe(flash->dev, PTR_ERR(flash->hwen_gpio=
),
> > +                                  "failed to get hwen gpio\n");
> > +
> > +     flash->vin_supply =3D devm_regulator_get(flash->dev, "vin");
> > +     if (IS_ERR(flash->vin_supply))
> > +             return dev_err_probe(flash->dev, PTR_ERR(flash->vin_suppl=
y),
> > +                                  "failed to get vin-supply\n");
> > +
> >       flash->peak =3D LM3560_PEAK_1600mA;
> >       rval =3D device_property_read_u32(flash->dev,
> >                                       "ti,peak-current-microamp", &peak=
_ua);
> > @@ -469,9 +532,19 @@ static int lm3560_probe(struct i2c_client *client)
> >                                &flash->max_flash_timeout);
> >       flash->max_flash_timeout /=3D 1000;
> >
> > +     rval =3D regulator_enable(flash->vin_supply);
> > +     if (rval < 0)
> > +             return dev_err_probe(flash->dev, rval,
> > +                                  "failed to enable vin power supply\n=
");
> > +
> > +     gpiod_set_value_cansleep(flash->hwen_gpio, 1);
> > +
> >       rval =3D lm3560_init_device(flash);
> >       if (rval < 0)
> > -             return rval;
> > +             goto error_disable;
> > +
> > +     pm_runtime_set_active(flash->dev);
> > +     pm_runtime_enable(flash->dev);
> >
> >       for_each_available_child_of_node(dev_of_node(flash->dev), node) {
> >               u32 reg;
> > @@ -492,10 +565,10 @@ static int lm3560_probe(struct i2c_client *client=
)
> >
> >                       rval =3D lm3560_subdev_init(flash, reg, node);
> >                       if (rval < 0) {
> > -                             lm3560_subdev_cleanup(flash);
> > -                             return dev_err_probe(flash->dev, rval,
> > -                                                 "failed to register l=
ed%d\n",
> > -                                                 reg);
> > +                             dev_err(flash->dev,
> > +                                     "failed to register led%d: %d\n",
> > +                                     reg, rval);
> > +                             goto error_clean;
> >                       }
> >
> >                       set_bit(reg, flash->led_id);
> > @@ -504,7 +577,23 @@ static int lm3560_probe(struct i2c_client *client)
> >
> >       i2c_set_clientdata(client, flash);
> >
> > +     pm_runtime_set_autosuspend_delay(flash->dev, 1000);
> > +     pm_runtime_use_autosuspend(flash->dev);
> > +     pm_runtime_idle(flash->dev);
> > +
> >       return 0;
> > +
> > +error_clean:
> > +     pm_runtime_disable(flash->dev);
> > +     pm_runtime_set_suspended(flash->dev);
> > +
> > +     lm3560_subdev_cleanup(flash);
> > +
> > +error_disable:
> > +     gpiod_set_value_cansleep(flash->hwen_gpio, 0);
> > +     regulator_disable(flash->vin_supply);
> > +
> > +     return rval;
> >  }
> >
> >  static void lm3560_remove(struct i2c_client *client)
> > @@ -512,8 +601,22 @@ static void lm3560_remove(struct i2c_client *clien=
t)
> >       struct lm3560_flash *flash =3D i2c_get_clientdata(client);
> >
> >       lm3560_subdev_cleanup(flash);
> > +
> > +     /*
> > +      * Disable runtime PM. In case runtime PM is disabled in the kern=
el,
> > +      * make sure to turn power off manually.
> > +      */
> > +     pm_runtime_disable(&client->dev);
> > +     if (!pm_runtime_status_suspended(&client->dev)) {
> > +             lm3560_power_off(&client->dev);
> > +             pm_runtime_set_suspended(&client->dev);
> > +     }
> >  }
> >
> > +static const struct dev_pm_ops lm3560_pm_ops =3D {
> > +     SET_RUNTIME_PM_OPS(lm3560_power_off, lm3560_power_on, NULL)
> > +};
> > +
> >  static const struct of_device_id lm3560_of_match[] =3D {
> >       { .compatible =3D "ti,lm3559" },
> >       { .compatible =3D "ti,lm3560" },
> > @@ -532,7 +635,7 @@ MODULE_DEVICE_TABLE(i2c, lm3560_id_table);
> >  static struct i2c_driver lm3560_i2c_driver =3D {
> >       .driver =3D {
> >                  .name =3D LM3560_NAME,
> > -                .pm =3D NULL,
> > +                .pm =3D pm_ptr(&lm3560_pm_ops),
> >                  .of_match_table =3D lm3560_of_match,
> >                  },
> >       .probe =3D lm3560_probe,
>
> --
> Kind regards,
>
> Sakari Ailus

