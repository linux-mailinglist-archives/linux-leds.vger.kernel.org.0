Return-Path: <linux-leds+bounces-8573-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xIVzGTqrKmrYugMAu9opvQ
	(envelope-from <linux-leds+bounces-8573-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jun 2026 14:34:02 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6062671E22
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jun 2026 14:34:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=oDu0fAqG;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8573-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8573-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5B42830022C4
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jun 2026 12:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1ED23F6C2E;
	Thu, 11 Jun 2026 12:33:58 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDCD3EEAC0
	for <linux-leds@vger.kernel.org>; Thu, 11 Jun 2026 12:33:57 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781181238; cv=pass; b=hkfCaystqcdDyKYfQPup/hFt+UxCgPgH95JAIoyoF8O9mikLRw0tdxlDo+VPe5twRRd8wktYnLR7An+aOuDaZfs3WvPlFzCl1mZfQ4wzYPQ8hQ4qlKfg2kHUkOSRCoq6fNA3knYAALu//eL8spCb0u9lOzbFsUdOou9JJRyvkt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781181238; c=relaxed/simple;
	bh=L22iIiqclocvOudTWkPISdls3zO04nkf5zEFM94Gfhk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gPdXLit3Z8RcXNBY+wKxmHeV4L2Bob6MR7z0DpN98JmIaDy9379J6uS2L2NDMBlRId/Ng6avEjsQ3sDBQsIN1WbGjv8k6NszUYWUQOGB0jtZmPddv2Jy4hDcHsFrCEcHgPVdCo0crpq/e13uzUxLtvMNhQ9CI9TMsrwDVmQY5HE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oDu0fAqG; arc=pass smtp.client-ip=74.125.82.48
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-13809ed8fbeso3052175c88.0
        for <linux-leds@vger.kernel.org>; Thu, 11 Jun 2026 05:33:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781181237; cv=none;
        d=google.com; s=arc-20240605;
        b=DyDv7fyHIiJkeOgeueJWp+ZrOb9+5aXxqoxz8e0dW4ho0TDjkv6it5K68eEEqqmTMk
         ae4PASGxdMuNZzILeUPEj4ogaj1GQCuG+5rTVyvQcQ+ErYTpSQGdeMVXb2cgj1hLbPo0
         0K38g77ptJIXojGmLZivOlJeYk3woDEjhykq91TLzxdmZG+EOTK3FHjqLQQP8Rq5WHyq
         KxiM0269AOK15+qYFqJtSBbLnSR+nFcXiCx8hyxPFfxslGo7tpt4lEn3Q3P5h+z9gisB
         /3cQhlWoa5/oinB7JOzFhhl96eHPRPDH/8urpNv2xcqgC6YkdMfZu6jXZvuMaZsBkvYH
         ePdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ofA25PebqL4AsSYn/VWzRODqpKmh1tVfH1mE+QYxUbM=;
        fh=M3yKiyMnxNnEt0bLe48Mo75UKYqYng34mGcmiY0ZzXI=;
        b=KJjdMI2JaXF6ecxc6eQ+tvOOjQntwiIgY1/4xTxEjmbKWJFWBUCwOpCtC/0x3J+csP
         34YUd0l3hIhFI/oBA+eEaifKWtaVE4+3w9YLT3/efvmYn9PwNXyvJW6wJWVc+2N6cKKY
         gREZXSW7BOiYTm25BIQnnqFLLRpAr5PjsTjwJe3pRnP0hRYreWKT/zM3r/kxKA3PA+d0
         ey09FHmpxXcoOwbDFx9d62ew0T4It4MMh0IJemc99aBLUhNv5bmlGqtued6HUxY2YHtK
         jQ8xxHJaM01cviNfKsWEnXLX0vciEWYF4xA+VQSQtlRBaBIuRqeHM3Y+E7gmpq5z6vlV
         6Cdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781181237; x=1781786037; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ofA25PebqL4AsSYn/VWzRODqpKmh1tVfH1mE+QYxUbM=;
        b=oDu0fAqGLc15HSViIqhHK3eGlstvY2ZUf7YvgQkx7b/q6iRWhSuUKkQCbTtle2QEZi
         PXF8UWXM1NossznlpNcC818lenPYJ/hop38uSGIfgqwgaz2nVZV4S/9MSY0bJjZDIfAx
         tqh9VLntTjcB/P3hgofxBOU1pTZxzmKlmPO8FTy6hu5Ag5QjfvN4gvMgwMR4Y+hxQgR3
         I15fpSg1BXU23WScjg3GstcfCVDmQDhTuR58SAuKtbgpwXx8hq2sA8IUaMHZcxL/d7Ul
         xUqYDvf6oRzMk6+F6MXcV10HGBz/0XmAYOLULZoC9i9Klcu6iQqBv+38kw5sx1bDT0FT
         0LLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781181237; x=1781786037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ofA25PebqL4AsSYn/VWzRODqpKmh1tVfH1mE+QYxUbM=;
        b=VqBfh8SIol6PxHV0gdP+3JERj7E+oDczVzQpw55JigGOx9sSHOzlHqFHLubFcoR84y
         q18VW5bWVx57e/Aj4FrO9cq33C4BuAAmlqq2Kjy1tJVUdrR8J5DrmYOL5212i6e7qXQV
         x+xOR+UDPXVGR/XpGslgebwgKymw9nMSahowlZ0V3OQBgzf1p+LDSM/w0fXCDL347jT5
         8zfrhgsRoGwW+MDmHg80TaXwA2Nt7ikTTVrDL64eczbZT7PUAMe2b+EcfH2uIzirXV7H
         T3oTEECxYEJvIRTaJKuEGaxiCGPO6HrzsM/K3h8NhthYz936wlIwkLzVUxBNEW/lGvQ4
         Vr2w==
X-Forwarded-Encrypted: i=1; AFNElJ93CM3rXJVlq5qoZOuE3ZOkXodXs7k76Ii9UVoknbaTWEVBImLC67bZczXtSRwn0B/bvpein1nBwQQ2@vger.kernel.org
X-Gm-Message-State: AOJu0YxI7Yk+SwDa7k1vNzd7sY1VcyEcYo6FUU2/vUSMxIwED5jhHXkR
	B7PYf+ds3SQU6SQjh+tjtJ/O6/xOP298bHUCob7CRSl7UVpuXQ80hAIjT3ML0rovYwZct1aIzKo
	KnKMus6+fuMoTm0nTdu1kqs43NRKkyBw=
X-Gm-Gg: Acq92OFrquhRfK05DqliLKyfHLKcfbv4C2cibDdxFSk+WDwTdzxrsCArCGfZGbzxYBF
	HT7YLKX0tbAo9DWIMQ+S53z4Ah07dxT62kWSuqdtQmoM9A62xtgpfftC/WqVmYXlK5AYhoD/vfl
	9dQ+dM+2XnwyTHrzYDtQKulNfd4FDxOqCPADm2vYXQHyqOQ92Oc78KzrPnZFL/yAlfkcsqWrTU9
	uO5760uYi6tW8t/ygtk9MONQKxosrAv1bTxZffI+jiWpGqxUCBrnU4tFqlDqZDT3LATuU0vT9aD
	WT6dpp+TnqkuX9nFLDI=
X-Received: by 2002:a05:7300:6da6:b0:2d1:d434:cfe3 with SMTP id
 5a478bee46e88-3080411cef8mr2308986eec.0.1781181236808; Thu, 11 Jun 2026
 05:33:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260606045738.21050-1-clamor95@gmail.com> <20260606045738.21050-15-clamor95@gmail.com>
 <aihoH9Pmzufa9pnE@ashevche-desk.local> <CAPVz0n0m+i7wexfC0BWwvdOuJxDk_=x+EpxEbNmoHN1AsEmfNg@mail.gmail.com>
 <aimy3BxBaXQ3Uigd@ashevche-desk.local>
In-Reply-To: <aimy3BxBaXQ3Uigd@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 11 Jun 2026 15:33:42 +0300
X-Gm-Features: AVVi8CeX4OO_pI5sFq7qWhCQuBWbqnNi5DWXxYDyaE3k8yybACe4K7ODLE9J31I
Message-ID: <CAPVz0n0bpo6PAfdN+LGEgPYhEx8mqtu_SL=WnDxhWn-Cq4rQKA@mail.gmail.com>
Subject: Re: [PATCH v4 14/14] video: leds: backlight: lm3533: Support getting
 LED sources from DT
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8573-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:johan@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E6062671E22

=D1=81=D1=80, 10 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 21:5=
4 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Jun 10, 2026 at 05:45:28PM +0300, Svyatoslav Ryhel wrote:
> > =D0=B2=D1=82, 9 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 2=
2:23 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5=
:
> > > On Sat, Jun 06, 2026 at 07:57:38AM +0300, Svyatoslav Ryhel wrote:
> > > > Add Control Bank to HVLED/LVLED muxing support based on the led-sou=
rces
> > > > defined in the device tree.
>
> ...
>
> > > > +     int ret, i;
> > >
> > > No need to add 'i'.
> >
> > This is personal preference as well. There is no strict rule that
> > iteration variable must be defined strictly in the for loop.
>
> This is a preference by Linus who is the leader of the project.
> Also in IIO we have some set of maintainer preferences.
>

Well, this is not meant for IIO, though it seems that Lee is also in
favor if this approach.

> > > > +             for (i =3D 0; i < led->num_leds; i++) {
> > >
> > >                 for (unsigned int i =3D 0; i < led->num_leds; i++) {
> > >
> > > > +                     if (led->leds[i] >=3D LM3533_LVCTRLBANK_MAX)
> > > > +                             continue;
> > > > +
> > > > +                     output_cfg_shift =3D led->leds[i] * 2;
> > > > +                     output_cfg_val |=3D led->id << output_cfg_shi=
ft;
> > > > +                     output_cfg_mask |=3D OUTPUT_LVLED_MASK << out=
put_cfg_shift;
> > > > +             }
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

