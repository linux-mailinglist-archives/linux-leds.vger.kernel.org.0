Return-Path: <linux-leds+bounces-8425-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFHPHUWwHmr7JAAAu9opvQ
	(envelope-from <linux-leds+bounces-8425-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 02 Jun 2026 12:28:21 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCB762C8B8
	for <lists+linux-leds@lfdr.de>; Tue, 02 Jun 2026 12:28:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F048A305CBF8
	for <lists+linux-leds@lfdr.de>; Tue,  2 Jun 2026 10:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4200D3D669F;
	Tue,  2 Jun 2026 10:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AyUwTwsC"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D608F3D6CB8
	for <linux-leds@vger.kernel.org>; Tue,  2 Jun 2026 10:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780395554; cv=pass; b=NkGl5IRJHfVY3N2D4wt9W7e2jawQrAGP9LVfU1s/gbL/u4Pu9QzweueCgQVntgOu2dw23VBSj9Rj6yYl0nlCPcYiljO/8uNIe7gYn7CKqMfO4dENpEmKxDyxz4xlmoCA2O7UjwtOqlzeUtU6oJiu+xdUBJSYyHtJtbgbdh22fng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780395554; c=relaxed/simple;
	bh=3B3t6ptcOYLW8i15s/yZOStzPGXLE8YErZRu0mWiPrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nIY6bPJlITMrxPoHBGStj3k0pInbEopzTF/G61dA0VRIQOcVJG7NG2UB5Hiwe2JOe5OxHCjN9W61t1vPrgrZakQ49C7ZnmSGvBhsn+pcxF6/a3PbUjLTm8qd+vWExRJKi7qr+/oEfPr4sR0sm3yUOtfVD3jQlyPslaseEXMlZ3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AyUwTwsC; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-137f27712fdso20023c88.0
        for <linux-leds@vger.kernel.org>; Tue, 02 Jun 2026 03:19:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780395552; cv=none;
        d=google.com; s=arc-20240605;
        b=L9M35mYGp/xt9ijeNDI0wOGjFzRLMGNT0nbgrDB9tcmmsrfp7M6Aqrm43AFjS08aGQ
         R1bNH3wzLHPJYhgXOa5yacuUHuccv6BU8AAGgNetOm2kgH7cNXJyxsrqXL9hL8P7FJt3
         7+eOfP3cFvTPTqNpGV0dnEWLkf301hJWhIxunniizh0+tEQE5v9UsMMwwEa4QlOdxaJj
         gX1aHU6rxmiKFujpE3oGEkTpgE5Ghet47miKBEMcskGe4jcbevi3rlVgT5M7ALXwDK+1
         UcpPk4exMTRn9gWPXgRV1GYWvRJCUoPZAVekzqZZoh4u9WENizqhCQdv0c8yn1bRgpPS
         GrZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+Rz2DgaRr0tqOwLOIkcbJ3/5tQrroNwxRI/2HG/tAbU=;
        fh=J9ZRcJm9b9xZRnTsOD6z/1/rG7NKGo6hoBEvDnmcHT0=;
        b=V9fcwjJNXLuS0MeIluovA0eRh+ddPVKUBGhN0lTgfJ4KpfKnUyLvwxCUuYltuM42Cq
         cTENMpxtvW+b6v8mK8kOIBZDfV3RIoB0a2y2Y/upoT+/pJIqXHMlWDzvCDOIDo2dOQYg
         eqWypfl34JbABOHNZQOWuiSZlIXDrj/qDwSGYqfrRAZUyy8CBkmYFMORyoxh9HpC718F
         v1ccq/a7Csh9x8XsO6/bouq56CPQSjhfVdt95jWzIhgf/wpQP9BpqXxTdbYwEq1oqyuu
         033++47rB+3CBL5pohf96YA8Jzra/DTVPrKcwgXfFcpKDkr8HeM8IyV9tsA8Dwf6vNlR
         gt3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780395552; x=1781000352; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Rz2DgaRr0tqOwLOIkcbJ3/5tQrroNwxRI/2HG/tAbU=;
        b=AyUwTwsCHthjP6xub1kYtxw/LI3RE35opRdOgCOuDfMit/QnFgIeUTShTZZIpe7lBF
         qRQWCXiVBDsalYrzAVptKLel2m0TfNtWh7rlB/0YfAa0JxZpFTBMXmCqjgmyp6XYUC2h
         QjJ6fthhtIhDtpCkrreEsYzND+1a/XPf++2mHd6EuNSDjeEjI7/TXRDIJKyO1emHRWQd
         zZIsyiRQ76oy+WEZjmkjDAgD1tRWUqjXZbd+Fs1Ujp7llqA6OFqX3OzWrDW1ZFoisIF0
         yd6l2WV2jaXKT5SEz13bXNf+ZxlWNte7M/NODRmIIqX/pt8TiBLOFbw5Wg3xJht71mBr
         S/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780395552; x=1781000352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+Rz2DgaRr0tqOwLOIkcbJ3/5tQrroNwxRI/2HG/tAbU=;
        b=WrtaQuicRLQHJxSSYiDqQMr5ktpnjCBsITyuSK7yEj0FSTaNKrPopXYHkL1OIbV7fa
         tT1OBcU1yQfB/oonWcywqRrCWOqJVpYL2ypXVowH8MZuUyMXJ1y+e73e2gn8YejNvZY9
         83br1pogxQFf4Gan5tUi3XQcXEeGcAK/KspnakkNeK3oYC0nvvmkwB4iZg0NbbL1p5rv
         O67ueC7pzQxprqGkLf+jZfhSxfWfTAg7GWXPA/ICHa6mhkr5Bbm7eUhb1mGu5cJVuY1h
         d6WbJCl/WSjlVbmU/90oP8VXfQmLnuI9xp0bzOXae2twFnJQk12ze+fKeBhzA+t+QcDM
         2N6Q==
X-Forwarded-Encrypted: i=1; AFNElJ/wSd1OoDWp00oZIVdvjy0r3cmHI5GW4IuHFtpFVnHVDwOiIHlqQhcjqddfwGyT+e7k/MRhCyo0F+kH@vger.kernel.org
X-Gm-Message-State: AOJu0YzBGv/INxIVTFi8JS+7scCKgGPvj54h0zk+DDPvR5pd64rHH1on
	jJYE/08dUvgcSZVaa3ADEW5WfVTFCnBa7u4hgU9hzsr2Wc/zATyjIMtSvHrKfSm2QQnePQFolwX
	FtzXj7FlTRHLyxKV+MWdmzSkalQfgTUU=
X-Gm-Gg: Acq92OE0jWJ9X2rGLo70Cx4AqI7XYCgefFuluacGG8NOIKpu2jHgMKvdQoif0hY1gbI
	yZb2cCLdvKHgyzwwYexJILjE6ealBs9ih/cZTc7b7565d30yX9qtSJPiVQm0XjEZZ8R8KL+9RlT
	B/5LTmXIJm0ZdUhEQQ/g0QvnWISZRwNmqPk73STAgO33QfxEp6a6JWV4bmmapLXNLNaKicFG2YA
	Kx9AaJjkb7K4ntO6ckKdxoStdIIGas7zJE83tz5oDWTUaWi7gQeLUgET3nZnqWq3+soDQWto1UB
	u5VlPLcPaySeo7fx1hA=
X-Received: by 2002:a05:7300:6427:b0:2df:919f:ce59 with SMTP id
 5a478bee46e88-304fa67ee46mr6895369eec.19.1780395552116; Tue, 02 Jun 2026
 03:19:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601151831.76350-1-clamor95@gmail.com> <20260601151831.76350-9-clamor95@gmail.com>
 <ah6PxFtoJUWkd79P@ashevche-desk.local>
In-Reply-To: <ah6PxFtoJUWkd79P@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 2 Jun 2026 13:19:00 +0300
X-Gm-Features: AVHnY4KArfWMr0jnHoh9vtR5UqW4K7jQ3330Z8FTAYXvtwkDG99A7ncLjymdKC8
Message-ID: <CAPVz0n0P7Jk17cM2M1zuHZfySo2=Uibr5izwKU2tqiBpBcg0FQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/11] video: backlight: lm3533_bl: Improve linear
 sysfs logic
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
X-Rspamd-Queue-Id: 1CCB762C8B8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8425-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

=D0=B2=D1=82, 2 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 11:09=
 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, Jun 01, 2026 at 06:18:28PM +0300, Svyatoslav Ryhel wrote:
> > Simplify the sysfs logic of the linear property by switching to a macro
> > and a ternary operator.
>
> ...
>
> >       if (kstrtoul(buf, 0, &linear))
> >               return -EINVAL;
>
> Besides _assign_bits() in the below, side note here to unshadow error cod=
es:
>
>         ret =3D kstrtoul(buf, 0, &linear);
>         if (ret)
>                 return ret;
>
> (obviously in a separate change).

Won't happen in this patches.

>
> ...
>
> >       ret =3D regmap_update_bits(bl->lm3533->regmap, LM3533_REG_CTRLBAN=
K_AB_BCONF,
> > -                              mask, val);
> > +                              CTRLBANK_AB_BCONF_MODE(id),
> > +                              linear ? CTRLBANK_AB_BCONF_MODE(id) : 0)=
;
> >       if (ret)
> >               return ret;
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

