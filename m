Return-Path: <linux-leds+bounces-8170-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uP0NBUyUCWqOgQQAu9opvQ
	(envelope-from <linux-leds+bounces-8170-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 12:11:24 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6BB560649
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 12:11:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CF05430094FF
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 10:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9CED35DA61;
	Sun, 17 May 2026 10:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rciXCJPe"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5158D359703
	for <linux-leds@vger.kernel.org>; Sun, 17 May 2026 10:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779012678; cv=pass; b=oDHtJ2giqQtu7HnZHkEEVRidvl++7JmRkbGf2Xlus3KcvmiMXkrMFuwZMCMkdV2DZh3Ltq3MfswUAHgxIbZVFpzOW9y7EHBn2DghsbYRXx1np/fYs0ZYZXLJ8WMEn/m2q8lMoqy7rhwuTjiliy1wuCMGnIkAi7Fq2AmEZlsKvF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779012678; c=relaxed/simple;
	bh=ifauxA5VPfHKLiYlXWLHFvyPEzmbAuAokN126eppTSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cfrkgFoCEQMvURff+J7lKXoH7zUcYd4CAsmW9KeJIcJpSQHjcJvjNTgvSlEXac4jz6waNoLRU/6GGw4c6UIwlMlhnUgt9QHfTKQPRIXPUjdxuiNVookTSHG328KtmlieLaIuRh6CNwbtkR2SQB9lpUiEVp4msDaYOzeliSsgEK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rciXCJPe; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2f3c623322bso5009581eec.0
        for <linux-leds@vger.kernel.org>; Sun, 17 May 2026 03:11:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779012676; cv=none;
        d=google.com; s=arc-20240605;
        b=PwgIiHxjVfwEbWINqdOHUaikvzQbhYXtPpPK2SF0bYLlxtMo201OCM3C4pkuRqv+GC
         FPH5DZTYQvULkQSD62z6QUnBKGadZNkR2I8oqmus9crMHaGqVoGjJE/7Js4gpuTrMs9i
         cZ3T4N+k6QcnfdxJXNvJYl6F0DdHx3Kc441JxZRxN5rLX+G9jbL3tWBDDocuGHaJA7rC
         7XwTqVy3OLe85MWTtWdh5cMiEiLfylVS+MHxTINsmwNmIDLJUr+rrwEmHCrxSj0uTlPF
         Jv2rJF9HNdljTYTtFr+Xa6vxhkQkWZyBcgSvLe9iyMuQrmZi9prIKdYBc54jUYGnSXoQ
         fUNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ifauxA5VPfHKLiYlXWLHFvyPEzmbAuAokN126eppTSk=;
        fh=L2Xw50BwKLnoj6vdpY8IVXSXdOvNj25x1s8QX/9ZB5o=;
        b=QRnnLe7B0FCauzkwQVfzJoKl8fWoNiy/+dW9qYR6/QkQJpZSrg+3XP/55WTGivlyh4
         JzyLXFIuS6AOqI6259f40T3MxDk6XlhhVuJxXVwo9LDYwciruMKe0Uccep+zCB7d/b5p
         xaWHAPJ9TSbTxQ/cZ/HBgN3pGHC1a9m7Cb0GkqaJCV2w63N0n/yHKsrMH4tDOiQw1tvr
         NKDjX+qcF8DgmqzYKG9Bj9ZL5tOdzDwro0xY4/gM3c6ZkSVZeNeHiOgw4KnqnwtUMEEz
         IE5Ur6s+qGYBIkJpKpusUKrfqEKBEBtf0StAgOMIBBn1qZClkf9x4kciQJUB1ipQmZa9
         VPeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779012676; x=1779617476; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ifauxA5VPfHKLiYlXWLHFvyPEzmbAuAokN126eppTSk=;
        b=rciXCJPeT566uKV/w+At0X8Rs0RZV/FR/rji3r7v5LvvlzTyLylSU/Xzt91AF8VNNW
         XN8A0EauYbrgo4watG8Yts5hYBUsa709meo1B9CmObIghjF8H+BXZwjQt+yx2jMyDijH
         2iwsLse01gO9RFaghvIQuT7SbEbt2SVzdL7E+wFMBA3OoPrhnAENZnH/VClpeWB4dxyk
         oM3zMzSfboDWz8Vi28CYGvdqVRP3qZOWO5TjTgdfXKX1oNqoFXrB/XNvEegSWLQ3WnhM
         tEgJK2s49ifJyLvNL2YCaFkq1OK7DDMjfXTPd1Q5PGC2tKUQv7RQv04N1Qz/BWVn3U/+
         5DMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779012676; x=1779617476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ifauxA5VPfHKLiYlXWLHFvyPEzmbAuAokN126eppTSk=;
        b=jTB9xSydInQtIxJdFl0txCHhDkj28AaUEJRgg+/6MIddGTQ0xIjDyTgvtBCv3neh7I
         FwTiBH3Sr4lOWEt6IIJTkneAzbu2/XSpD3/AJAx9089ckPy1Qe1Ym1vZBIJnvCON71Vz
         28bNAlOUmScQLm/muZ3ucSXm250Vywm2Cyw11jzdJA3Wj2RaCG66iMophnOw8S7cnCv8
         aLHY0l/ZdW/ND9O2ZdyqY0+1Z1QJARv1Zq0kHVSS9wFqwXP7tW4fnkT/RHfkB6dNnxMD
         hMZXF6afzhXERtXqxjmLff+7jN3qTw6pVUh3X4B4EXZC89y5NlrZHK9jn7MqcbLE225n
         3xJg==
X-Forwarded-Encrypted: i=1; AFNElJ/ywRPGh26afFiLIhdtVn+PlGrjBBpShqQBc6wIfQb+1Nv+LWnwkOSr9H+14GKzdpyemlPlkTEw6Fbo@vger.kernel.org
X-Gm-Message-State: AOJu0YzAcoSdrb3HPxGFi/FguRzNOUYT93Yc3MSN6TNo0Q1SLyF75qzV
	tuSpctA/UZ3Bz319B+bFMcAprV0meG8kGnHHfzYbeX+Y7eF9zhpHvtTXykSIEj24TMDfNCO+mSW
	hrPsg++ZdNKk1A6uGnNlmcpG5l7nUmD4=
X-Gm-Gg: Acq92OHacZKjGT1OqX/Ygb7FH9stXRcTOO0+LzwIEE2n2zOcwCYDLms03aknMWL15h/
	Kkl6ijCv0dEkwjHOxIJDwBH3nRnCTxiMODThhpbABCIqd2r8/V6ZYdGuQ49bgeyOO7C6S5swoz3
	7+8lDn7JauCm5dkdVJzPZbK2mUs7cUb2KmBmC3xawzbnmjB8X7VbMTWtIaVGT1DfPDWiQdrRknu
	OzMF6SRJedZ6lhD0gnpNqkCyc7GSVU5DHX8y9VSJ3Q4aFJv1+dCVVuyah6AoIFDpvD4RLyw9Xon
	BQFiJgkq
X-Received: by 2002:a05:7301:3d12:b0:2ea:5057:a304 with SMTP id
 5a478bee46e88-3039818a65bmr4929254eec.2.1779012676435; Sun, 17 May 2026
 03:11:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517074306.30937-1-clamor95@gmail.com> <20260517074306.30937-3-clamor95@gmail.com>
 <agl0Z_EGzX8X4No4@ashevche-desk.local>
In-Reply-To: <agl0Z_EGzX8X4No4@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 17 May 2026 13:11:05 +0300
X-Gm-Features: AVHnY4L0_43-8RfJ6hM5f4ALu2Syvstfg64dnmlFGgfmiwaNMhHznD8dW2kFuMQ
Message-ID: <CAPVz0n2D7q5kEECPr+bo=W=5OU=w4eni-FccdMEUMupkzHhvLw@mail.gmail.com>
Subject: Re: [PATCH v1 2/6] mfd: lm3533: Convert to use OF bindings
To: Andy Shevchenko <andriy.shevchenko@intel.com>
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
X-Rspamd-Queue-Id: 7D6BB560649
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8170-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

=D0=BD=D0=B4, 17 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 10:5=
5 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, May 17, 2026 at 10:43:02AM +0300, Svyatoslav Ryhel wrote:
> > Since there are no users of this driver via platform data, remove the
> > platform data support and switch to using Device Tree bindings.
> > Additionally, optimize functions used only by platform data.
>
> This is a mixture of at least (!) three patches:

Maybe you can make a list of how to split it then. I have tried to
make it complete and remain readable. I am open to your suggestions.

> - devm conversion

This will be dropped.

> - the change of some constants

If you mean LM3533_ALS_RESISTOR_MIN and LM3533_ALS_RESISTOR_MAX they
are used explicitly in r_select value. Previously it was passed via
pdata as register value and now it is obtained from the device tree as
resistance in Ohms and register value is actually calculated.
Naturally ALS_RESISTOR boundaries changed.

> - the rest
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

