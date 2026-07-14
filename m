Return-Path: <linux-leds+bounces-9082-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4+NsIpk7Vmq+1wAAu9opvQ
	(envelope-from <linux-leds+bounces-9082-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 14 Jul 2026 15:37:29 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E387553C5
	for <lists+linux-leds@lfdr.de>; Tue, 14 Jul 2026 15:37:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=adtRORoK;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9082-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-9082-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E98D5307E5C6
	for <lists+linux-leds@lfdr.de>; Tue, 14 Jul 2026 13:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B4F846AF2B;
	Tue, 14 Jul 2026 13:31:22 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E153246AF18
	for <linux-leds@vger.kernel.org>; Tue, 14 Jul 2026 13:31:20 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035882; cv=pass; b=ldCWfkJW62x1Ma0cLIup7BBkELcWuXLmMhDEczZcRkLodVF5gRuVteXoHNfN7SLS9yBjgL7ejqN35LXc4mz1wFpGurMV2K0nQrGrO9fWlk4l+LfRJmI4wZJP5Os1ebowsvHyZmZbppF/8TRgHVTa9YrOGVW0UApbsJwQWnmKdaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035882; c=relaxed/simple;
	bh=6DZv1K0DlUi+ti2Ixfzbo+SkZOzrPzgNcj+8JfhDZTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mwft9WiudHh+nBLEqdI/dJ4dLySqJfYnUV9MnMPLF5XZu+moWy3CRAGvJs5rz+Vc+9ZB5abdN/ERUt6VGVHFqTm2ePQVqGmA1PVp7ZdNHMAEfg3ZBHgHYwch6KYtY5LMazEiTfQGmKGOSmaTnfYOGaQW84PzTFbACAQ10Bo0Loc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=adtRORoK; arc=pass smtp.client-ip=209.85.216.45
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38101f85591so726106a91.1
        for <linux-leds@vger.kernel.org>; Tue, 14 Jul 2026 06:31:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784035880; cv=none;
        d=google.com; s=arc-20260327;
        b=iwTeO31S8nLDrsyhFddc5Fek4L9CawkRylhXPvyz9CKmcfZvmMhMdt6l5pljvJd58Q
         7t7yO+La3m+r2btpP5uAUk/HPM6VN7BET3qO7Pw3mr+vOB6v+OnM0xnJZVyRa0rCIK4Q
         k0ITa3jiW8XBB/SnlyKiHNVcFiLbILb6mqZ409H7tVUeKmkRyxMeUtb1KCoj9PG73vfM
         s12AOegq5rE8Ut/YhnCFytF3JAYk8Yv6vns7yDjMn+fSqbxVFc/y0DiLfysjUyxP3u/S
         1ZGyHgC2fQg+A/t3iWFXDPtq7rYee02wqwOu7hPZ5O0W1WixOxnb13zF9Ly60uygD1C9
         T3CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kLfW8NpBLmGd5rRr/q7P+WdrGpDQQoBNPKO5OnQCHQk=;
        fh=cJgFuuyd3hYjbqrS9vlpBIDxXQnxVQqjznG1+tfzDrM=;
        b=Ti19fQcMnZ/KquustlgluKhJyQMN/JbSGPcT1axV/NQnDWT9tCo+U5OLWimR0M9fhl
         IkWMPqK0E88K2TnLmI5d8CTw0+twnwtttOpd1QezvEK7XmWFdFxJt2fyYI9B/pqRNQWK
         6UBnW5MAeHqGNt9t0KOg6Bdp43ZpcJZGP+qsW7n4JD5guZvC0oZPysEqYG/O9NPNfvZ6
         CJkTlGODFaIWqjGg3TYp4AiOt3MK75j5xwyzV874EDRoy7cthmuwOb8CwoTUifcxI8X+
         pua93q2SyT2LnjitnSi4lbkpHH4lH2vpIMDG5PdRhLXHtpnexusPTu//gxCzxZrOWfNG
         GYeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784035880; x=1784640680; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kLfW8NpBLmGd5rRr/q7P+WdrGpDQQoBNPKO5OnQCHQk=;
        b=adtRORoK6ykURV4MpPqfrnTXyFhgyraH2fPjJ0S7zI+Kwx7knp9zoE890+UYb+j00y
         bFiN9z5SSPD8qzVBXDWlV5SlrMQbkjEPvlDpqIz1kmHac6uHt49DQ93YNWJQfdi5EQHk
         475uVtuqDXE2WWrNE7/ik48QuATe0RyrQUbWMxyxEj9KdpndUMc9EO3fPKh/seREI0ql
         //DrLBaWIMGG0cjP3+D5fNXmM/AIXH05XyLQawLfUa820ELjaK2iJiPlBqzjJ35GHXmI
         D9sKHXvALthnn958hN4yPWlnY+H2pBMvmeGysDo4boFy80Y/Zwozmr8Tvp6DryTrOpwS
         AT/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784035880; x=1784640680;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kLfW8NpBLmGd5rRr/q7P+WdrGpDQQoBNPKO5OnQCHQk=;
        b=HKHO07FnAtcwKa6it0FLID3PSBAQauQwqx59xAjBRTIOydIfqV3oeUHxe2vWlWxOxt
         fcM/HSSR+Y0QVBeKE1Ss/iYtkRwWG4eKkSNAAlsuvCGj4WTQVTaneoSXPuhpCMHlYJ2U
         Ubo6srKtDW/xVZtqazm/tS2WDe8WnXgk6pl6gIG51lqrRrPy7bZ8PgdLzuXO+jVvtqmK
         il/z1WYf3xQBn+XMpvS7N9pGsoXuYV+OpAL//CwAIMBgtRQki1SeCXjkC98DIYH+TPS7
         85ZD8y38TgrQnJl9RIJ00yEn/L/UWp6PDAOJe/ilkHfQ/UpQQ7BMT/RSUaGpmi0W1y8N
         4NIw==
X-Forwarded-Encrypted: i=1; AHgh+RrdMZUmdBKE0LTTrK9//2GW5WW8b0CXKm2RlDdlJqQ1WQVYTRc04CeoTvcZjO64Ns67jLzAzCJqlfte@vger.kernel.org
X-Gm-Message-State: AOJu0YwrhYwLjK4YoTGxlyBPSma0yIu88T25FQ5Kz7supVhYeY9Tay1P
	llUAlOZ63gsFvyJcu/UYYAcfdj0gT+QJAYftmCGKYrOAxqCpx21zeKgtx6bLHeVZlX0zgZsJt2H
	66eFUyhP4oqRlkzvJze77p9r57PbR+2c=
X-Gm-Gg: AfdE7cmFjd+9oLV/DiV9DLLcvAYCLGabMFB9lx72GCB/f0Lj6n4h423L4gXJ+M+mrSP
	fN9YMORTbjUF+uzp+qwqO8WgSI14HizF6ybJPv4JgGfdGNd0QUj335+GWJ/UHwCJWDAW0yRPL3+
	cYD8kib72KM9H9bQMRZ/R0GVmtvISglxgfGhVHRMDmW6QOWHTru/txSdMgukeYO4zsn5IjRPvNO
	UW0fac4LAbE6fwIoY7oE2Dznr3gTvZMnwmjSRlODt7rXBF08f7+dLHPWtYcrShshSXuN8RhrzN4
	9E3JJaeYqBYL8IgF+BU9+iCh//oizxdv1BW5T7EE
X-Received: by 2002:a17:90b:5607:b0:37f:e5b1:ec4b with SMTP id
 98e67ed59e1d1-38d13c60530mr18215292a91.5.1784035880304; Tue, 14 Jul 2026
 06:31:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617080031.99156-1-clamor95@gmail.com> <20260617080031.99156-6-clamor95@gmail.com>
 <akeHC-OA8tqM941f@hovoldconsulting.com>
In-Reply-To: <akeHC-OA8tqM941f@hovoldconsulting.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 14 Jul 2026 16:31:08 +0300
X-Gm-Features: AUfX_mxzYxEuGLMctIZqZIdW8wmxIrFK1WcO0C4FctuVUcu9qYtJIaIs5OSxe4o
Message-ID: <CAPVz0n2DPia=nfvd3W-rHy91OvZNO6jdSczT7kyvH-G138KJyg@mail.gmail.com>
Subject: Re: [PATCH v5 05/14] iio: light: lm3533-als: Remove redundant pdata helpers
To: Johan Hovold <johan@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:johan@kernel.org,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-9082-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1E387553C5

=D0=BF=D1=82, 3 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 12:55 Johan=
 Hovold <johan@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Jun 17, 2026 at 11:00:22AM +0300, Svyatoslav Ryhel wrote:
> > The lm3533_als_set_input_mode() and lm3533_als_set_resistor() functions
> > are used only in lm3533_als_setup(). Incorporate their code into
> > lm3533_als_setup() directly to simplify driver readability.
>
> That's a debatable claim.
>

Adding helpers to wrap custom regmap wrappers seems redundant twice.

> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/iio/light/lm3533-als.c | 56 ++++++++++------------------------
> >  1 file changed, 16 insertions(+), 40 deletions(-)
> >
> > diff --git a/drivers/iio/light/lm3533-als.c b/drivers/iio/light/lm3533-=
als.c
> > index a9af8e2b965f..69bac1b202f1 100644
> > --- a/drivers/iio/light/lm3533-als.c
> > +++ b/drivers/iio/light/lm3533-als.c
>
> > -static int lm3533_als_setup(struct lm3533_als *als,
> > -                         const struct lm3533_als_platform_data *pdata)
> > -{
> > -     int ret;
> > -
> > -     ret =3D lm3533_als_set_input_mode(als, pdata->pwm_mode);
> > +                        pdata->r_select);
> >       if (ret)
> > -             return ret;
> > -
> > -     /* ALS input is always high impedance in PWM-mode. */
> > -     if (!pdata->pwm_mode) {
> > -             ret =3D lm3533_als_set_resistor(als, pdata->r_select);
> > -             if (ret)
> > -                     return ret;
> > -     }
> > +             return dev_err_probe(dev, ret, "failed to set resistor\n"=
);
> >       return 0;
> >  }
>
> There's nothing hard to read about the above. To the contrary the logic
> is more obvious this way.
>
> You also remove the high-impedance comment for no good reason.
>

Removing one level of indentations without obscuring readability is
always a good idea.

> Johan

