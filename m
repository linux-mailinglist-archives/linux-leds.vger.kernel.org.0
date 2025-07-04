Return-Path: <linux-leds+bounces-4995-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CC4AF8E7A
	for <lists+linux-leds@lfdr.de>; Fri,  4 Jul 2025 11:26:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BCB51899EC0
	for <lists+linux-leds@lfdr.de>; Fri,  4 Jul 2025 09:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9998128D8D0;
	Fri,  4 Jul 2025 09:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="azhbKy8n"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F65C2877C9;
	Fri,  4 Jul 2025 09:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751621177; cv=none; b=BtNf6ePxkcqgyj7idVS8UKBjvvgWuScUznAliFoKU61f9OV3GJ3aAhuGlL3sB1T0giNLuXXGGC2o1ZcI5TEO0c22sTpST7/ui7xC8znkgU7Nekva3MbqDpKZ2MA234aKcIZ6GKF15hsd1i7LgJ03xlgf/xqmlV+V3xpGb1Prph0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751621177; c=relaxed/simple;
	bh=YzJ7f3KLQR1zpm+iuLIN/W9uHN2F+jGerQypA1e6+qc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a4SzuI2HZqS8qbcmjN3Xm5kKL9OuDuQoyk1Zmh4MugbboE0MnS/nIMWhBoxi726yrefSe0OOTh4UOkultPKx3Evbqb9bd/PS9QdGYaeU6yJ4b1OUw63P5ASA43cZywbvxto85/nizWdItdq7x9uH+nxr7SWb2PcXSNqpp8DbQmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=azhbKy8n; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b34dde96cbfso41371a12.2;
        Fri, 04 Jul 2025 02:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751621174; x=1752225974; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YzJ7f3KLQR1zpm+iuLIN/W9uHN2F+jGerQypA1e6+qc=;
        b=azhbKy8nHgk1YzCtypR9O9T+J49Vom00YDqBY1nGAsXuMbMh07Y+TXrJMCOReNcTy6
         IPH5JBiCnBHUHWtOsEBN4Q3UhjQNXWO6jgGgqz3UOaJXKN+xto3/FpSQ9PQqfcqAZa0f
         TqkvrCriqV+z6Rp0CHnb8NXn64bWXSP0Z140wnjdN1RUgwovkQApvNtOz/NaaN2Duf2a
         OK4kwU2CJjkGcztO8sli26aTzqe1nsmN32MNWmPjjawpVfLo9Q/PIS1J3moV5JJiPEdL
         ls1TZftoqqov8Fd8VoFxEHZEVg9n6WvKX58JWo3JrzMnf9WEjLpGnbsyJsngNwkxgAKb
         oiEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751621174; x=1752225974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YzJ7f3KLQR1zpm+iuLIN/W9uHN2F+jGerQypA1e6+qc=;
        b=oeGEyHpDAx4JasbNRWdoj17Fa9gAztDRkxmPjcBqiCISpi79mQSnl9SfwPR43M+k2U
         Wxh7RHHli9abTwQl2uhf5Sj/sj81MYS3jaw8xExKNxgwOXEW6mYikaG6eb7kdWZDnMCi
         gks9XodYJ022qGpHRsNQ6jOJA81P66WUgFkw2K7p6qIx29C4JYAJk0dNvi+9UM8h1eUz
         HM0tnvRAIihh89bGqS/Ze2+bvfcatK5TEz4ZQ6aFoDhI7rkU0Ua6vGiDuUHQXbL0VAZy
         LoyAQIMdm1H5CRw/5NQNCLDMWra1inZEpl4yeOXqz4lF2AMXi1ZeJtz2OWmrfvWnZFMW
         vS3A==
X-Forwarded-Encrypted: i=1; AJvYcCUgrQIQKU+p/JWCpH4aqvZv9kTx1+ZZ5pmShgnY5Yw5EHPKk79HMvquRtnQg8AsiE9UGzwkH/zn9MsX@vger.kernel.org, AJvYcCUkbtWMkP9RR2Gs/FIwtPoMiugS79jJYk6rWHCZwD5vPZAeiRsYsu2uQSirENgczIK9NMc6l6CUuQGIdA==@vger.kernel.org, AJvYcCWGXAvx6tAnSxlPNnn+PiqjskroLWET2FDr92PjOWDDOVom1rUlTIcGsDXOE6GeTwfqYWLzhmdibMf28vms@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi9sun2omNQc2RYfWQXrGVZzK5mMVCEASHkt0MwXP7z2V1j4av
	KISsGnHl7uapT/AEmsA0KxLPYX1sC6AiMKKyYSeG6v1A6dv6+qT444VQpoBLc7UXByt61nREeyf
	6EnKBVNuJU3+oegImnboGkaoal7p+mEs=
X-Gm-Gg: ASbGncsA3IBSOqXU19552N7pGyTd4RLNze5wWhVO9NUv1Wbpmk+remBfRvpUh14UJjL
	sF1DBLFUB2gnHJjyBRCRA6VbS6M3j5F7gx2EPiCSml340FSL4+8SU8yi4WcYJcx+ontsqGxN06O
	xrQOgUzCuE+5YZArxCzMVOCUcMD+CcJnfwpZJeSTqefMg=
X-Google-Smtp-Source: AGHT+IHHYl9A4dPbMQqRrHweG9hOs6jzyb0LTloSyvNAbT2NXkvL8KPUiv7q9ZUSsYiw40i7GfqdGu5fo2bAtR01whA=
X-Received: by 2002:a17:90b:258c:b0:312:1ae9:1537 with SMTP id
 98e67ed59e1d1-31aaca78f48mr1185131a91.0.1751621174257; Fri, 04 Jul 2025
 02:26:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250629130002.49842-1-jefflessard3@gmail.com>
 <20250629131830.50034-1-jefflessard3@gmail.com> <47d24e31-1c6f-4299-aeaf-669c474c4459@kernel.org>
 <aGI8a4iaOpN5HMQe@smile.fi.intel.com> <57f0289a-7d82-4294-a1dc-c6986da0c5ce@kernel.org>
 <aGJe2krBnrPXQiU6@smile.fi.intel.com> <532c88b8-d938-4633-ac09-12bb3080a023@kernel.org>
 <aGKcfuQdNtQjmVC8@smile.fi.intel.com> <668a149e-f39f-45dc-8c55-d914df116b47@kernel.org>
 <aGVOCw6iqeIpIDBK@smile.fi.intel.com> <CANiq72nhJVz4MgSmWvHFJwg=mQ2O+WC6XsUQgsjPAdOfF3hAJA@mail.gmail.com>
 <6a7b118a-f266-4510-80f6-c357202b09cc@kernel.org>
In-Reply-To: <6a7b118a-f266-4510-80f6-c357202b09cc@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 4 Jul 2025 11:26:01 +0200
X-Gm-Features: Ac12FXxg6C9CV3yjGusidLTHuvDsjVObOMOeSPphfE3xrXchI7ZBA9LfpM3eXDk
Message-ID: <CANiq72mVW5tc3DJjiWzJaYKivgDPiWUuyKUtzuhDyXjH2D9o+Q@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] auxdisplay: Add Titanmec TM16xx 7-segment display
 controllers driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, ojeda@kernel.org, 
	=?UTF-8?Q?Jean=2DFran=C3=A7ois_Lessard?= <jefflessard3@gmail.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, devicetree@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Boris Gjenero <boris.gjenero@gmail.com>, Christian Hewitt <christianshewitt@gmail.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Paolo Sabatino <paolo.sabatino@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 10:23=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> You just pasted the same what we talk about. Did you read the thread?

Yes, I did.

It wasn't linked directly, only via the coding style one, and I don't
know if Andy was asking about something to be fixed in those
particular docs (i.e. `clang-format.rst`) about the wrapping in
particular, or in the coding guidelines docs, or about clang-format in
general as a preference.

For instance, I am not sure what was meant by "an application of the
clang-format" -- if that means "an example of how is it supposed to be
used", then those docs are the answer too.

So I linked the document we added back then because that one clarifies
a bit the use cases for clang-format (on top of the paragraph in
coding guidelines) and also acknowledges the different
styles/preferences of maintainers; and then asked what Andy meant.

In my reply years ago to Dan that was linked in this thread, I
clarified that clang-format does not perfectly match the kernel
style(s) yet, and thus I mentioned here Peter's proposal from a few
days ago because we could perhaps get way closer, and asked for
feedback on that, which I would appreciate.

Cheers,
Miguel

