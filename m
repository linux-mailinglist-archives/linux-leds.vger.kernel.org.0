Return-Path: <linux-leds+bounces-8442-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G1z4Fn7sHmqoZAAAu9opvQ
	(envelope-from <linux-leds+bounces-8442-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 02 Jun 2026 16:45:18 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDF262F695
	for <lists+linux-leds@lfdr.de>; Tue, 02 Jun 2026 16:45:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=kvS7iLe1;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8442-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8442-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47B693298FA3
	for <lists+linux-leds@lfdr.de>; Tue,  2 Jun 2026 14:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5102D3F39C9;
	Tue,  2 Jun 2026 14:29:10 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153D23F39D7
	for <linux-leds@vger.kernel.org>; Tue,  2 Jun 2026 14:29:06 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780410550; cv=pass; b=i4sWTUmvrILkitcYFefOuGxZQMBAcIQ2lcU2X9CbOEyYkU46J3XsQAr64S2fPcSpaepj3VBxrAwbWDqUy6Ruwj3n0AGWG70qjWFBaZOqC+mZIIRBf7bnxv1IClGRRvIb0o8OUzQ+tEFRBnxjjcYTr5OadhXGsnAMSZ6yv73diBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780410550; c=relaxed/simple;
	bh=pCKVJKfsgqUTs8AS/FfeirHvz2C/Fw3t9KjvROqrw3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cl8aoBUVEZ/HC1tXGTPV+qNux/Yg/P1S1zs8ev74X1I+d4sCmiKJXRWooADdxdoggxUddmmuynaKO16USwlulV2nhAjTy/ca74Xkh3pFZzMS0HxTsYiYmglWMQeBVmQ47Mwv+BthGqol5VEGeC74MuANqyu+1r9MYzNiiN/8Hfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kvS7iLe1; arc=pass smtp.client-ip=74.125.82.180
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-304f0039c02so8049955eec.1
        for <linux-leds@vger.kernel.org>; Tue, 02 Jun 2026 07:29:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780410546; cv=none;
        d=google.com; s=arc-20240605;
        b=f1TqJLztaXiTT7IDroAVhZXlp+9+QO961m4aD6AiIGpgBCQa8y/0I4tpLsSkOLFEoo
         wCsrrI3hSwnlBA6cJ7BN+9VyqNAc8NoFA8QsT9wqISJXjoiEwPm9Gob+jAiBDQwQzPSH
         twLvk5hkr4eLmj+zkevWC2UhSAiSR9e0Ehq5hGnvKkO1L8GxrF7V4JZtwAsk41u7OHJZ
         r1FD6KjBgPruAxxVe27wZogju1B7xpmI6WqA1dX66Y5Nmo1Lmd/2+osS/CG6cG+4T0cd
         LRxeqaFY4054FlFwHGjUfSHasO0bdHVMJUDyXmSj8BANJf0g/6orTkVtchiJxl8zuvj9
         0S2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kpwFh2a0/oyZBOiJkQQQ7Xbyt/Uy5rqSD9KPnvxrM2g=;
        fh=hccI0ed0VpZPmISbcf/s+ffZzacPqScbI2wqacz+yPU=;
        b=LPMjMu4lqo8H/wiWo27PO8BReSYTqVpKPZmsQbKE8JAeMiXVpl2TRDUqGJtxu+tfbP
         lMYmTqhcd7fgFOqB99IE1VCQh1XimQuPcb9CJFNhA+Jadacy4zcnsffV3FE8A1mzdlYV
         k+5ii+mIrLPNpJQiE4JerQZPLzmhVccyMsINTUk6JmdDzAXrHkxgkukaiN7Oi+uiV0Yc
         Nu7OS+tpSrRWNqddbwAOxe5IhQP3EqnMejGBjvI0j8AWU+qHngo+QKZLve9jN2rE4cP8
         4T6aESC9n6LmDFszmcsc0AEbH7VzugDeuEOzg1pycYkKFHCxXHD5P4qAODlMpZmtar2y
         vJJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780410546; x=1781015346; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kpwFh2a0/oyZBOiJkQQQ7Xbyt/Uy5rqSD9KPnvxrM2g=;
        b=kvS7iLe1ZbSh+crMCh2b6P4PeWiWpsgx0lXJ9O43NgaWrWKS6fDA2DCuzIp87sEdW9
         CPHvFZsR0HDubiu7jNp7l2eOf4yqTd80E2s9MBLklSajPIgseA4uRDM5DIhSCk4U+Yav
         Z/6RHb4UTq+/+fFpQSngOnNm/KywstoAyqIVxFd5HWgQDPhiDtN8RjFLup7+aQpgJ7Re
         9KYHzA3N0FbXVVZjZM6bqmpGKkTacMIIKPAyUQpEVOSZvKgDdq4/YCdjx9RA2hBL+x5b
         5WRIS8cU39OXH5JdzZWu52J9GE57edeqvNEwrL/IxXyywahr/nk2D4LVNRfCTgTxlhxU
         R7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780410546; x=1781015346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kpwFh2a0/oyZBOiJkQQQ7Xbyt/Uy5rqSD9KPnvxrM2g=;
        b=N+6m5AhV4jvTjYpIRpORP5tuLjcLLtP0z1vAE/Sq2Yujjggm6JNzMsP+pbHcMiuKNA
         GrF4QVhgZjIIlUWoCExk2MKWCGtVYOuchBbJ7CDT59AJ2bufTiIgaEdEkY/Cd0Owp9cL
         h3Rmf9cnVCY7KB3uGhNaqHhtsY1LMi9GENKYZdC3bWskz0uMAmPop+LpRGBuwED/2cau
         N0OTr3G5rfUxZvjJPwZyGsDgqTf/QYIQzO164FvcWc2dQFgdH+M/wakTUEQ7sOyh0C41
         3BxPUkFGkvTAyafGo6W7DzBt9Gjk+J0JD+MR7tDzL8p75e4nlGk9y1d4iTBjFl/uRuIC
         Djuw==
X-Forwarded-Encrypted: i=1; AFNElJ8SYL6rM9FcPGstEALukegyN0DczYaTv16U00Bhu19SfAqmFG3fvTvvtrbfdtv/ctLwL3SPG/7TZQg8@vger.kernel.org
X-Gm-Message-State: AOJu0YwI0P1hVnZFr1VUpl3dfD0A0nu5k07mtvDAHsJVydxcSx4Z76tg
	AusphJvGvLDa88+prABgbCC3pNn5kKQuFYPzoYbE2Zk7L6WaN3FdXTLQHnd5TH+8zHcsIcVMfkf
	Lrr4sHLqtJOrDcx35SkUjEcC28iBpvbA=
X-Gm-Gg: Acq92OH2V7Mw3P0u1v7jjswjnAGwzfH8FND+kzNY9IB0MMi8h3ASbn/0N4swKZTHu6/
	sTE0IMH9bZ9OCCsBZRK3fijsDzCpSp6hi5Xl1K0Qh2pO1shvS8lHM2CsgHZ8jFj++S/Kvh1PrrC
	fLVgt3WtREnZOr+Mxo53KWDqToSMjAIilfIiMFJdXguRuSiLnnfpTTMPpNvTOtXcrxMIBk5VO9x
	9dje4VhqrMplwhdl8lwazwCan3+Ksmp3eeS/LoEKAwMlljUhrNk0jwRulYrSnvFRWuMUVUIm1LU
	v7zxOiz8O20DU0EH6IY=
X-Received: by 2002:a05:7301:1f0d:b0:304:e20e:f5c9 with SMTP id
 5a478bee46e88-304fa6ab9d9mr8316247eec.31.1780410546079; Tue, 02 Jun 2026
 07:29:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601151831.76350-1-clamor95@gmail.com> <20260601151831.76350-6-clamor95@gmail.com>
 <20260602144640.433b4d35@jic23-huawei> <CAPVz0n1r97d8-uzhPGBx0LFSp75A3_2mMXDQQ30utT-6NtpHNA@mail.gmail.com>
 <20260602152019.078cc40e@jic23-huawei>
In-Reply-To: <20260602152019.078cc40e@jic23-huawei>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 2 Jun 2026 17:28:54 +0300
X-Gm-Features: AVHnY4IAAmHJnZ7jdhhpGUMZSGLBbZqFDtuCT4UKpkopc5zewTxJykItA13TvMY
Message-ID: <CAPVz0n0D+97TqZD+003z40vGK_gtnNv5v8iGyc8NYekLdHg58A@mail.gmail.com>
Subject: Re: [PATCH v3 05/11] mfd: lm3533: Convert to use OF bindings
To: Jonathan Cameron <jic23@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, Johan Hovold <johan@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:jic23@kernel.org,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:johan@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-8442-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ACDF262F695

=D0=B2=D1=82, 2 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 17:20=
 Jonathan Cameron <jic23@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, 2 Jun 2026 16:50:16 +0300
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > =D0=B2=D1=82, 2 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 1=
6:46 Jonathan Cameron <jic23@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Mon,  1 Jun 2026 18:18:25 +0300
> > > Svyatoslav Ryhel <clamor95@gmail.com> wrote:
> > >
> > > > Since there are no users of this driver via platform data, remove t=
he
> > > > platform data support and switch to using Device Tree bindings.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > >
> > >
> > > > index 52136ca1abc9..55b35467a722 100644
> > > > --- a/drivers/iio/light/lm3533-als.c
> > > > +++ b/drivers/iio/light/lm3533-als.c
> > > > @@ -16,16 +16,19 @@
> > > >  #include <linux/module.h>
> > > >  #include <linux/mutex.h>
> > > >  #include <linux/mfd/core.h>
> > > > +#include <linux/mod_devicetable.h>
> > > >  #include <linux/platform_device.h>
> > > > +#include <linux/property.h>
> > > >  #include <linux/regmap.h>
> > > >  #include <linux/slab.h>
> > > >  #include <linux/uaccess.h>
> > > > +#include <linux/units.h>
> > > >
> > > >  #include <linux/mfd/lm3533.h>
> > > >
> > > >
> > > > -#define LM3533_ALS_RESISTOR_MIN                      1
> > > > -#define LM3533_ALS_RESISTOR_MAX                      127
> > > > +#define LM3533_ALS_RESISTOR_MIN                      1575
> > > > +#define LM3533_ALS_RESISTOR_MAX                      200000
> > > >  #define LM3533_ALS_CHANNEL_CURRENT_MAX               2
> > > >  #define LM3533_ALS_THRESH_MAX                        3
> > > >  #define LM3533_ALS_ZONE_MAX                  4
> > > > @@ -57,6 +60,9 @@ struct lm3533_als {
> > > >
> > > >       atomic_t zone;
> > > >       struct mutex thresh_mutex;
> > > > +
> > > > +     bool pwm_mode;
> > > > +     u32 r_select;
> > > >  };
> > > >
> > > >
> > > > @@ -411,7 +417,7 @@ static ssize_t show_thresh_either_en(struct dev=
ice *dev,
> > > >       int enable;
> > > >       int ret;
> > > >
> > > > -     if (als->irq) {
> > > > +     if (als->irq > 0) {
> > > >               ret =3D lm3533_als_get_int_mode(indio_dev, &enable);
> > > >               if (ret)
> > > >                       return ret;
> > > > @@ -716,30 +722,34 @@ static const struct attribute_group lm3533_al=
s_attribute_group =3D {
> > > >       .attrs =3D lm3533_als_attributes
> > > >  };
> > > >
> > > > -static int lm3533_als_setup(struct lm3533_als *als,
> > > > -                         const struct lm3533_als_platform_data *pd=
ata)
> > > > +static int lm3533_als_setup(struct lm3533_als *als)
> > > >  {
> > > >       struct device *dev =3D &als->pdev->dev;
> > > >       int ret;
> > > >
> > > > +     als->pwm_mode =3D device_property_read_bool(dev, "ti,pwm-mode=
");
> > > > +
> > > >       ret =3D regmap_update_bits(als->lm3533->regmap, LM3533_REG_AL=
S_CONF,
> > > >                                LM3533_ALS_INPUT_MODE_MASK,
> > > > -                              pdata->pwm_mode ? LM3533_ALS_INPUT_M=
ODE_MASK : 0);
> > > > +                              als->pwm_mode ? LM3533_ALS_INPUT_MOD=
E_MASK : 0);
> > > >       if (ret)
> > > >               return dev_err_probe(dev, ret, "failed to set input m=
ode %d\n",
> > > > -                                  pdata->pwm_mode);
> > > > -
> > > > +                                  als->pwm_mode);
> > > >
> > > >       /* ALS input is always high impedance in PWM-mode. */
> > > > -     if (!pdata->pwm_mode) {
> > > > -             if (pdata->r_select < LM3533_ALS_RESISTOR_MIN ||
> > > > -                 pdata->r_select > LM3533_ALS_RESISTOR_MAX) {
> > > > -                     dev_err(&als->pdev->dev, "invalid resistor va=
lue\n");
> > > > -                     return -EINVAL;
> > > > -             }
> > > > +     if (!als->pwm_mode) {
> > > > +             ret =3D device_property_read_u32(dev, "ti,resistor-va=
lue-ohms",
> > > > +                                            &als->r_select);
> > > > +             if (ret)
> > > > +                     return dev_err_probe(dev, ret,
> > > > +                                          "failed to ger resistor =
value\n");
> > > > +
> > > > +             als->r_select =3D clamp(als->r_select, LM3533_ALS_RES=
ISTOR_MIN,
> > > > +                                   LM3533_ALS_RESISTOR_MAX);
> > >
> > > If we are getting garbage from DT I think I'd rather error out that p=
aper over
> > > that problem.  So similar to before, check valid value and if not fai=
l probe
> > > so that hopefully someone goes and fixes it!
> > >
> >
> > sure
> >
> > > > +             als->r_select =3D DIV_ROUND_UP(2 * MICRO, 10 * als->r=
_select);
> > > Why do we need this when we didn't before?  The range checks are the =
same
> > > so it smells like it shouldn't need transforming. I'd also rather we =
didn't do
> > > rewriting of the meaning of r_select like this.  Just use a local var=
iable for
> > > the intermediate result.
> > >
> >
> > before pdata passed resistor value as actual register value, not we
> > are getting the actual resistance in ohms from the tree and must
> > convert it into register value.
>
> ah. I missed the change of values.  Can you make them explicitly now _OHM=
S or something
> along those lines rather than reusing the macro name for a different thin=
g.
>

Acknowledged.

> >
> > > >
> > > >               ret =3D regmap_write(als->lm3533->regmap, LM3533_REG_=
ALS_RESISTOR_SELECT,
> > > > -                                pdata->r_select);
> > > > +                                als->r_select);
> > > >               if (ret)
> > > >                       return dev_err_probe(dev, ret, "failed to set=
 resistor\n");
>

