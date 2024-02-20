Return-Path: <linux-leds+bounces-867-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3102485B1F1
	for <lists+linux-leds@lfdr.de>; Tue, 20 Feb 2024 05:35:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CB91283F34
	for <lists+linux-leds@lfdr.de>; Tue, 20 Feb 2024 04:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8CB82030B;
	Tue, 20 Feb 2024 04:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PmblhLDp"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55CD23C6
	for <linux-leds@vger.kernel.org>; Tue, 20 Feb 2024 04:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708403713; cv=none; b=dR1XEPaLGogf1Vm/6NtCEsaXS0xT+PGNXSSyzkMmNaSGyI6wadxHYuQjyNHjMi5lTT9+2zSWTZ4478iFS/cD02FL2lYrxY+LXD57reez0NrzJXJLppcQFcr2zo+rAYg1GQ5e4erh3YPcFOzeg5C9BwonPdGNV+KKD+7rvMBJbJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708403713; c=relaxed/simple;
	bh=K/YeU9M90aSb7Nx389wWU8KvQcsMt1FNwLBpELg9Q/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BTQPgf/PZbhZd2rk7fEhtKLcY5ZkvE8T61j+yVk7dzn79Y3ZUpkkf95F7Jute1ukOKYZp9bLDfxo0o+4AUn0+Fjw6gf7Gjkmyv5cg5aR/2/yADaRRollDmUTQ3NDCtCWhncE3d3XF92I3puRTAzgsmI8R+SPLGhEJ3JQGu8++Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PmblhLDp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708403710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=epxkk3LK7jaEzZwfS8fvOU6Oo1fiHyu0s9CUPbIExc0=;
	b=PmblhLDppfZR9WgNYn9PWGfFTBgdjGw3/uCZj9U/e+nK/tjUUSh909sUkRjp/wBEV9/tlk
	o4S+QtHKUEd3F75FHmZBEgT8IMpvqDTAG/Cj0S0elpihtyWahc9GpxayO8FbdFC8PWrlHX
	4r036wlJLppMyNOekwiHy/gZE9HS4sY=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-DBN3_a4JO5qAsMK4sPe2yw-1; Mon, 19 Feb 2024 23:35:08 -0500
X-MC-Unique: DBN3_a4JO5qAsMK4sPe2yw-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-299d784224eso413932a91.3
        for <linux-leds@vger.kernel.org>; Mon, 19 Feb 2024 20:35:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708403707; x=1709008507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=epxkk3LK7jaEzZwfS8fvOU6Oo1fiHyu0s9CUPbIExc0=;
        b=vLKxPa4eMqlkpIQkaB3TgasAJRYu4qxf3CzjE+PWv7Tk/vL9wRmQc6dYFHBMoXKhrk
         iiT46WCCFP03HFwj3h881ubg0d8GweOVSloEgLwvIHZPekFIGjtX8ksVTIzPG8SNdSBF
         wCm63fd989P4QD11PtJvNO/LfYgT/sEU7aREGAKnEXP6YE2ixQjHK0JMKBqkzChGgjFv
         UvGPPBBeVRKPudVcaSOCBBpP/p0DENyxoO6klA/bVnW4LLn0zPh3+Wz+Sfo14NzajxNn
         tWlt0a/yeWNBWnwwp5nrgULBkity8HLws05Lb3Pk6NWDGFvZGO8kockov1XsqAGsl1kW
         M3sw==
X-Forwarded-Encrypted: i=1; AJvYcCVBZAFsRYtf8gVeEbZR0qaM26uX5KjWzJkUCGZhD2qM3J8EExGPg7ZirIzhDZIXKxGXtiZVFZU79AVhaPxpXv5QY3YuR+jCVbvOZA==
X-Gm-Message-State: AOJu0Yw/LiHYNvGA7LIc/EbDziYEGjEuer8ksazIDjxItqkZVGdzPo5V
	Tsc2pgYEYnSE9RA3PUuITvkM179l7uwnxn5vlPOBjeYvrT/oFZcH9KxGvTv8HYpDZ+ioPrzAlev
	lwnc1mHvotW3yLWnN0m6rPFJeSaFkVjMB8qFL2VyA1EHQzL/LtTJqh4BCUol3WZPlQ3G5XPIXEz
	tGb5GlG3oitIjteq2lL8yUBLlWzfCLhsPwcQ==
X-Received: by 2002:a17:90a:1506:b0:299:2db9:1ad4 with SMTP id l6-20020a17090a150600b002992db91ad4mr8144676pja.40.1708403707097;
        Mon, 19 Feb 2024 20:35:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFX+axYbsDY48k5l7j5C7a1cJrJX/RLz+J+wnl4KKylH8daXnj2i63k8T6eRvoXIL3JCQPS/mxYwKGFc7hVFU=
X-Received: by 2002:a17:90a:1506:b0:299:2db9:1ad4 with SMTP id
 l6-20020a17090a150600b002992db91ad4mr8144665pja.40.1708403706675; Mon, 19 Feb
 2024 20:35:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240216160526.235594-1-hpa@redhat.com> <2dd3ead1-1066-3564-7c6b-9d366dc6e1e9@linux.intel.com>
In-Reply-To: <2dd3ead1-1066-3564-7c6b-9d366dc6e1e9@linux.intel.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Tue, 20 Feb 2024 12:34:55 +0800
Message-ID: <CAEth8oE1=JKSskNG3HKxRyc8p=OXtgMskO7w4NV=stxCdmWhHw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] KTD2026 indicator LED for X86 Xiaomi Pad2
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi llpo,

On Mon, Feb 19, 2024 at 9:57=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Sat, 17 Feb 2024, Kate Hsuan wrote:
>
> > The v2 patch includes:
> > 1. Typo and style fixes.
> > 2. The patch 0003 skips all the regulator setup for Xiaomi pad2 since
> >    KTD2026 on Xiaomi pad2 is already powered by BP25890RTWR. So, the
> >    sleep can be removed when removing the module.
> >
> > Kate Hsuan (3):
> >   platform: x86-android-tablets: other: Add swnode for Xiaomi pad2
> >     indicator LED
> >   leds: rgb: leds-ktd202x: Get device properties through fwnode to
> >     support ACPI
> >   leds: rgb: leds-ktd202x: Skip requlator settings for Xiaomi pad2
>
> So what's the expectation here?
Thank you for reviewing it.

Sorry for the confusion.
This patch enabled the KTD2026 LED controller on a Xiaomi Pad2. The
controller controls an indicator LED which indicates the status of the
charging or other events.
Since it is an x86-based Android tablet, we need to set the device
information through swnode and revise the driver to use fwnode APIs.

> I take the first patch and the two other
> go through the LED subsys?

Yes. the first patch is for platform-driver-x86 and the second is for
the LED subsystem. If someone would like to test it, they could easily
get the necessary part of this work.

>
> --
>  i.
>


--=20
BR,
Kate


