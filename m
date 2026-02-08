Return-Path: <linux-leds+bounces-6892-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KL41IHWiiGn+swQAu9opvQ
	(envelope-from <linux-leds+bounces-6892-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 08 Feb 2026 15:49:25 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDB0108F9C
	for <lists+linux-leds@lfdr.de>; Sun, 08 Feb 2026 15:49:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7E2043009997
	for <lists+linux-leds@lfdr.de>; Sun,  8 Feb 2026 14:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E14C730BF58;
	Sun,  8 Feb 2026 14:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+hiCOLF"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B621C6B4
	for <linux-leds@vger.kernel.org>; Sun,  8 Feb 2026 14:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770562162; cv=pass; b=GDfONHq7zqmbO7/sg/OpeOKPfeWeWI/QHY1YtaLYOPcbVryGhtAinJ19Of835js33FAgQwhYcL6AaHnA1ypmoJoF1A/OvswFTm5/sKh2xAdzcDPxEj0jLj0ccfBA+2d4CJG9718kx/5nqSSasCi2JKW/YcLVdQXPa14OOoJtJXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770562162; c=relaxed/simple;
	bh=FmHJHscw4UGRqf6tadsbey53/7alBZ0goPH23uKBsZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qYNyKUWE1JXkZfdToyhkgGtrEREDTIWs9j2sJTyWUz9vt3ssP7G0vTi857+2i/6TKk9JHs8j1AVuyfzUUZ+KnUWARgApCYjbryzfaB4+tNXE3CbWHOlK91y+OFGfBH109S4s8QhdWseqELN6mIkm0gDSsEg6FmQJB6VDhd5I4sg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+hiCOLF; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b86ed375d37so429167866b.3
        for <linux-leds@vger.kernel.org>; Sun, 08 Feb 2026 06:49:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770562161; cv=none;
        d=google.com; s=arc-20240605;
        b=Rjd2Rs8+MRaOe2JDjsKe4osUmcOGySjnufvsk3bfu2ZBAn99McLKOAGndoA5yG5VvN
         vU15so8rOamwJ5fFTVWnffRRu1+9JHFJmvUBOJLXwEmyZ7Z2Vfz8bTp4jcF86qO+Xw27
         MCCjJxoCf2vFa8+7ZVdPoadxiLXGiEfSihl7oaXsNkX+AeGvGwydllHp3JDZp/rVeD5b
         8tlnGVCkxiQbCeiEHoNXIdnH7xEAGbXDm6DvtLlQAKyzyWWZAbYt/WIHW3Gaw+nxTGhf
         R30z8RZtkFcFY5aM5U6+0AdovbGrN2Zy/n7zK/ykZVixRAHBhagfniLgA9Co20htkLLw
         HJzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7QS0VkNqOpSXotrnDMRD5sTIzzQObxdRFOn5/qTfAgQ=;
        fh=4xuikt2jA1QQO/i5TyA4rM7pm3Hg5XSNdM6SUKxlSGc=;
        b=I9QAZdjFSifMOXsrLSgf/RBCtEDw4jRV/CKKtB41CFOAt3nF+Wv8eH0To7Lu7TjiJ2
         7rxQR6EJJOAR8ADvcgm+SoiHJEbIWxptK9qJj6A3VeHa1hP9CUXremw/xFTeLFxOAlpn
         ci7EFGN4qo1wf+L+WTg1VC30DITWdv2errd+QaCaWu+O/t2+ZqWZ1pR/4hbmUVgXg2KP
         7ehQA6qDPjzrWuXZBsdsq6D9Ry1RHdKkC80R7savSwbSBx4haEy9h0iNUyrtpKBQKdGQ
         F/azm/QXQr4Oc9sWGjtRtJ+GofUpwCy8X0rvszhoCYykF/Zy4dY6TTYTNS0K1WNx5i8q
         n5qA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770562161; x=1771166961; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QS0VkNqOpSXotrnDMRD5sTIzzQObxdRFOn5/qTfAgQ=;
        b=T+hiCOLFdGVaRU4AS5E60jFWT27jFP/yUq2q3RU/DhEQvXsB1HWbwojWFVn0RONcCp
         NwbnVVVBX6OIIFMZqcOsEw3co9xxpT90WlSLJyxJ3NGMOVB62Enn5j6zCGRusNX412ak
         qABLXe/BFjyrEkc5xm+/zRs8iYkDtx0zzIn/uQwTafbKKEPjfBc4pBHir3EcnyOoQtfB
         mAGmM7X2Uu1yChZkbh8shRxdHkyTzaHe/Z0mWcByCsUY9zTu/SSlPy7RRvApo7i9wzmD
         YqCJaBuJU5kWkPUvv0kUbFIbwU9PenncD04ST7UxABy6dhVB4eaHP83SSZPR1Nic1S7m
         hdLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770562161; x=1771166961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7QS0VkNqOpSXotrnDMRD5sTIzzQObxdRFOn5/qTfAgQ=;
        b=AgEvqoKTRjOBpGtoVVHOnJ2T7Dz8u8F5Xgo+ZlhSe0QRgd5DjamUQHTiC7r5UPN1p/
         +KPLihpR0tpOocTCfLA4pSs/eJ3kaOUNhLHe8nnnASL3WOQCH7op9NkCxF3HnP3CiAb7
         wIhDk065rZ0oA6tdvDypJY3ALmwyYSn8K4z5TDZifRt9k+IPG95V7choTgFddJz2orqX
         WRz6zZecQhAEKveiLOMRkKglywahaI+CLRKgMC8zu2nOUUjmetTAQQPCXYAH7syl+PZ5
         vRam9mvRqiqy8/0wrZmroEY8pWsdn7sWgKCUJkwWkHiWW/6naqZyaPqFaJp/ziBPSD7U
         DLgg==
X-Forwarded-Encrypted: i=1; AJvYcCVzbBfjjN5xxZ/6feA/Fh/DVjMI/95ZvRn11fK1ydpPBPfG/22Rz6f1JayYAKipBhR4e3xQUQIjMLlq@vger.kernel.org
X-Gm-Message-State: AOJu0YyFPHk2XQE39OjIpkr4Vr0oxMcccYV9Zne3My3uH7eZ9VoNaRoa
	uyrLcUTQ2ue2E+tWIcFLZ7Cc5n5WLXfc8OFJ6Tt7/crVrpwbloen/LaIQWhWE8GH0XBRnSc99hj
	s15szWdVKQFwo/qrAZEasHvSpjmaRpSU=
X-Gm-Gg: AZuq6aKf4sKBZARlh2meBDCWxOYM/eYHggjoiHl2DUxhPw6/+Ith2QPs3WhSxdv45yH
	o7HLkIpKspRbxHQ6c6ujBMJhb91ImJyGswWC3RMLFUe32oPpa+/YtSB+UCQHscRI+6tRgvSkXku
	B8VDmzdXIWG/JyPHS/pXWUlXO8WtPbvhh0QjUCqIxrO5mv5YiHjgHv2ee7LCS5CIjRO3WpsXUyu
	s6sopqACu8YmGg4FYQRpi7cytEfPMWAik/NtUPdAzc+r8VsJI9QdMGcYeQBCs2lNVhoDAzswNRJ
	THlmXlR5oShY0EDurT0Xh+4y1BuK15ioDKTiEI5JOeMt76LnlvvouC4j/KgaXxD+VC1+xHs=
X-Received: by 2002:a17:907:9413:b0:b7a:2ba7:197e with SMTP id
 a640c23a62f3a-b8edf25c528mr436693266b.29.1770562160683; Sun, 08 Feb 2026
 06:49:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260206172845.145407-1-clamor95@gmail.com> <20260206172845.145407-12-clamor95@gmail.com>
 <aYiH8iwetvRfWxGI@smile.fi.intel.com> <39B7F089-5B4A-47F7-B2EA-A526B290FA77@gmail.com>
In-Reply-To: <39B7F089-5B4A-47F7-B2EA-A526B290FA77@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 8 Feb 2026 16:48:43 +0200
X-Gm-Features: AZwV_QinSJks_QhB591HGO3jm53Tp3IPIh1wwVGFN0DYduqCRz4P0_2il4ahi50
Message-ID: <CAHp75VdatO1c5DvFghpSOLvr9PomrT3=tEADHJ7U8Xf2tgN2ag@mail.gmail.com>
Subject: Re: [PATCH v2 11/11] mfd: motorola-cpcap: add support for Mot CPCAP composition
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Dixit Parmar <dixitparmar19@gmail.com>, Tony Lindgren <tony@atomide.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6892-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[intel.com,kernel.org,baylibre.com,analog.com,gmail.com,atomide.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: AEDB0108F9C
X-Rspamd-Action: no action

On Sun, Feb 8, 2026 at 4:41=E2=80=AFPM Svyatoslav Ryhel <clamor95@gmail.com=
> wrote:
> 8 =D0=BB=D1=8E=D1=82=D0=BE=D0=B3=D0=BE 2026=E2=80=AF=D1=80. 14:56:18 GMT+=
02:00, Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=
=B5:
> >On Fri, Feb 06, 2026 at 07:28:45PM +0200, Svyatoslav Ryhel wrote:

...

> >>      { .name =3D "cpcap", },
> >>      { .name =3D "6556002", },
> >>      { .name =3D "mapphone-cpcap", },
> >> +    { .name =3D "mot-cpcap", },
> >
> >Drop inner trailing comma.
> >
>
> That would be a stray change, wouldn't it?

Have you read below?

> >>      {},
> >
> >Drop a comma at the terminator.
> >
>
> That would be a stray change as well, wouldn't it?

Have you read below?

> >>  };
> >>  MODULE_DEVICE_TABLE(spi, cpcap_spi_ids);
> >
> >This can be done in the patch that adds driver data.

^^^

> Then lets move there.

Exactly!

--=20
With Best Regards,
Andy Shevchenko

