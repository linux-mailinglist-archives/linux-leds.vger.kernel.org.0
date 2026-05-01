Return-Path: <linux-leds+bounces-7931-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOCNAH4z9Gk5/QEAu9opvQ
	(envelope-from <linux-leds+bounces-7931-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 01 May 2026 07:00:46 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B51F54AA6FB
	for <lists+linux-leds@lfdr.de>; Fri, 01 May 2026 07:00:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4DC4F3013EE1
	for <lists+linux-leds@lfdr.de>; Fri,  1 May 2026 05:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDB251F0E29;
	Fri,  1 May 2026 05:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cnnuM5Qq"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BF4156F45
	for <linux-leds@vger.kernel.org>; Fri,  1 May 2026 05:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777611641; cv=pass; b=ExUkM92wLgYjZgeJutGzEJsl4GBHyXdLDnZTgR2mLl3VSMGQ5Wj95SAmRWOhV+cyqB+NIyeZ52HFeqklhyNsD9sS5xX+91nO3i9OQIlAu8xqVVKUaur1zCHggTxbjQC0EMy3POVIzHTtAJgkLBSIld0+EfrF9hWKW4vIs6bX4YE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777611641; c=relaxed/simple;
	bh=SBauyVcTPX2Ataosw2rZRkBglocAQphV8+r815lWmR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U+aVmSobbyOYeOb6cbDn1Jid6w70bnpvExFXepfZvMOFSyizmArJXUhqSKTc8nMEcJmpEpvRy8IsR3v4XSR2nWqS6iaPcRjwlJxEfjE74MoqoyxYsng6ZwS+SJz5DqRBA6v+4oeUz+Hw3ijYm0Outvd4Mna88M2WgwEhKXaBa0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cnnuM5Qq; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48374014a77so18785045e9.3
        for <linux-leds@vger.kernel.org>; Thu, 30 Apr 2026 22:00:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777611639; cv=none;
        d=google.com; s=arc-20240605;
        b=hXlJvnRGp0Tzkly/x/pXvXKqUPdSPOtves0w+SUL7eecTiFUbSN3F1ta0BZFaiUFhD
         UySVx6XDbQIoJGGh7msv5fbq0DEQCvAz5zeQwCfgzDvIVN79LxY3KE6tTwrhr8U/ulX9
         dqYDhSP+mvpSxYZF823cenNqjNkU8OdDckbWcsOC0GFn5j93kSj6xaZm0y0NeuIioRGb
         jtTYYV6leW3bjbBqk7QPADaOTOkLpaKE7OgX1nXfUF4wBf5PlmGee29q0KwyK78OZE7t
         oS1vzPB+co8LE8CCT8dfNuK+2gorBnLHPl1QANzh8LTVsPd0if4fnVK4bql4wTFK0GoT
         Q3Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u4fQWvYslfT7zG5J1AHK+cbagfvgWh5WDnFa7R4/FpE=;
        fh=drwpKkJtJFdr0q6p2cGa+Jgkx0pFhoU8ZIVkDdYIUR8=;
        b=PF5h0MEdIg6BftWUX6xEZs+//6rjX2Paop1IBvx1ftC0WRHeJ3lYVtXnP81zJ7Ktta
         94ho8li+9qOyM3yZpAlcXoOsdfsbBaY6pRdXPIapuKtvbxznHvNfXX/sIABfx4S4HpHX
         zOdB7O54Tsbr92ukP0Z1K2KKne6pLpHneeCficA7SAalPVCbg0VlLenLw9Pw1AHzuA7j
         y/5UOwNDsn7k2CbzG1nBCQ64v5ZIab9MTUyWqC/2K18Uzf0f/s7shWoIZ83s3KS+s8DH
         QbgZ4iUhNkZjswJXF3jyWaRawZW4YGBmAqbV9uUjwaM9oBLVKh46vcUFHjNuDINO+xY5
         zNyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777611639; x=1778216439; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u4fQWvYslfT7zG5J1AHK+cbagfvgWh5WDnFa7R4/FpE=;
        b=cnnuM5QqaV1cheYenOHiO1YGYn66K465SpkxelljGcjPKbYf6glvXvtD3F0SIRfPtU
         E8/3eH6aniXXYcHlzu6HYzjRLsVIejQD4xwhmc9cGPYyN1dzLAgaDaCD7PB+qLancfwx
         z0Co1QP/TXW1oXmCuVkwH0+RpcEI7VjvwYfDyfBOnKgwwovFyc/PqdpO+ggAVSFlnZ5n
         FX6A2hYf4jNPfR7g2r7LSXXQgowXeDxigcqdffIpZxEy1m3T7Sp1bFakVT0xpdCi5iZT
         f9tnCUf1K1MhCv2eAwXFzOTGTfTQFkZQGmPolp1Vl/mezHybo3VoVvbQtP0uXXjpijsK
         S5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777611639; x=1778216439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u4fQWvYslfT7zG5J1AHK+cbagfvgWh5WDnFa7R4/FpE=;
        b=NSUoWZ9g2pkyFOEcCCnZjvu3YxyfzURLzlo73hOvk/JgbLKnT3yt0SEeXgFRJSFqtO
         71WU+7nca7Cx/H6qvO9uDQ0zlrOR/kMkVVKji91TEkxM4je4Xms1bH7nVq3y4ruwz9vS
         nVKejmPHvizzh/oWiibbf4wtQFX1aVsEytQX4AH86PIgWq55mHo1rb7bbEUEcW2ASBgp
         tJeHajQ08hsCsWBHnQQyRZjpDPr4y55gJMAzIIbLtlgTcYw+0a4AQUN1ke3yWSt89cBa
         EHBemoV3UNSw8ipF9WGDkDgI2KRiAwhZX1EMntrCzlpmCTedrmD2c5Cf6FuHIDZRSkZk
         L/gQ==
X-Forwarded-Encrypted: i=1; AFNElJ9oOyEElLgKIv7i0Il4C09XiRIw3qIjn8dg/SCJFpBGN9kD5W+5J/zxht/5CXG1K1s97PUSMQsYKMz3@vger.kernel.org
X-Gm-Message-State: AOJu0YyHXpEoO+ly/6lc3CA3Iq+pm2A227bkTl4im++mlRPd8wqOI/hw
	Mkxb2kaV7HBFMFKElPotZsSsvAzw/EAP6uu5m4ior1asmgIWNFlNrbUfBEFCyLlRJr7jMUcviUX
	n98I/nZI44i21IumgKiDHSqyPYaqps04=
X-Gm-Gg: AeBDiesSEmZKqMd0VehfQcceNV+8e6rq0A2PUDrkweYe1lwy/lHil5hyeqMQec2Ab0m
	YRtJOJNkFqxjShuNXz690xMckpAR4D4VjMjM4TXAPw8aN4R+F1qxnEmZaKa1D9plk48rC+QKZac
	qjZ2ot8uU1phtkcCl0axRaeX/xk2c1wUYnGbPy+fI4vUg4FRzzb+ZlEeFlHYKBbmPunPlKPc+9b
	ckQfgYvT7WCi7EGMD0dfyIdTtq0lJsTdXYx1xzb3VBLw2eUglRZiuBz9QYSRNQlcQT67br95J3U
	9APu2R6TSpPUM1DMfb8=
X-Received: by 2002:a05:600c:a010:b0:488:7ff6:1f75 with SMTP id
 5b1f17b1804b1-48a8eb98882mr22166985e9.21.1777611633905; Thu, 30 Apr 2026
 22:00:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428113923.112920-1-clamor95@gmail.com> <20260428113923.112920-2-clamor95@gmail.com>
 <afO-nOr2JUfm2dUA@kekkonen.localdomain>
In-Reply-To: <afO-nOr2JUfm2dUA@kekkonen.localdomain>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 1 May 2026 08:00:22 +0300
X-Gm-Features: AVHnY4JLhHPzj6DGjsiLYEr3D-nEAFcsblb5hzuuwo4dyelOT22nmoL5seKrUFw
Message-ID: <CAPVz0n178FSdKfyEzbij+dvHTv8C4KENbOvyt3-A4a=mJxsYig@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] dt-bindings: leds: Document TI LM3560 Synchronous
 Boost Flash Driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: B51F54AA6FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-7931-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

=D1=87=D1=82, 30 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 23:4=
2 Sakari Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On Tue, Apr 28, 2026 at 02:39:18PM +0300, Svyatoslav Ryhel wrote:
> > +  flash-max-timeout-us:
> > +    minimum: 32000
> > +    maximum: 1024000
> > +    default: 32000
> > +
> > +  ti,peak-current-microamp:
> > +    description:
> > +      The LM3560 features 4 selectable current limits 1.6A, 2.3A, 3A, =
and 3.6A.
> > +      When the current limit is reached, the LM3560 stops switching fo=
r the
> > +      remainder of the switching cycle.
> > +    enum: [1600000, 2300000, 3000000, 3600000]
> > +    default: 1600000
>
> I missed earlier these limits are of course incorrect for lm3559. These
> would need to be changed for the lm3559, too. I'd just drop that compatib=
le
> for now.
>
> I can do that while applying the patches if you're fine with that.
>

I appreciate your efforts, but removing this property will lock both
lm3559 and lm3560 in the lowest current which may cause malfunction
when driving more powerful dual LED configuration.

I will address lm3559 handling in the driver and I will send v5 as
soon as it is ready and tested (since I don't have lm3559 I will test
on lm3560 but they will have same mechanism just different values so
it should be enough). Will this be acceptable for you?

> --
> Regards,
>
> Sakari Ailus

