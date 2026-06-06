Return-Path: <linux-leds+bounces-8527-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WpPvHeHKI2qSygEAu9opvQ
	(envelope-from <linux-leds+bounces-8527-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 06 Jun 2026 09:23:13 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD7B64CD65
	for <lists+linux-leds@lfdr.de>; Sat, 06 Jun 2026 09:23:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=DHj0iA4M;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8527-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8527-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2AEAC302549C
	for <lists+linux-leds@lfdr.de>; Sat,  6 Jun 2026 07:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846B130D408;
	Sat,  6 Jun 2026 07:22:56 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6992D0C98
	for <linux-leds@vger.kernel.org>; Sat,  6 Jun 2026 07:22:55 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780730576; cv=pass; b=r+lsbtHJsZaC5R436c6jB85siqjAaXHmGvNsbRDhfLp+YyjW4XJagaCy3t/IyCyjQQrTD3lVFqZxBMRUW5cJVg8g0xnQATOq5O39T2Z158SNS0UV6yWlrLgIpgQFZv9apn1cWqmNc7PGicd0TPrvPg/0FXmuqSnhaB+LLmnvDK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780730576; c=relaxed/simple;
	bh=EdOBiUbIj1sa3p5dKmb4uizhrFu5/uX1E3lqCuVG5ss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H0kNoN7o8B7hH/S8HX2yhm30BOcge1xHhsPF+adkJiDT9utggSB2dL7fcHSPUWSwa+DJDpiq4X7GbguidpawnSQwKJt84IeZ+PO4+SYBB/HCvDxyCQcyKCCoOrwtZpHOjWtR69ry+JVFayA/IRhlshdF+kodWv0RX51Mmj6M544=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DHj0iA4M; arc=pass smtp.client-ip=74.125.82.169
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3078e0dcd67so736140eec.0
        for <linux-leds@vger.kernel.org>; Sat, 06 Jun 2026 00:22:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780730574; cv=none;
        d=google.com; s=arc-20240605;
        b=Ki319DLEaqp4isvqJADxnhu6tvlTBibzEbNjw/4r5fr/L3WCIeI4EfnJgGSukqzWuX
         lvy2eGV7TE91f5yOc3f3nW6wZITr5CHYlKQf31LRvKfMtdOW9Mzhr1pwt/AyBL6bd9YU
         T+RaBLUlO2WM2YY0/0ieu/gtcFrIkHEn1j/CKnVAFLfmYpVY+CHdaPC8tEH7OhHggZl9
         Q/FFvifX7ZplJsSGc9oGX//OksCCWXJzXW8A/Z4ZrbUguzZ/nzVbbT8R1xPpcRsQpP1K
         uWAruo4KJplXPC6RIDnU/jzFNm5uY6m4I+HL+1+Z1iRJtizOY/klzCbkYUhR+ty3c4Iw
         8cXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XNsDZHZrfK8USkMmXJwaiXlbXh0rWP0T8pk6zwRtmPo=;
        fh=HuulC5AOEhVMARZe5FjX9nkanH2VYH/awKAkDa1j+pA=;
        b=HUrCJ6pk4GDJryTkiz07L2CepUCRB85y52ykiC57fJzdDsG/KjzC2CWYnF+tYFDCDw
         na+jEzL+isxJ+sk2CNiQ0+NhfUzdSQA8D1GgX0cvS9bhDZbT2xRr+t3YXgDmOBHa+KQx
         sUoSYD4Eh1GPO2U6h+POXj341WB/7GQhCgID00KBrIPGAivUKKv4U8suw3wHV7Td19xF
         AowAXrRv3D32CO7aIACZl+sfYrZobBihzMa1YCZ44Ww+yAPKJus6A+gl0+gcG7q4SVob
         qQTQeATaQkfSqEr/I2byj/UWWbw5uE72EF9HaP/wWOnHPW+zsy6UuvBHoajq2W6B6tNO
         UQEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780730574; x=1781335374; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XNsDZHZrfK8USkMmXJwaiXlbXh0rWP0T8pk6zwRtmPo=;
        b=DHj0iA4M2k7kxU3V8wQh5By6avliWmgAIP8i2RXC38vVXqIbyj6ixd+xPE1hnrbIRx
         xdL0+Db4Z1QKzlEQqn/2H93YR5A/Sdm5v9IUnSgxg9bOQdEX6jTHPFjViVAeFaW6qxVP
         8C881cTVozbthUaZTYYusj4q1m3AYXWKMUqtV+TBx+PtEBsotHOP3lPuXIJyvW3lTc1h
         nMRbWjk3jxsqV4j1dxmW8gOibRJFk44JdHPZ8bfY6FvXCS5mXjXf405MvzNyp/8kAR4Z
         9umR9Z3CLlwDjFQgOFXGD2fgOHxenL/np+vj54ZUAFIC1rkdmiMZHdCYhJ9a8OldM6Rm
         c3yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780730574; x=1781335374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XNsDZHZrfK8USkMmXJwaiXlbXh0rWP0T8pk6zwRtmPo=;
        b=Rw8kNPTorYlFoMLxbi+NbBcfZRnl+OTmXOzR8jppo24ZNOlXMjVF7jgnSC6l/Rewbt
         GY/LPb+/mCnm7tSJ5EGo/QT8Lm3Xbqkam3dogKW7qophSeKRn+/Oc2t6LYchJi7pR3z1
         8OFdFq6nurvHK7ntCYIk67vCX/boeN58UamxWgb3+zw62+JPBrE4WJ6hljh9aCy8na3h
         9DyX07MwvXOPHArx9fTSJKLXCIYUh8cLtjGwd9oQiCBqVxeFKYuKvLoi0+OMezCi4aDZ
         uz4ZBCslN4gzp22Q55mq7EL3HFQN4H+IUL/DLFtTZ8gvjFG07oB6h5Udcj0h+i2kxIiS
         5o1Q==
X-Forwarded-Encrypted: i=1; AFNElJ+W5sIw+7UtxsxkVHB15tXMNUI7EyQorLozGuVUxolA++8YKYgKkXiMRz+2Yc0WzpiHZcJqNnHdRRN3@vger.kernel.org
X-Gm-Message-State: AOJu0YyKfDrFTRPyQNt5Rml/l5dGttcFbqfnmCDNIxYbK+PR7l2SUB29
	gybpjA9U58GMNbOqavZ9MqUi/tmhxCz4AByVqUMd6EvuUzlJtqRB8/cX96Oymp//2XJemuSiPBh
	uFHub/xRWE7FoKhH4ffNcSCbltFd7AWA=
X-Gm-Gg: Acq92OENKUWk2blfbiSJ3UIetHqF3Vk1iFD5excz63YEopONLxRyEejXdNh1S8PiuYf
	ar5GDozUqgxy7LSsb+nGn2b3D1TUjcKHOfw7pfeDVqQ+Gs6BPdWYymRFk3JbTANn4tS1weuIurP
	lwN1rbFOA35pw0OwPYLLy98th9b1ul0lpU6IFIu4iUY1JfozJkEGQyXXADF6wsDF/4243ccteXj
	92Rs8uDAL92T5M3cwtwkgow8KcFxxY1X2oqSDTaaxlJ3UOLvSpM/LsPTVnZNK4H7+jkxvAZ4LYQ
	oml+OU1hQnfX8Aq0RVz3NKL7UNvKzA==
X-Received: by 2002:a05:7300:7488:b0:2cb:4b8f:b2bd with SMTP id
 5a478bee46e88-3077af30ab5mr4444661eec.6.1780730574227; Sat, 06 Jun 2026
 00:22:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260606045738.21050-1-clamor95@gmail.com> <20260606045738.21050-3-clamor95@gmail.com>
 <aiPDzdKuccdLIvlF@ashevche-desk.local>
In-Reply-To: <aiPDzdKuccdLIvlF@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 6 Jun 2026 10:22:43 +0300
X-Gm-Features: AVVi8Ceg74fnSrmdqpxPSKGHcf0CnCmmeoCyMtr9C-KzyjgDa-9lYe4AaFHwWbI
Message-ID: <CAPVz0n2rdgw8Xr3uxVdQGwrHTNFqK4SKQDFU2FEB8LzLwPhQ_A@mail.gmail.com>
Subject: Re: [PATCH v4 02/14] mfd: lm3533: Remove driver specific regmap wrappers
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:johan@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-8527-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DFD7B64CD65

=D1=81=D0=B1, 6 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 09:53=
 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sat, Jun 06, 2026 at 07:57:26AM +0300, Svyatoslav Ryhel wrote:
> > Remove driver-specific regmap wrappers in favor of using regmap helpers
> > directly.
>
> I like the idea of this patch. Nevertheless I have some suggestions below=
.
>
> ...
>
> >  {
> >       struct lm3533_als *als =3D iio_priv(indio_dev);
> >       u8 reg;
> > -     u8 val;
> > +     u32 val;
>
> Strictly speaking this should be unsigned int. The regmap API use unsigne=
d int.
>

Yes, though regmap defines only 8 bit to be used so it should not matter

> ...
>
> >  static int lm3533_als_set_int_mode(struct iio_dev *indio_dev, int enab=
le)
> >  {
> >       struct lm3533_als *als =3D iio_priv(indio_dev);
> > -     u8 mask =3D LM3533_ALS_INT_ENABLE_MASK;
> > -     u8 val;
> >       int ret;
> >
> > -     if (enable)
> > -             val =3D mask;
> > -     else
> > -             val =3D 0;
> > -
> > -     ret =3D lm3533_update(als->lm3533, LM3533_REG_ALS_ZONE_INFO, val,=
 mask);
> > +     ret =3D regmap_assign_bits(als->lm3533->regmap, LM3533_REG_ALS_ZO=
NE_INFO,
> > +                              LM3533_ALS_INT_ENABLE_MASK, enable);
>
> In cases like this perhaps leaving mask would be fine and together with

I prefer to remove intermediate variables it the helper allows to
directly pass needed value.

>
>         struct regmap *map =3D als->lm3533->regmap;
>

next patch drops lm3533 so there will be als->regmap which IMHO is
more logical instead of passing entire lm3533 to child devices.

> this be nice one-liner:
>
>         ret =3D regmap_assign_bits(map, LM3533_REG_ALS_ZONE_INFO, mask, e=
nable);
>
> >       if (ret) {
> >               dev_err(&indio_dev->dev, "failed to set int mode %d\n",
> >                                                               enable);
>
> In many cases it won't increase LoC count.
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
> >  extern int lm3533_ctrlbank_set_pwm(struct lm3533_ctrlbank *cb, u8 val)=
;
> > -extern int lm3533_ctrlbank_get_pwm(struct lm3533_ctrlbank *cb, u8 *val=
);
> > +extern int lm3533_ctrlbank_get_pwm(struct lm3533_ctrlbank *cb, u32 *va=
l);
>
> Now they become asymmetrical. Perhaps to replace setters, but be careful =
about
> upper bits.
>

Yes, I have same thoughts. Upper beats should be irrelevant since
regmap should use only fist 8 bits but I will be careful, thanks.

> --
> With Best Regards,
> Andy Shevchenko
>
>

