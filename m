Return-Path: <linux-leds+bounces-5264-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6902BB2E57B
	for <lists+linux-leds@lfdr.de>; Wed, 20 Aug 2025 21:08:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB0B11C84DA4
	for <lists+linux-leds@lfdr.de>; Wed, 20 Aug 2025 19:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B18DF27FD78;
	Wed, 20 Aug 2025 19:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bm54gcJz"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F9617A314;
	Wed, 20 Aug 2025 19:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755716926; cv=none; b=ECImqAOap4inlPd4aoM1Iy3LgWDhSOTMpNl0mpG8nGWT591zk9jJmlhkCXdalLGThZP+7N52vr2U3x9vhm1Cl8IEMpyZXl9q7kwmaXeI84SMkpdstBnOx/HtJrfvL84mis77sWrtSJRwzXC5HZIab8pHrG+qsnuaEvU2NpzFYR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755716926; c=relaxed/simple;
	bh=HcDyeRjH+0g3ubSN5NYaXUP6Sk1mYq3xyhgSnMrL9KU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mQ8TF1pNz/sZeu+/LLKLqLcMLMNoyz7COe/BH3Ac+iMg1sgHFy8j6RIbtQXoRrA/GJh2ZApBfqBftzj0YXuaZ5Rq5IWUBj757dlcmE+1XI5Px/vA1G2vWSDnrjlnlQfrjZHFTQJdi+G1jRJTv3p0nhLeUvwAKOynpaQLOANLuSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bm54gcJz; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6188b5b1f1cso258471a12.0;
        Wed, 20 Aug 2025 12:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755716923; x=1756321723; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HcDyeRjH+0g3ubSN5NYaXUP6Sk1mYq3xyhgSnMrL9KU=;
        b=Bm54gcJzgoCLvoyYrnvPzCblGkc0rtViUv+4bN7zXTxkYeaSL52pQ8FzfDav8wnoEp
         8WfxoaA5TB3OB8qOfofAWVKEb57PSI4l8qVHWaFuGXN1/PFvUuvKy4nVajWWJi8bg7xW
         wfHQ1K5/TGjG4swQVqjppJXuFABBU51thzsUJ20dUEdwpLbzbediWINaO/+rGNMurAhj
         KNExOrngXn7xhpWl6WO2u7zFauc46nD+VCsMm7mhkQykkEzfx0v1dCsaviy6e+tKH0T3
         5bhFM4hBHhgh9dJNMn1+Inltd5XWG54HkWhKYTvjXK6ofDkuRZ4SYwIfjrMSkV7rSvtA
         aUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755716923; x=1756321723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HcDyeRjH+0g3ubSN5NYaXUP6Sk1mYq3xyhgSnMrL9KU=;
        b=sBsQJwT5Lw7U7uaN+qsmKcXz7SRo6XZgJcRSBaRKEW04QXPSlxjpUvGsr4p1dapNxw
         vRc1W7UwHd1cx1hYhrovxcmTLfYj5XEcHiPWiPn2oe6+Pnow4Ehn66C7jDkaIulHMCtI
         qP5NIuAsqLqyfk3CCwE3STWGcLoJ/vUNPOuL0H0WXaiDbc6LCPp0Vaj0GfaWVO9t+A0L
         /kVBayag5WojjToGSpmqnqA74DUP12oPoErp5gLX5mEKcamI4trhYRkFqP7etPbrLGIK
         /lJrmz5iJ0djKDJiv7FFNlc/YZqfIjb/D97BAAppoV5rQJ40TU63i7GyJyYx4bNXo79o
         bAmA==
X-Forwarded-Encrypted: i=1; AJvYcCVf+Kv5H+Fd4SpeNfmJ5lUhO3WSNLlgpG1f5qjMCWHlWN2VODxB+W069TCMgPm6yzvesKxosBA+5GzN@vger.kernel.org, AJvYcCVwBEhn0M1sbArW8KKDFpNj794U9AmzdjGqFIDNunvwDQ7FA7er90zR12faxI54l9GiwdIRzmyngkKeFF5O@vger.kernel.org, AJvYcCXqG56w1DT/dJCyv03JgTIAoo+8Ebxi2sg9RF4tJ44MhsxhhdTwikeix8HfwDlJjr1M2kT3lRo0wGP0Gg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7zQO3x0apKB3ST7JHm62nNhpiLHNtNjOktJP2tW5/Dhs3AOKF
	BSjVPNU1KWtXmy0dm9vtVURrHOxAIQavEWxeF0UzNicg8kAnC+nJ5UdgWE5WreAZ9VnxKe/m8gH
	F0BLyhgTRZuQe5JGBPM7vvp/t5L998Zc=
X-Gm-Gg: ASbGncviTmiTnBLu88xdcyeQrZQMOLJH20ob5G/SI/Tn6Rhm40a3PLAFde5Kud58Krp
	06EMHT3Wv6muO6FIV1qC3CArz5bNKb7+GWAUEq24cN/zMXmFBh9+UFX3eOk0bMgyFAlPVyImYKr
	6vqARzoRsQWGxCIvFboQjArPV5IlHw6uRMXVvktxXfE5P9vl70aGnxsIbMEcqBuXnZpzahBBxaB
	HVLEnQ+2OzG0/1tsQ==
X-Google-Smtp-Source: AGHT+IHjCRoLLJwsbsTLX+7XbOUyGhHR35RnvdQoPKy3xduLiLTbN+JBYUbUk+vA0ohxdOk67QoYySFRQIuqws38vG8=
X-Received: by 2002:a17:907:3fa3:b0:af9:6bfb:58b7 with SMTP id
 a640c23a62f3a-afdf00f7b01mr337333866b.5.1755716923109; Wed, 20 Aug 2025
 12:08:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820163120.24997-1-jefflessard3@gmail.com> <20250820163120.24997-5-jefflessard3@gmail.com>
In-Reply-To: <20250820163120.24997-5-jefflessard3@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 20 Aug 2025 22:08:06 +0300
X-Gm-Features: Ac12FXwmMQGAdofCnD6L6CapMXC695A-jukjMfaKnUeE5mWFbt2l_Dj9Qq6u1fQ
Message-ID: <CAHp75VfyR0cjnC6C6Xy8x9nTREdAgbjo18RLYNRzoLc6KmXnTA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] MAINTAINERS: Add entry for TM16xx driver
To: =?UTF-8?Q?Jean=2DFran=C3=A7ois_Lessard?= <jefflessard3@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, devicetree@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Boris Gjenero <boris.gjenero@gmail.com>, Christian Hewitt <christianshewitt@gmail.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Paolo Sabatino <paolo.sabatino@gmail.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 7:31=E2=80=AFPM Jean-Fran=C3=A7ois Lessard
<jefflessard3@gmail.com> wrote:

Besides the missing commit message, the main part of this patch should
be merged with the patch 2 where the YAML file is being added.
Otherwise it will be a dangling file. I dunno if DT tooling has its
own concept of a maintainer database, though.


--=20
With Best Regards,
Andy Shevchenko

