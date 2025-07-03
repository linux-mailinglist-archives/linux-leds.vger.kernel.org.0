Return-Path: <linux-leds+bounces-4990-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 730D5AF821F
	for <lists+linux-leds@lfdr.de>; Thu,  3 Jul 2025 22:49:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 014621C8419F
	for <lists+linux-leds@lfdr.de>; Thu,  3 Jul 2025 20:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1805929CB39;
	Thu,  3 Jul 2025 20:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJBYnQk3"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0B5190679;
	Thu,  3 Jul 2025 20:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751575759; cv=none; b=OTDjXxJTkoVJzLdLZ0Jgsrxz7JmZiA+95xqCCz6zcYFOPZs1LD00IPOJMLo5Xt16Xgeh5l/7HbjYksDAkiowrlHdr54BKu1LtZNCBa4UjH4z3XqdMLCQOJo03bRQc1UR+5QB8x3mBHiiy+y6WXIc34nfnFhUU0K3HUnFvJ9uKrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751575759; c=relaxed/simple;
	bh=SsobPlRMPeRU3hIZX02TYes/11KBf6FmHR0dvU5rAoE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qlHFgtwAMXjbjuaY7/YwAUZldUKazfQsXAOAoPhtBvf2wYh4MWtoYlMtNQph+m+GwWSg00F2nTOI/SEHJKZYBMa/xZcfpqQiLH9Gcvyv2Tbd0hn3a//zPJw8kdZs3Vjt8ozzPsNW8HZp4EujbOJda/Pc4I+jmBixnubwrihxEP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJBYnQk3; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-313dc7be67aso39006a91.0;
        Thu, 03 Jul 2025 13:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751575757; x=1752180557; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=de6Xy6WbdpSyKC3KzCTE7FmC3N9GHqDFh/13vZAPPpk=;
        b=bJBYnQk3eRf5070veRaUP9mGMOK8ZZ6aUzxt6DzyTUJwrb+v2wKGAQI0MujfGccVW2
         M4KOnJprmbH6kHnBPzqFCer2zzTO/tyuBdlsZFrn3wtLoiQZefv/q4FPjIBYnBohLoQY
         H1+jTekKWSXX1KW7QdqKyoUuvKNCNdcPaiLaucgVQlRFMTzQDlAqrX+b/kMyFRpm48j5
         aGB0BMbAm7rrjsTREqrwpHGor8hupQgQOmwJGpS594qHfo4MfM5pIzAz1PdpdBqw9U11
         7GGXtVG0H6aDeoIsq4bOdQIINbTNFlf22dsw9bWBbY6HCLg7wrO5QNOnZ4F/D9eLfN1C
         ruhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751575757; x=1752180557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=de6Xy6WbdpSyKC3KzCTE7FmC3N9GHqDFh/13vZAPPpk=;
        b=HOEh4HTgNndI7pXVXRRaPg8XDH/XUeSWncr9laxJiekxybsNgeHlCRed8fz2+yPpFW
         KDd5X/1RviyPMwSD+b6Y+iblgXiuw7Um6lVJPT7pVhKKoUvLFV9J2qgGrf3suRDo7Osu
         k8LGw/R8pKp9T8b//hdHtKbt9Q02qM8VHz643xnNywz1AsFCKKlRLoE9kp1I3jUhYfEa
         U0wMK3NaNMOPEHzu+6w0rnKpKIfr8uHNKSU7uTtz5+KG63DqewIfb9CQ/V+nLXX7veQr
         D3KLtwet74X6AKmZK2y2DaWzICM5+2W1TY9sB8XUbRyDV9nIGsMybYT2AyeGoBVJMG7f
         nc+A==
X-Forwarded-Encrypted: i=1; AJvYcCUlP2tKPrl1tEA7lXHmwJJYM8lktB/D2PkfDW9f0utNtN8h9a0QjmIVm7io2qg4nDO6jKMTmdgsNkRqog==@vger.kernel.org, AJvYcCVsfOLzXojzHZp4X1pRP5za0dxhNMNOjjRvmD1Tj8QomkrMhDoM8ytVWlSUTua6PyMtNRkin3/juVRHp9sb@vger.kernel.org, AJvYcCXmJ0p9zYBTFzwfAGCRq6G81X3l1ZnZ0DJD7b4PGAZpiBYpXhIFp9LwzBah6kbUU8LD+pS3jp/2hTw0@vger.kernel.org
X-Gm-Message-State: AOJu0YyTa9CznjDTMEWvoGydb2XOG71RAs98vG8MPFtnLJ3ulroeLpHK
	nyPui3s0aLStEVLPKaiyn4ZdpgYq6Bnq4sbLESFgm4w3ZhRWDmuHnlC2OcG8qGow7ghGAtvGZOc
	yxUaWEjH3oP7X9a5VE+D/R+m+DeRqgDw=
X-Gm-Gg: ASbGnctfm7sf66g9YDAraHy6/MHXjQNFS7BmDkhPuUPKaSpguKWadU6khdmnQOlcxUS
	y7cGZU4iVvVWaUMCb7SkmAtzVghLvAtEdK76cWL0FxDngBexnpsdNj3y/e/1arPqF8l5Lgw1BZw
	RBVORmlsznHQNFDZvGSKoCZM+lTd+PM6g7OEQ2855WXpyiIDR22sXOyA==
X-Google-Smtp-Source: AGHT+IFQUJnXuVhiax1ZltRxdCSTxkNXCC/084qLRCoJ5F+syqQV5awuTZZaiASKsgM0y6EzCJehosV/aE8hNK3AiM4=
X-Received: by 2002:a17:90b:58e8:b0:312:1ae9:1537 with SMTP id
 98e67ed59e1d1-31aac20f80emr46062a91.0.1751575756859; Thu, 03 Jul 2025
 13:49:16 -0700 (PDT)
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
 <aGVOCw6iqeIpIDBK@smile.fi.intel.com>
In-Reply-To: <aGVOCw6iqeIpIDBK@smile.fi.intel.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 3 Jul 2025 22:49:04 +0200
X-Gm-Features: Ac12FXyVRSxMyOWrs6i5jfadaQObzZb2xdEnOXRu_DYUJ3BKUTjKSYPNphD-37E
Message-ID: <CANiq72nhJVz4MgSmWvHFJwg=mQ2O+WC6XsUQgsjPAdOfF3hAJA@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] auxdisplay: Add Titanmec TM16xx 7-segment display
 controllers driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, ojeda@kernel.org, 
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

On Wed, Jul 2, 2025 at 5:19=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> It's not my preference for the record, but I wanted to know more about
> an application of the clang-format. And perhaps some docs (besides .clang=
-format)
> should be fixed rather sooner?

There are some docs at:

    https://docs.kernel.org/dev-tools/clang-format.html

since it was introduced -- or what do you mean?

Also please see this very recent subthread:

    https://lore.kernel.org/all/CANiq72mEMS+fmR+J2WkzhDeOMR3c88TRdEEhP12r-W=
D3dHW7=3Dw@mail.gmail.com/

Feedback on moving the version forward as Peter suggested to the very
latest welcome -- I could take a look at that and see where we get.

Thanks!

Cheers,
Miguel

