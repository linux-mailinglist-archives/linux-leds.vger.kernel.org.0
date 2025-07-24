Return-Path: <linux-leds+bounces-5116-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D39F0B1029A
	for <lists+linux-leds@lfdr.de>; Thu, 24 Jul 2025 10:01:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B16C1CE15FB
	for <lists+linux-leds@lfdr.de>; Thu, 24 Jul 2025 08:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D40BE46BF;
	Thu, 24 Jul 2025 08:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="1ouAnOyP"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3720E1FF7BC
	for <linux-leds@vger.kernel.org>; Thu, 24 Jul 2025 08:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753344074; cv=none; b=qWA8AdycvydzeWvgUPcradhJ3nJIU161or+Fk/uE2LdBjpcjqNf/pbWiP9aEAVnWQ0C9ul0yIWCDWOaB+5v753dlXnJjQTKXKbllpJQoiYJRJL/heBHQ2itks0y+62rRrak55JSClz6ZwVspbuxJGYN95PT3uGpn0N1Agm0Yryk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753344074; c=relaxed/simple;
	bh=jPZXQ1fFo+Qnqi9JBZiSzhdyPYYUfy+we4OAHFyWwZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mmc97Hak8HrDQhDSIX40ICR5EKzaOyWAIo5pGNVjY/UhJ0BF9WXAujLnaqVZW9c6l2+GCCz9+FI0426ePPwHWrwhI0Yrf4h8UYhSIt8Pt1NCEB5VNX0BBZ28Bg+ddwTf2lNTdko4657InMTjsArw01ivZ/o8l0jOqSdoH5QxvNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=1ouAnOyP; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-70e3c6b88dbso5547597b3.0
        for <linux-leds@vger.kernel.org>; Thu, 24 Jul 2025 01:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1753344072; x=1753948872; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jPZXQ1fFo+Qnqi9JBZiSzhdyPYYUfy+we4OAHFyWwZQ=;
        b=1ouAnOyPhYhJwB4yXyCRDlwVYOt69a/1rwT+/vss43d99wD7oEQr7tcwtFwvXEPaVb
         +h44ijHd8q35blJZVhgUeFhDRn/L0NLRRpXTfPAVK3uQRWi/7D1VQrn4bYMp05QJQ12u
         NRSmz9L6jUofUUrgLUZU3ptaUsrwIQR8M4A/sb8LnPDylLnsHVP5O/yKrSIVrfUFs8nZ
         /k9121c9ADc6aLKu/YbhfZpH5+4YfIUFJaZOn0z8gWHAiEtB/FWGIQ0KB0OPQvMsidTo
         rrKfFCc2/rvDlTxgsgapc6vEZwRAYz/6/FzdIqiRaQOvumRa8hnxaY2FICJvwUNSCZuP
         eeTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753344072; x=1753948872;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jPZXQ1fFo+Qnqi9JBZiSzhdyPYYUfy+we4OAHFyWwZQ=;
        b=jKGclUMg48yCypBsleWeqNsNqfQSTAp50TFnCCT+aG/oHrOum2/UY1tg/UUij7QyXG
         76VrHtJyojSBurfF6SymF2jK56q02dwtw91HE9kAZiIXr4kRXAKFYMmu458RbWMPKnju
         lBZL3q3Z3ZZw2QROnD99YdooZVrqkhjUmJRFUYNzIatD2cQg84W7d/hoMxJIxczKCJns
         e7XmHvgd3FM48/LPCDuLLDWWrL+/066n67wmwP/qyQMnIBV2CbLTapUv7H16BlLAkSz+
         iIwVOs1SmzP55BUpfLAzY7gLaq/cWd1ryRbkn4LIsSP3iM4L+fcNP7VUsmms3F4EJjdN
         Ebew==
X-Forwarded-Encrypted: i=1; AJvYcCWijEl3Wi/2/saJnaywoTvi2g6stJb/uTjbUE82hDo9mNgjPzLJ70PycoVYdKAQYe9qLCjcZmJfSBxN@vger.kernel.org
X-Gm-Message-State: AOJu0YxXt1UIhvOpQrfyDESsanUYYrWlvqfQoQR9swfwzI1MlcS4N9jK
	68TYzaoXp+Poos8WZVQ8kjOSoiYQEEI5JmUFu+Zudp93idgjmknS0bwePbgGZ/HKxgt1ATbZv1V
	nKola3r1nYOE36e7OEjhJD1xs7g2CMCn2ccfAejTWXg==
X-Gm-Gg: ASbGncud2c1IvFh3eR01wsvMGAel/TK5uQT6pCohjY+wStsrtjJC5esEo477OE0zUMU
	Amlk4UKlQsSqlblQLov1fTUKniHQuUE8jcRFaIEdjfu6uhx/okBfnDAV4ugDuwF3ExtqzoSTGjm
	xYxCRR4MNwHeDRl9znTFRDwnslXNvsTW4PZmyr2ZST93uwoEGI6aC1cJVPSdQkZ7P18dcFBiFoK
	Qi0SenVr/+fa3g3Rw/NVVZZdnDS0P2r+Kh32DUtaA==
X-Google-Smtp-Source: AGHT+IGGUZbhiR9IUlqNv9m/wQVXhvGAvZakNMpySeQRLyZqWCzHCQ7JR7cfsHKSfms6Ri+PP3YPooNgbQaM9igRZ8k=
X-Received: by 2002:a05:690c:6382:b0:710:e7ad:9d41 with SMTP id
 00721157ae682-719b416239bmr73383627b3.12.1753344072196; Thu, 24 Jul 2025
 01:01:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250723-leds-is31fl3236a-v6-0-210328058625@thegoodpenguin.co.uk>
 <20250723-leds-is31fl3236a-v6-1-210328058625@thegoodpenguin.co.uk> <de3ded0d-6d05-43fe-9ac9-b8bf29bd7d53@kernel.org>
In-Reply-To: <de3ded0d-6d05-43fe-9ac9-b8bf29bd7d53@kernel.org>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Thu, 24 Jul 2025 09:01:00 +0100
X-Gm-Features: Ac12FXzbWOhwGHI2oZtiOXY1iVFd8-eis8oWuz_X6csMbEke0f93YRLAKfk30DI
Message-ID: <CAA6zWZJ5wVgzh60Oj-4a4Uc8bvQ-VccGfjww-EjcjdM7Y0L_7g@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: leds: is31fl32xx: convert the binding
 to yaml
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, 
	Lucca Fachinetti <luccafachinetti@gmail.com>
Content-Type: text/plain; charset="UTF-8"

> <form letter>
> This is an automated instruction, just in case, because many review tags
> are being ignored. If you know the process, you can skip it (please do
> not feel offended by me posting it here - no bad intentions intended).
> If you do not know the process, here is a short explanation:
>
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new versions
> of patchset, under or above your Signed-off-by tag, unless patch changed
> significantly (e.g. new properties added to the DT bindings). Tag is
> "received", when provided in a message replied to you on the mailing
> list. Tools like b4 can help here. However, there's no need to repost
> patches *only* to add the tags. The upstream maintainer will do that for
> tags received on the version they apply.
>
> Full context and explanation:
> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
> </form letter>

Noted. Thanks for your time.

Kind regards,
Pawel

