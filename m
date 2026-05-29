Return-Path: <linux-leds+bounces-8371-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIaMLGlyGWoQwwgAu9opvQ
	(envelope-from <linux-leds+bounces-8371-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 13:03:05 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DD27C6013F7
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 13:03:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9C176300980A
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 11:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5E51261B71;
	Fri, 29 May 2026 11:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ag/qz1V0"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1528932694F
	for <linux-leds@vger.kernel.org>; Fri, 29 May 2026 11:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780052577; cv=pass; b=Wt5i1izhtPKZn3TJeE+Gle1ERI2o0pPc8IGG5oyUUidIUvYRK9HBCQYxlxUS0mWwBIFcMVwTTEiV89efKZ8sMw0RULt2WF2EIYWjwAX6fNl3V2hdtbH+fr6v6ekIXbNx6bP8biYHpY0YfZIRqtMOnWckSpWSNVilDCmfStVbRDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780052577; c=relaxed/simple;
	bh=VX0GZld8TcpuuHGg4c1vdgycUrvDO2NLeGvlFPPDW2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZVlaZSh8d4h/iHveNbjevMT/E76/8TL91jICRDldAMDyuu9zHAb9KM6Vz/qsxvVbMvSjl9exIKj8/RCDZ6DzHQR8FPPHx5FIkK7sakaGXK6io4sLWd3AY1TW01Y7yYhW9jSMOYGZtoFmMyOQOLJN9OfBzZ/sZdKlL7dNUruEAZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ag/qz1V0; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-304c520fe9aso4998669eec.0
        for <linux-leds@vger.kernel.org>; Fri, 29 May 2026 04:02:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780052575; cv=none;
        d=google.com; s=arc-20240605;
        b=bHwPi+TlPxvWL0L34HKdiJ5yXqElbuNl/NsQzYTJreLTIuby0YZXuTF4KmpG2Ci5om
         54mSvebfDetaRj+tBRrE8ng28lMjGn36EY4n4SIUfn66PpYjkyX4SptpTam38xk2jrmB
         nw6B8PaRZSJGAY4Obe5NjMU8+pqk2pAeMC/gLrRCwRNmWDRhQ1hztVUmQjqRrWqQuWG/
         Z8BZxZn7HHRXEvjOm6RxZIICGIf4+Vg7vLtsljQWSOStDIVsppJyNSAG09K1LdMLtZri
         UU1x2W+RtNezS+ieSjBNa9zTKcf537u0r6quzsAIycPwipkflUNMXpaGpa0+MUtwiy8k
         c5tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qf0EPFsEMgv7RinRHJC8+FSrNX+a+vtz20v10EwyVsU=;
        fh=y894SDjJtLVFARrkpUiUdoHATH0Bc0fAEETrVuBP5vo=;
        b=YlfclXDQt7XAU3kQEI3ckYWaSJ0RaxyhiGx61ZyESh2GyGL7afID4zlpCJGyPokKL0
         7UeiRz8/3i9VOB0t+VIwcSlK7e2Vf2o+tay4ZBUO9KIg/YxoCTULWItLOl9xi71Kp4jr
         FIbcq7zulHZxX20PCECPEYN0YmYeGYLcNkSVU9m29BpDCMorWR7M0Z3dwqfEh/8kSpbm
         acblTPep6wmsxwE9Y9qU523e0a4ZJXCm3DLwOPv1m4s171/a4OphAGtYmiObxaZi0JqV
         QpRZGbdu1/7YGPYJyyYMvd+02ynBj98vDHXgUqNjjT4mwEtp202tXaXIB7KQacaRZUQK
         S3IQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780052575; x=1780657375; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qf0EPFsEMgv7RinRHJC8+FSrNX+a+vtz20v10EwyVsU=;
        b=Ag/qz1V0RHuzU2g6cEi1QeCR/yaPQ3rrFe4RWo3BqITNwBLsw52nwXWUEeBJJRA7gV
         oDH9BxJzCce69Dstm/ApyIL9MbV6rlWC5HAiX6YvuMlgVLwPU24thshD4UANWbIBG76T
         kPPZLP+sodhGOMriruD0laaf2jkZCvfmRssSKeQT1gZSKcMrnZ6L0YFIydRlcsRRq3gE
         CZ9QhItOrVlqkXcIGfz+vRVNevtSEE51l3ZvLeLsEMimZ5YgqPqzr3RU0ckX5hzpwrqN
         ADJg7+VEaY1lK1/0lqVKjxJNVGH0dBABGNX41xzhsMVyUyzHeRtozwn53Gc+SL6tob4/
         LPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780052575; x=1780657375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qf0EPFsEMgv7RinRHJC8+FSrNX+a+vtz20v10EwyVsU=;
        b=R+I4VsoVpPxAF00Od7d0X3Jq37cUMKNoTlw1O2j73ukyFaMIXHq5DaXoVMGDfXc5G7
         1quvkXMMJZhcS/P0RENsZvsLnIKajr3YA2OcUa9Cff/KBPDwvMpOf1+f1WMMOHh/cgpL
         HNhBf52RCrSr6mjShQ2fdgNGD3deRDXTwbCuQQjb5U6WOq2Kd9vox+Wc0kAkCBkTVfPV
         dP5Y5nuwrFWCOD1kbYDT2Vq3YUjz/JuJiBiBnjVviGO21/zOQgj4Vv47vceHy715obX8
         /Xpz5Ro3dyUiiOWw2Y0cwM87Chm1nerDhC/GP4c4vtlIiNgYqPs1WGqCkBF8PtCnjyo+
         mMgQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ak5q6YI0ma3O5iLL+GXPYuDz+8tynnuAA4/pHj9Q+kWBeg6Bq4R1+2oGIQrN90LUHizdJHCGSYO4Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9JZkG5xh5GPvKy+FZZaxnr7n5GJ7bM7RMz8zHO3w3y0/jPOmr
	mxNhO9sG/DILbBmMm37DGbtk8gT7M8TK8NKwgIMTsBEdQ9UhXST3RVnSD5SETsymOgHwbUEbGAW
	Ez0sXPi3RHgX0LD4tNEBrnX38eLPK96Y=
X-Gm-Gg: Acq92OFqf6V4yWDVJM3OOfWtPFwPypgVhxG0HSjeqpFLZVolnNAb5NsXgVnDmU0i20w
	9olufMvI2s8WjW0Vw7zXLKejkv/oDoLTCU6IAc/DgT3Y/kG60fIydLKEGRBvshCtZLHHkom/8hv
	fHugE40DhZABqUk5i+96wND7rzfbSdcTnnsuHsZDRwRa+5gf7Egav/bfKvj2/gOpEswTFBtqlyW
	PyRcKcVSGsKGck5GLS2cczIxk3k3zl++TvinUAVnSgGedChXPjtc5h7eq7+QDjX8auDm1x2J00M
	KEoBNuApcQWG5YBjZr4=
X-Received: by 2002:a05:7301:5f89:b0:2f1:6252:f8fe with SMTP id
 5a478bee46e88-304ead9c0a3mr1051392eec.3.1780052575098; Fri, 29 May 2026
 04:02:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528135123.103745-1-clamor95@gmail.com> <20260528135123.103745-3-clamor95@gmail.com>
 <20260528155001.2bcb7003@jic23-huawei> <CAPVz0n0qCekQVGGyAyBuYv+RKC6bpydYBLJNGfPrgTYjtOJOuA@mail.gmail.com>
 <20260529100819.1823ebb3@jic23-huawei> <CAPVz0n0VHdUo5oHdALgcerLsykdz-2n7c+jxYHrMOV7Ra5x_qQ@mail.gmail.com>
 <20260529114828.5a87c732@jic23-huawei>
In-Reply-To: <20260529114828.5a87c732@jic23-huawei>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 29 May 2026 14:02:43 +0300
X-Gm-Features: AVHnY4JFkCjq5u7WpABFbger7MZKVNNC_WAp1_zpv0s6179IZSDqS5525lREGVM
Message-ID: <CAPVz0n1u0z35rP8vUKjAzW_mrPm9yeMjK_-nKbyctUvQik6ECw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] mfd: lm3533: Convert to use OF bindings
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8371-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: DD27C6013F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=D0=BF=D1=82, 29 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 13:4=
8 Jonathan Cameron <jic23@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri, 29 May 2026 12:39:56 +0300
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > =D0=BF=D1=82, 29 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE =
12:08 Jonathan Cameron <jic23@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Thu, 28 May 2026 18:03:31 +0300
> > > Svyatoslav Ryhel <clamor95@gmail.com> wrote:
> > >
> > > > =D1=87=D1=82, 28 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=
=BE 17:50 Jonathan Cameron <jic23@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > >
> > > > > On Thu, 28 May 2026 16:51:19 +0300
> > > > > Svyatoslav Ryhel <clamor95@gmail.com> wrote:
> > > > >
> > > > > > Since there are no users of this driver via platform data, remo=
ve the
> > > > > > platform data support and switch to using Device Tree bindings.
> > > > > > Additionally, optimize functions used only by platform data.
> > > > >
> > > > >
> > > > > At least the IIO ones would have made much the same amount of sen=
se for
> > > > > dt, just that they weren't having in the first place. I'd prefer =
that
> > >
> > > Gah. I write gibberish after too much reviewing.  having/helping!
> > >
> > > > > as a precursor patch to make the rest much more readable.
> > > > >
> > > >
> > > > I can add you preferences into this commit, I don't mind.
> > > >
> > > > > >
> > > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > >
> > > > > I only looked in detail at the iio bit. A few changes requested.
> > > > >
> > > > > > ---
> > > > > >  drivers/iio/light/lm3533-als.c      |  95 ++++------
> > > > > >  drivers/leds/leds-lm3533.c          |  51 ++++--
> > > > > >  drivers/mfd/lm3533-core.c           | 268 ++++++++++----------=
--------
> > > > > >  drivers/video/backlight/lm3533_bl.c |  52 ++++--
> > > > > >  include/linux/mfd/lm3533.h          |  51 +-----
> > > > > >  5 files changed, 212 insertions(+), 305 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/iio/light/lm3533-als.c b/drivers/iio/light=
/lm3533-als.c
> > > > > > index 99f0b903018c..cbd337b73bd9 100644
> > > > > > --- a/drivers/iio/light/lm3533-als.c
> > > > > > +++ b/drivers/iio/light/lm3533-als.c
> > > > >
> > > > > > @@ -714,59 +720,33 @@ static const struct attribute_group lm353=
3_als_attribute_group =3D {
> > > > > >       .attrs =3D lm3533_als_attributes
> > > > > >  };
> > > > > >
> > > > > > -static int lm3533_als_set_input_mode(struct lm3533_als *als, b=
ool pwm_mode)
> > > > > > +static int lm3533_als_setup(struct lm3533_als *als)
> > > > > >  {
> > > > > > -     u8 mask =3D LM3533_ALS_INPUT_MODE_MASK;
> > > > > > -     u8 val;
> > > > > > +     struct device *dev =3D &als->pdev.dev;
> > > > > >       int ret;
> > > > > >
> > > > > > -     if (pwm_mode)
> > > > > > -             val =3D mask;     /* pwm input */
> > > > > > -     else
> > > > > > -             val =3D 0;        /* analog input */
> > > > > > -
> > > > > > -     ret =3D lm3533_update(als->lm3533, LM3533_REG_ALS_CONF, v=
al, mask);
> > > > > > -     if (ret) {
> > > > > > -             dev_err(&als->pdev->dev, "failed to set input mod=
e %d\n",
> > > > > > -                                                             p=
wm_mode);
> > > > > > -             return ret;
> > > > > > -     }
> > > > > > -
> > > > > > -     return 0;
> > > > > > -}
> > > > > > -
> > > > > > -static int lm3533_als_set_resistor(struct lm3533_als *als, u8 =
val)
> > > > > > -{
> > > > > > -     int ret;
> > > > > > -
> > > > > > -     if (val < LM3533_ALS_RESISTOR_MIN || val > LM3533_ALS_RES=
ISTOR_MAX) {
> > > > > > -             dev_err(&als->pdev->dev, "invalid resistor value\=
n");
> > > > > > -             return -EINVAL;
> > > > > > -     }
> > > > > > -
> > > > > > -     ret =3D lm3533_write(als->lm3533, LM3533_REG_ALS_RESISTOR=
_SELECT, val);
> > > > > > -     if (ret) {
> > > > > > -             dev_err(&als->pdev->dev, "failed to set resistor\=
n");
> > > > > > -             return ret;
> > > > > > -     }
> > > > > > +     device_property_read_u32(dev, "ti,resistor-value-ohm",
> > > > > > +                              &als->r_select);
> > > > > Does this have a default?  If so the pattern we've recently be se=
tting on for IIO
> > > > > is
> > > > >         if (device_property_present(dev, "ti,resistor-value-ohm")=
)
> > > > >                 ret =3D device_property_read_u32();
> > > > >                 if (ret) //corrupt property in some fashion
> > > > >                         return ret;
> > > > >         } else {
> > > > >                 //set default
> > > > >         }
> > > > > If there is no default then check it unconditionally.
> > > >
> > > > default value is LM3533_ALS_RESISTOR_MIN and if no property is pres=
ent
> > > > clamp will ensure that als->r_select will be set to
> > > > LM3533_ALS_RESISTOR_MIN
> > >
> > > I don't see that default in the binding doc and relying in the 0 bein=
g clamped
> > > isn't particularly readable - I'd set it explicitly.
> > >
> >
> > Oh, ye, my bad. Schema enforces one of props to be present and if pwn
> > is present then resistor is ignored. What if I move resistor reading,
> > clamping and conversion under !als->pwm_mode check? Then resistor must
> > be present and hence must be checked unconditionally.
>
> Sounds good.
>
> >
> > Additionally, I can comment original lm3533_als_setup with #if 0
> > #endif then git formatting will be much cleaner and easier to review,
> > and once we all come to result I will just remove entire commented
> > block and Lee can pick clean commits.
>
> No don't do that.  If you flatten the two helpers as a precursor patch
> then the changes in here will be easier to review anyway.
>

By "flatten the two helpers" you mean incorporate
lm3533_als_set_input_mode and lm3533_als_set_resistor into
lm3533_als_setup first and then convert it to use DT? I am asking,
just to be sure.

> >
> > >
> > > >
> > > > >
> > > > > >
> > > > > > -     return 0;
> > > > > > -}
> > > > > > +     als->r_select =3D clamp(als->r_select, LM3533_ALS_RESISTO=
R_MIN,
> > > > > > +                           LM3533_ALS_RESISTOR_MAX);
> > > > > > +     als->r_select =3D DIV_ROUND_UP(2 * MICRO, 10 * als->r_sel=
ect);
> > > > > >
> > > > > > -static int lm3533_als_setup(struct lm3533_als *als,
> > > > > > -                         const struct lm3533_als_platform_data=
 *pdata)
> > > > > > -{
> > > > > > -     int ret;
> > > > > > +     als->pwm_mode =3D device_property_read_bool(dev, "ti,pwm-=
mode");
> > > > > >
> > > > > > -     ret =3D lm3533_als_set_input_mode(als, pdata->pwm_mode);
> > > > > > +     ret =3D lm3533_update(lm3533, LM3533_REG_ALS_CONF, als->p=
wm_mode ?
> > > > > > +                         LM3533_ALS_INPUT_MODE_MASK : 0,
> > > > >
> > > > > That's ugly.  Better as
> > > > >
> > > > >         ret =3D lm3533_update(lm3533, LM3533_REG_ALS_CONF,
> > > > >                             als->pwm_mode ? LM3533_ALS_INPUT_MODE=
_MASK : 0,
> > > > >
> > > >
> > > > Yes sure, just followed 80 char limit.
> > > >
> > > > > Though if there wasn't a layer hiding the regmap, it could just h=
ave been
> > > > >
> > > > >         ret =3D regmap_assign_bits(lm3533->regmap, LM3533_REG_ALS=
_CONF,
> > > > >                                  LM3533_ALS_INPUT_MODE_MASK, als-=
>pwm_mode);;
> > > > >
> > > > > which would have been nicer.
> > > > >
> > > > > I'm not particularly keen on the swashing of the helpers being in=
 a patch
> > >
> > > smashing.  (this definitely wasn't my best effort at English!)
> > >
> > > > > that is about switching the binding type as feels largely unrelat=
ed.
> > > > > Should really have been a precursor, easier to review patch.
> > > > >
> > > >
> > > > Removing of lm3533_update layer is not the scope of this patchset.
> > >
> > > Understood.  I'm fine with just the refactor you are doing brought ou=
t as a precursor
> > > patch.
> > >
> >
> > I have looked into removing wrappers too. That seems to be less a
> > hassle that I anticipated, so I will include regmap switch in the v2.
>
> Ah ok. Even better.
>
> >
> > > >
> > > > >
> > > > > > +                         LM3533_ALS_INPUT_MODE_MASK);
> > > > > >       if (ret)
> > > > > > -             return ret;
> > > > > > +             return dev_err_probe(dev, ret, "failed to set inp=
ut mode %d\n",
> > > > > > +                                  als->pwm_mode);
> > > > > >
> > > > > >       /* ALS input is always high impedance in PWM-mode. */
> > > > > > -     if (!pdata->pwm_mode) {
> > > > > > -             ret =3D lm3533_als_set_resistor(als, pdata->r_sel=
ect);
> > > > > > +     if (!als->pwm_mode) {
> > > > > > +             ret =3D lm3533_write(lm3533, LM3533_REG_ALS_RESIS=
TOR_SELECT,
> > > > > > +                                (u8)als->r_select);
> > > > >
> > > > > Same applies here. Mostly an unrelated change as the only thing s=
witching that
> > > > > is related to the patch is one parameter.
> > > > >
> > > >
> > > > Removing of lm3533_write layer is not the scope of this patchset.
> > > >
> > > > > >               if (ret)
> > > > > > -                     return ret;
> > > > > > +                     return dev_err_probe(dev, ret, "failed to=
 set resistor\n");
> > > > > >       }
> > > > > >
> > > > > >       return 0;
> > > > >
> > > > > > @@ -852,25 +825,28 @@ static int lm3533_als_probe(struct platfo=
rm_device *pdev)
> > > > > >       indio_dev->channels =3D lm3533_als_channels;
> > > > > >       indio_dev->num_channels =3D ARRAY_SIZE(lm3533_als_channel=
s);
> > > > > >       indio_dev->name =3D dev_name(&pdev->dev);
> > > > > > -     iio_device_set_parent(indio_dev, pdev->dev.parent);
> > > > >
> > > > > I'm not sure why this was there in the first place.  Hence not su=
re if it
> > > > > is safe to remove.
> > > > >
> > > >
> > > > This is directly related to OF conversion. The iio_device_set_paren=
t
> > > > bound indio_dev to parent, and it causes problems with OF now since
> > > > als output has its own node and binding it to parent if wrong. Same
> > > > story for backlight and leds btw.
> > >
> > > Is there any risk anyone was using the canonical path to get to the i=
io dev?
> > > /sys/bus/platform/devices/..../iio\:deviceX
> > > This is technically an ABI change be it a subtle one.
> > >
> >
> > Linux kernel has no users of this driver, and it is in "stale" state
> > for more then 2 years (maybe even longer). I have cc'd Johan Hovold.
> >
> > https://lore.kernel.org/lkml/ZmBcvtLCzllQDWVX@hovoldconsulting.com/
> >
> > This this 2 y. o. discussion and there were no actions ore movements.
> > I assume this driver in its current form has no more users. This does
> > not mean that it cannot be revived though.
>
> So, just to check, are you a user of this code or is this more trying to
> help out with old code?
>

I am not insane enough to get myself into all this conversion if I did
not need it. This is one of 2 remaining gaps in support of LG
P880/P895 I own and support. I would really like to finally mainline
all the patches I have locally since maintaining them becomes quite
troublesome with time and additional patches layering on top.

> Jonathan
>
> >
> > >
> > > >
> > > > >
> > > > > > diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3=
533.c
> > > > > > index 45795f2a1042..d707d43d5526 100644
> > > > > > --- a/drivers/leds/leds-lm3533.c
> > > > > > +++ b/drivers/leds/leds-lm3533.c
> > > > >
> > > > > >
> > > > > >       led->cb.dev =3D led->cdev.dev;
> > > > > >
> > > > > > -     ret =3D lm3533_led_setup(led, pdata);
> > > > > > +     device_property_read_u32(&pdev->dev, "led-max-microamp",
> > > > > > +                              &led->max_current);
> > > > >
> > > > > I'd prefer explicit setting of the default to be visible before t=
his, or
> > > > > the property_present pattern I mention in the IIO review above.
> > > > >
> > > >
> > > > clamp will ensure that led->max_current will be set to
> > > > LM3533_LED_MAX_CURRENT_MIN regardless if it it present
> > >
> > > As above, I'd prefer it set explicitly.
> > >
> >
> > I understand your position and I am not denying it for ALS part, but
> > LEDs don't belong to IIO subsystem and different subsystem maintainers
> > may have drastically different preferences and requirements (ugh, PTSD
> > in its full glory).
> >
> > > >
> > > > > > +     led->max_current =3D clamp(led->max_current, LM3533_LED_M=
AX_CURRENT_MIN,
> > > > > > +                              LM3533_LED_MAX_CURRENT_MAX);
> > > > >
> > > > > I didn't look any further (busy day!)
> > > >
> > >
>

