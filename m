Return-Path: <linux-leds+bounces-8424-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLvlOZyyHmr7JAAAu9opvQ
	(envelope-from <linux-leds+bounces-8424-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 02 Jun 2026 12:38:20 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E1962CB91
	for <lists+linux-leds@lfdr.de>; Tue, 02 Jun 2026 12:38:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4D63F3056DEE
	for <lists+linux-leds@lfdr.de>; Tue,  2 Jun 2026 10:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 968AA3D5C07;
	Tue,  2 Jun 2026 10:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LylQJDHM"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410BE3D170B
	for <linux-leds@vger.kernel.org>; Tue,  2 Jun 2026 10:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780395514; cv=pass; b=unCaZ8px3fJAtfqRdn64uwr7mCHjqDNNEyqIi5uRRR1QH6JpkPLCw0QMVYDJ0weLkAIbuIbiPejswPkV4YKD9sZ7cGJ0gP2FrISwFxDvB1xj9Clgece5cH6pakp6lDvbLS8SKtu8tH9Lpi0tqmFYgMoCwDqY+Dl7W0Qf5XLZMg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780395514; c=relaxed/simple;
	bh=tsb+ShdNHjPhqRT+1y1ob/npW7bqLOA6CccHz+MAA/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T+qvpnqwlfoxk/S4c9SgVuyqGPJ6J6xKd7/j2QmIUERmvi0mP1DdImESdRJhvoFttPtkv9Afn7Q0UeuvdA0EXrfkfctgHykS+3DeyTUc/u3xAYRYjcNNSSoguz38g8cFeeUbQ9lOO7HK8633Ck0YglPap1RjbTMlqorFKLwmT50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LylQJDHM; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-304e58292d3so392098eec.0
        for <linux-leds@vger.kernel.org>; Tue, 02 Jun 2026 03:18:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780395512; cv=none;
        d=google.com; s=arc-20240605;
        b=K1gKt/atbSf2UM0xVJ0OO8gXlegwgclC0VLPfJef7vE26OR4djY/F6z1vd+sI7qxGA
         24YlXgPzg8TkcmYeGrafCS1yRY/McTqjR9Sl9K/p9ORtFi1G1kO9pA9Yey3+n2rddvgJ
         uwuB1PYWQjFFNKXXlCSYH3+mTnr3G0CTbHnFS1+QZNln43WNi9RGd+UsD3CId+a0rh4G
         k2a74EF/FMAPiWi9H9AvQE104iMCpqyr9w9X9x8SPVAq4QHN9JNRqttjkZftI9hAcg3g
         1cqoxNNFpRDHt/oF/qZ2KcR13hHeFIXhLyus3SLYQQlZfQ0jAE34sITEWI7mKYnUyGmu
         8rsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OFZUuzZ+0IS+9EDZyoznNJZXjuYIGtdVqC67r/Z0ScE=;
        fh=Hp4E6FGyKEyOI+NIQe7AViAe6x+ROQoqz8lH5WorBWI=;
        b=GghqZzZtcSJlKQNeWYKW3uFhGvStsinvMA6HUwmhuW8vH9F4xyYyC2qmVVkXQpasT9
         Yb2Pye8ObI1cdu6K+K+8UvA5/9YhGp5GCOL3zexLSilo+AL3O8zJDwxnjIg8E4fkq1Ok
         yhUo5vxiTfuUDG2r49YsdmQta3MyiZrguFB0WT+MGEweAKD/JF2Je+99sPIQgmiZdEv3
         u9XTQnALrXRGyIxwOIP0v/2NFhGMzdnD7XWzB089AUUyWL4a2nrkw/+gKTjbL4129a4B
         NHZXJwNLuZt8blAdrbxzlHZ9bjFvOShJNOjJrdkrPT9yba+admMBJ4zddZ62MBUBo5Fg
         b8Mg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780395512; x=1781000312; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFZUuzZ+0IS+9EDZyoznNJZXjuYIGtdVqC67r/Z0ScE=;
        b=LylQJDHM7J3/c/sYuUUvJyKb0EF1e5Rl9EUfysxJVUAuGxlqlY7a+pI9K6pjiG4X6J
         q/3cWwz79o2Qxuir0eyyzKacKHOnNhh4k6bNnUrL1XZFRqgVAPYcuWDH9vw7Z2ZYFUms
         v62n8tEG782bboDoZdrAnJKQweTrNEgVMUyF7yo4ZQWk5Z3gtVUnFqYXQM+6bxci/yNw
         1riH9bioEJi/Vj3THhDWpzOkP06fmWgFm1tP6hV4hF/V2CDUofxrvycCfEX8sEZ05dBh
         zVHBYXWqsq7+r7CIW+5ZehlYiO+OLcqmHBWMKTKzB6NB8L5c5E1i3MzFm2ZSQLOSnMWa
         iwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780395512; x=1781000312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OFZUuzZ+0IS+9EDZyoznNJZXjuYIGtdVqC67r/Z0ScE=;
        b=kz6Fs1aZ0sRErjlaGGukf6Velts8aMNoFONqFTQRJgEguBGemQcsH+TvJ2XYLYu8Iv
         UBgh7jp9Ew4d0SPu+Zg3x2BIzXjdhPNSgnHRASPSKInT4vR8Wf+CHMx6zdGgxGRRQHHh
         k/6DJHcXHbSwPytI0bk1SUDiT1V2uES378Opg2Ulct23fmWotbl4C/ZVQuK6N9mtlKjT
         0CE1mMN8rwoEXjMGc09R1JDrdl+ZQo9dDesK4/awfmdVwqUTiJe90fk1bL2+784f3Eul
         B41+SQLUJ18MOZYM+vxfbLj0YpXpYsqwuN7Bvkh9ingptSWD9+fvI79eBPlgOhRNLToX
         IkXw==
X-Forwarded-Encrypted: i=1; AFNElJ/S5bzRgqe91tkM8LRf7mSQbkMn4wH2RAz89neOLALyuStEppzp4x51xyyp1m+mIXUz2+YMHHZUNZ0D@vger.kernel.org
X-Gm-Message-State: AOJu0YzWdqXqqbWSjnK0rwiLH/fUJWWl6ZAaLTSwNXlIfX3aQqdnuP2A
	SjEwPmXufLR1b0E+7/jtuwhaE/XvTXc+2CbStWS9zVYyzj0dzpw+CmgdU1A2Z+02n/l1Vm6TBzp
	bdVU1gJKb1oguRP6FFmW8e59mT+rAF5k=
X-Gm-Gg: Acq92OE0Wr/DuWFeGpKrrt2r7BucWBM3AU2eDBRRGs9gbtDwtgXeiTuSZKtl3sMKMNu
	9JdlHrzNn2+epOR+tMffPM+fwfQX6BcTKAeVpUePK+CDziEQs5abNYbYgRy9SnJFUJjSWQHjkGa
	CmUkWPkZ36JmoAuhQnqGzOrSJEVcmqTLd/vgzsOOUtkCYVOVJU8fqRlNmKot4Xn9DSz96YrAGXK
	6WqKEg0swL8vrVhfHYLhhI7V2MpEtkUUh5j2rZhMWdRCSs+GYJQvGARlp/2GHBzGAhmLoXFZmrJ
	4Ap0rcd04YKrqNE4izhsKDpj4pKgwQ==
X-Received: by 2002:a05:7300:5726:b0:2e2:3381:2fba with SMTP id
 5a478bee46e88-304fa523d3amr7629148eec.3.1780395512175; Tue, 02 Jun 2026
 03:18:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601151831.76350-1-clamor95@gmail.com> <20260601151831.76350-3-clamor95@gmail.com>
 <ah6O1h8SPwjf3rV1@ashevche-desk.local>
In-Reply-To: <ah6O1h8SPwjf3rV1@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 2 Jun 2026 13:18:20 +0300
X-Gm-Features: AVHnY4JHC1yQblwim_AIT-fQGP6xAd5YIyw3Q9PUntQ6X-j1sNWq1k3TeFJP-_c
Message-ID: <CAPVz0n2vRFMKagLP+Ssq7n0ECp4_4mT6k7Bo9z=rxrSNCfCRKg@mail.gmail.com>
Subject: Re: [PATCH v3 02/11] mfd: lm3533: Remove driver specific regmap wrappers
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, Johan Hovold <johan@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: E8E1962CB91
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8424-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,intel.com:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

=D0=B2=D1=82, 2 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 11:05=
 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, Jun 01, 2026 at 06:18:22PM +0300, Svyatoslav Ryhel wrote:
> > Remove driver-specific regmap wrappers in favor of using regmap helpers
> > directly. The wrappers are mostly equivalent to the standard helpers, w=
ith
> > two exceptions: regmap_read requires an unsigned int pointer, and
> > regmap_update_bits has the mask and value arguments swapped. These
> > differences were accounted for and adjusted accordingly.
>
> We refer to functions as func(), exempli gratia, regmap_read().
>

Noted.

> ...
>
> > static int lm3533_als_get_current(struct iio_dev *indio_dev, unsigned c=
hannel,
> >                                                               int *val)
> >  {
> >       u8 zone;
> > -     u8 target;
> > +     u32 target;
> >       int ret;
>
> While at it, move towards reversed xmas tree order
>
>         u32 target;
>         u8 zone;
>         int ret;
>

Noted.

>
> ...
>
> > -     ret =3D lm3533_update(als->lm3533, LM3533_REG_ALS_ZONE_INFO, val,=
 mask);
> > +     ret =3D regmap_update_bits(als->lm3533->regmap, LM3533_REG_ALS_ZO=
NE_INFO,
> > +                              val, mask);
>
> It's better to replace this to use _set_bits()/_clear_bits() or even move=
 from
> the above conditional (not in this context) to _assign_bits().
>

I will take a look.

> ...
>
> >       else
> >               val =3D 0;        /* analog input */
> >
> > -     ret =3D lm3533_update(als->lm3533, LM3533_REG_ALS_CONF, val, mask=
);
> > +     ret =3D regmap_update_bits(als->lm3533->regmap, LM3533_REG_ALS_CO=
NF,
> > +                              mask, val);
>
> Ditto.
>
> >       if (ret) {
> >               dev_err(&als->pdev->dev, "failed to set input mode %d\n",
> >                                                               pwm_mode)=
;
>
> ...
>
> >       /* Make sure interrupts are disabled. */
> > -     ret =3D lm3533_update(als->lm3533, LM3533_REG_ALS_ZONE_INFO, 0, m=
ask);
> > +     ret =3D regmap_update_bits(als->lm3533->regmap, LM3533_REG_ALS_ZO=
NE_INFO,
> > +                              mask, 0);
>
> _clear_bits().
>
> >       if (ret) {
> >               dev_err(&als->pdev->dev, "failed to disable interrupts\n"=
);
> >               return ret;
>
> ...
>
> >       u8 mask =3D LM3533_ALS_ENABLE_MASK;
> >       int ret;
> >
> > -     ret =3D lm3533_update(als->lm3533, LM3533_REG_ALS_CONF, mask, mas=
k);
> > +     ret =3D regmap_update_bits(als->lm3533->regmap, LM3533_REG_ALS_CO=
NF,
> > +                              mask, mask);
>
> _set_bits()
>
> >       if (ret)
> >               dev_err(&als->pdev->dev, "failed to enable ALS\n");
> >
>
> ...
>
> >       u8 mask =3D LM3533_ALS_ENABLE_MASK;
> >       int ret;
> >
> > -     ret =3D lm3533_update(als->lm3533, LM3533_REG_ALS_CONF, 0, mask);
> > +     ret =3D regmap_update_bits(als->lm3533->regmap, LM3533_REG_ALS_CO=
NF,
> > +                              mask, 0);
>
> _clear_bits()
>
> >       if (ret)
> >               dev_err(&als->pdev->dev, "failed to disable ALS\n");
>
> ...
>
> >       else
> >               val =3D 0;
> >
> > -     ret =3D lm3533_update(led->lm3533, LM3533_REG_PATTERN_ENABLE, val=
, mask);
> > +     ret =3D regmap_update_bits(led->lm3533->regmap,
> > +                              LM3533_REG_PATTERN_ENABLE, mask, val);
>
> _assign_bits() and so on...
>
> >       if (ret) {
> >               dev_err(led->cdev.dev, "failed to enable pattern %d (%d)\=
n",
> >                                                       pattern, enable);
>
> ...
>
> >  extern int lm3533_ctrlbank_set_brightness(struct lm3533_ctrlbank *cb, =
u8 val);
> > -extern int lm3533_ctrlbank_get_brightness(struct lm3533_ctrlbank *cb, =
u8 *val);
> > +extern int lm3533_ctrlbank_get_brightness(struct lm3533_ctrlbank *cb, =
u32 *val);
>
> We don't need to keep 'extern' for ages.
>

I will no inflate this patchset further

> >  extern int lm3533_ctrlbank_set_max_current(struct lm3533_ctrlbank *cb,
> >                                                               u16 imax)=
;
> >  extern int lm3533_ctrlbank_set_pwm(struct lm3533_ctrlbank *cb, u8 val)=
;
> > -extern int lm3533_ctrlbank_get_pwm(struct lm3533_ctrlbank *cb, u8 *val=
);
> > -
> > -extern int lm3533_read(struct lm3533 *lm3533, u8 reg, u8 *val);
> > -extern int lm3533_write(struct lm3533 *lm3533, u8 reg, u8 val);
> > -extern int lm3533_update(struct lm3533 *lm3533, u8 reg, u8 val, u8 mas=
k);
> > +extern int lm3533_ctrlbank_get_pwm(struct lm3533_ctrlbank *cb, u32 *va=
l);
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

