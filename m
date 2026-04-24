Return-Path: <linux-leds+bounces-7843-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJWMH/iW62m7OgAAu9opvQ
	(envelope-from <linux-leds+bounces-7843-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 24 Apr 2026 18:14:48 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D268446137A
	for <lists+linux-leds@lfdr.de>; Fri, 24 Apr 2026 18:14:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60F69300A101
	for <lists+linux-leds@lfdr.de>; Fri, 24 Apr 2026 16:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E78923DF01C;
	Fri, 24 Apr 2026 16:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BNgGTQkl"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DE42D593E
	for <linux-leds@vger.kernel.org>; Fri, 24 Apr 2026 16:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777047261; cv=pass; b=iIuZeW+zm5NiqkQF1aoHaJSP5hEu5Q4KrttljSB9EM8n3ulOxwXp/hs5dj+REceoLX+DHVsFNVPVH5TmdLSxqz5hwrqmFTBm+LueD6ICByEe3UVkJ4LqXmbqDWJDPTnCwPiyeaGESo1Fvi8RR1i9ZKA1l9R7CftYlmjOYW5muXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777047261; c=relaxed/simple;
	bh=y9VWWAVf+sPSulQkC75TryBTQ6nOxKyoDww0ynpLHJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jCYAMbMc4KYEND4uKjOPqfKwO7s0ZSRFtKkaIEBRb5vxuRthdCeeWM8qbgWDWKD4+FDREcOPvpiX+PI9sqWQj85imtwNVr3IDv+Th5f6ab1lTrT8PXlRyI8CgsDwDT+UW/6MnU/dsGRoeqEouEt4xiqEpAtW9NSNQ9sJRDf5S2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BNgGTQkl; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43d6fbd0954so6275929f8f.1
        for <linux-leds@vger.kernel.org>; Fri, 24 Apr 2026 09:14:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777047259; cv=none;
        d=google.com; s=arc-20240605;
        b=eT5e2cZ79MaryPGqKqVfitlSeRp7vPeroLcPlsJt0651fybxTdJCzej5sJDXPyVyIP
         eLYGXJCmLDf0wgPwm9CYq9eSqvp434vpzOzOqAXsNmB4nsEjjxQ5Vu1A2EIRXPvwZ/Gn
         wlkUXX09kkZuc2mYRSqh0oa5cbaXSbnFfSw6Jrkav59DRa7iRrikFBrMFfGX50PQPF8b
         PO43WB6Zt06oWtCcpcek1p9DPhkFaQlSSwCWUhLO1s+qS0Cr3UX5GzJFRejoWtmG2ZVp
         1e4aoY/BBEZaDYrNCBnFgCgRoKxLZklpMDbytwVllKXA1OjY/ByizS5mROz5MdZBd+Xq
         A5Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TfB9/Ilh4zIbPmNYOZ8Zqqkr1ypd91RjaVULTxad/6w=;
        fh=PZRTTcGRsawGCiG53CYBtFQNaLBmLPrzj/jfluFd6Bw=;
        b=iStELffuU2DmZ5ReWy0dZ9MpmsCZ3a8KC7dBLMzIx/7oUvG+C46rUBNPH2Ba+MjxuX
         s3u86a2uTY2Zpk7BusmYAIQGxgG9oDbZ4HACYh+01gv0ALkvC45JgF440INYVnoB+28W
         iabIc0qBMbV3PTMP6hsdS5icAwWSADPbM9EJBrrqIuJAlamgvho0dhBUs9g1FIo9/Do5
         QrtEwxIedCm1ZxLc05yoYkYJB3OuJ3JAlGwqlHVfkF/OnlkQoT2ww8adtYarDcR4bZr5
         VsBw7mAWwxsmt3iOjIplgo9MmYemRV5Ond1PPJt6O6RwHD+c04tMLHaRDVhZ3z9q9+mR
         4zjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777047259; x=1777652059; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TfB9/Ilh4zIbPmNYOZ8Zqqkr1ypd91RjaVULTxad/6w=;
        b=BNgGTQklDRRb5IjhqKx4IiT8UftLlmBRs9dBcFjroiuIXepwlmddxWEcUr0+SQbPAV
         7CVX8LfQszYcnW6pNTCuUXlnn0JuQxg34irYNXE7pilyBEOVznZOa+//APnBzjXvhhpF
         dOYHPAmK/qcSjYrWNtTDGSPOh3qRimQmNWmPhDmyOySqG4W+YbG92o8FUwFZPIlZZLBc
         Go9ySir1ILK5pDkCgCKRLcHs1n/zElMZ5k7Mo0rIwhpXrsQPP/2piN0Qs1EjBWRWOtd9
         JH+tx1zWwuiN9DQEszaQ0usbE7MqX38iWqsmw+MwgaZ9nuKHEXthh43OXCCFrPtgoVut
         3R+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777047259; x=1777652059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TfB9/Ilh4zIbPmNYOZ8Zqqkr1ypd91RjaVULTxad/6w=;
        b=Zlx9dpT2H6b6YwMJTAXVk2UoJeNbLjCNiLiubukX8BgnmtTCfIcAQhyx82OdIbAWnM
         Ul6abYHm7iXe4nKzkEaLwuPEQRRsMYLUrJ6G2fvsJMVaV8G/ExYgj3uqRvWgNg97fLsK
         7/7QR8T1JQAvmrheVOVFUmKyLQcETtuzhF2RX7i6uqr3Cr3s8lFWQFJh93JUMWZZajhS
         REMhiADL719qbwL9nNE1JKB+Z8VCxKNO/a8O4DIruCMF7lXrqzIySV1L1gs8tJscY53u
         5VEi+ekG1XBgKnBKvB89NsiWjbf/VAeOvsFUPJj15zQUSNcY0iABSS7A4OgaOVeWssvy
         yKVA==
X-Forwarded-Encrypted: i=1; AFNElJ8YUsLDBZl81R7Q2pnFevVkdWfX6PTlD4DZtQxFHZbAHuduQQJlY4AcQ0IWCHbGeZ+w5VEkPILp9Xk8@vger.kernel.org
X-Gm-Message-State: AOJu0YyKc8Y0AHedBN0qsETwhjkKpjwo79oil/jKwNNfjOCVZ8dzCA0O
	RBw2kwiM3tjcvuOf6gxf1vnhTNIHwQHiiwrMpOYV0OLbIQVzral8L8LdakWUnjaEtYS0cajWjB3
	W+J2M1hjtbZu8reUQP2/RbDYRU6DBExQ=
X-Gm-Gg: AeBDievMTm0u8E+qprMPcWFiPgaNYGDLo/DCG2EvrSCIkijyUgeVrLerXgxzHqKWldx
	MojOW0Zw4JXhvS2vmCLzGgvdW7WhlFi1sNMQKdzYRiiFJbt/FZrYT3toTxpNZkfREn4fciOc1Vx
	eXNbmHk+kMSK1I/8c4ey7C+EFCw6wp5thaqlhiKn/phv3zZ/Dv/L5pbLSNxzotKhSJY4BTRDrLt
	bvXemgfk0d/yplvzriBhaCQYHnBLjLl/gbPzyx3GuA+h9OVFYf0G8zmIjeWb03pFp5ngZS1lYGx
	T713a4kIFcSsmJDrgw0=
X-Received: by 2002:a5d:5d0a:0:b0:43f:e9ee:5610 with SMTP id
 ffacd0b85a97d-43fe9ee562dmr45512953f8f.43.1777047258447; Fri, 24 Apr 2026
 09:14:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424072230.90354-1-clamor95@gmail.com>
In-Reply-To: <20260424072230.90354-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 24 Apr 2026 19:14:06 +0300
X-Gm-Features: AQROBzDQ8OdXSRPg-Esx4t8hyrkv8O_kTNFel6FIImhLjgyCRL8pJaptl9yJGS8
Message-ID: <CAPVz0n3osf5=013w7=EhJKNeYmrRNg_JT2s9a9_tKWL_teQm-A@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] media: lm3560: convert to use OF bindings
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, Lee Jones <lee@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Svyatoslav Ryhel <clamor95@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: D268446137A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7843-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]

=D0=BF=D1=82, 24 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 10:2=
2 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Add missing HWEN input pin and IN supply. Fix v4l2 subdev registration.
> Remove platform data and switch to OF device tree bindings.
>
> ---
> Changes in v3:
> - added note regarding lm3559 in the schema commit
> - lm3560 power on/off functions converted to be part of PM,
>   dropped redundant wrappers
>
> Changes in v2:
> - vendor properties swapped with generic LED properties
> - added mutex lock usage optimization
> - power supply and enable gpio commits squashed into PM
>   configuration since they are both required in making
>   proper on/off sequence.
> ---
>
> Svyatoslav Ryhel (5):
>   dt-bindings: leds: Document TI LM3560 Synchronous Boost Flash Driver
>   media: i2c: lm3560: Fix v4l2 subdev registration
>   media: i2c: lm3560: Optimize mutex lock usage
>   media: i2c: lm3560: Convert to use OF bindings
>   media: i2c: lm3560: Add support for PM features
>
>  .../devicetree/bindings/leds/ti,lm3560.yaml   | 131 +++++++++
>  drivers/media/i2c/lm3560.c                    | 250 ++++++++++++++----
>  include/media/i2c/lm3560.h                    |  15 --
>  3 files changed, 328 insertions(+), 68 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3560.yaml
>
> --
> 2.51.0
>

Hello Sakari! May you please not yet pick this patchset if you had
such intention. It has a few slight flaws I would like to address in
v4 next week. Thank you.

