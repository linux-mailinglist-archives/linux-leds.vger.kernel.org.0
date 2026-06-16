Return-Path: <linux-leds+bounces-8613-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QzMaJwLRMGqNXgUAu9opvQ
	(envelope-from <linux-leds+bounces-8613-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 16 Jun 2026 06:28:50 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBDF68BE63
	for <lists+linux-leds@lfdr.de>; Tue, 16 Jun 2026 06:28:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=IxVDiETX;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8613-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8613-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 244333000A4E
	for <lists+linux-leds@lfdr.de>; Tue, 16 Jun 2026 04:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 988FD3C8C52;
	Tue, 16 Jun 2026 04:26:35 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282AB2F8EB1
	for <linux-leds@vger.kernel.org>; Tue, 16 Jun 2026 04:26:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781583995; cv=none; b=hWrrMx+GUyPejJMPJVTsidJsiOMDqaG8op+gwBDu42lO/9JMkkZSZK9J1FJnqrZenJHVJcb1WcWLY5Pn6kF6Hj6aXSopL8cKcnL+ar+mKTIwj+Yhi2NFIgHggHcz/0w99CkFWzoHV+geT4OSbR687BNDjVGfEVTT4MuYABrPKjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781583995; c=relaxed/simple;
	bh=oo4tfyy8/lTcDz9sLBYLwqwvpecf+BueTrMqZlBkdJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fzfrFadUOOnaOkrNgbq7KxvZ/oY1Pjd4vMNlrvWJzSXjwDpfC3rPA//jZ5ZGrlbYmjHm149xb970uNsVlbDNmnoBcDKVdzWu3PaFjnrwHKvc406SaeMAx2//qS16LZr6iMNiARFsh1wlJOTUc4Uc1fXI843NTx9d8Qq2qhDClUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IxVDiETX; arc=none smtp.client-ip=74.125.82.178
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30bb2df6fbbso345752eec.0
        for <linux-leds@vger.kernel.org>; Mon, 15 Jun 2026 21:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781583993; x=1782188793; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bY4/S5kAo7rT958o4WJs5aY2AIH3N1nSwFvgkKoR7DU=;
        b=IxVDiETXMu9w5l/RPm4LuK+2KnGgZJ4HOIUnfo+bHinIg1ulcPcR687NvE/6dW/bpW
         OUj9Zha+X20RjcukD7hNlxX1Mx4L73AaoG/42u1t24jnj4I/Osg5U58zAsqd48u0g3S7
         ZhKNWf7hVdxeLjAzciO+KqM/h7phqeedB3yslKahoB4OIco23FB56/ox1h9BW4GSiQPz
         iAWYZLtvTkfcIBn0QiH3UaMXnVhddQ07NHNGrxdfoAz3PouEPmNBqG6EplQeJWbZJskm
         E0Z4+758FRO22vnty66xXhAY3oq3jFe4AUvEmkPH2ifCNR2+hjz8OnTtFw6KWskZRyW4
         vgUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781583993; x=1782188793;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bY4/S5kAo7rT958o4WJs5aY2AIH3N1nSwFvgkKoR7DU=;
        b=m3WlJ1OXB2+n0GYpdN1csJBk3XrPrEqjHBtnM/Z+rsCcjzK0KY+jD0T9CVVzZTSOiu
         1vVZPQ2tnTwzow+jOJ+vgirvYXrcz9wOJ9WkkgwmL1Thttyk3qc8T7J7txNkVx9Y54ge
         Q1tnLrbGom0asIZwm5vDSuJbAkC/2rL/iaD+UGcFtO5vEFtgTyPsAGNUL8q3UiQKS+9p
         EFCOMOO84fpZrlmNqkHhz33zECY07I5ikMR3SZylsknFMHUYy9GQqdx8SabB/vE5XiHr
         dS6tFUtrniFdDY+vU3bV6ZzMCYv3pZJfhwgvnJVww87CUpRLPajAgQdMfuwPfgluldG4
         KbVg==
X-Forwarded-Encrypted: i=1; AFNElJ/KS/3wCpbOdKqMPGSxD74Z5ttVlH8spo+DSeim3exutt/kwtrvlp+JWySHG4ZA1pljCeCAQmpkG11H@vger.kernel.org
X-Gm-Message-State: AOJu0YzMf5S/3GkQP8uXbcF5pDHatjv7eK2zDiiAffFF4MFsGTR3/O6z
	/1YseEKygA+eyFmLhsk+4Cmi5BJM30V66lDX/KVL/7iJvO6f2q51BUKD
X-Gm-Gg: Acq92OEv5pob+pC8niyB0SOYNI/sn8mqGJeAAYQBKZZ053EYUi8M5ibauwXQq4htbO3
	Btj/CqbV1eXe9Y65VEajKCv0Ga1Ak8Fj9cIMVSu/3qSvGNbX4UAbWyVvJTqH9lv4lfYr/fhbVX/
	y9dR13XOzbWHodLEaTr6xZ5OmA1R20IhVXArPBt7muaMI5wP+XA3OQ4+xSaK+MvTnT8UNrul2Et
	UiZ0f9tRdSJyPUqMIWocDieTb0bnVUrtd/6fh4ePTOTLooDuiySdgaPfT2m/GoQtwDtPXuN04aA
	5EtSJkNpxxxdRZldh+NQ6eEOZ1EMIEAJBYYAtRfU8w3J5Nr4cxG32lHx0O03fEjb8VoVeMsSTeO
	7TmoeAsMWdaBtIJ1mIkJ4b6wBRBOBWw2eDgDGtS+TuWtDaiRU/frNjg88q5z5OZuKOquYulmLIs
	1PzexdiqmuBNrt2pMn/CsjwbZ8sZ8znvGIrr1h5/A0uDPmITGlWTSxLBHD32iXvdnT
X-Received: by 2002:a05:7300:3b28:b0:304:e72a:d4d1 with SMTP id 5a478bee46e88-30ba5f4b95emr1163025eec.30.1781583993222;
        Mon, 15 Jun 2026 21:26:33 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:3714:f5c2:9b83:3df1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb8f8b2sm17660379eec.27.2026.06.15.21.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 21:26:32 -0700 (PDT)
Date: Mon, 15 Jun 2026 21:26:29 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	Ion Agorria <ion@agorria.com>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v8 4/7] input: keyboard: Add driver for ASUS Transformer
 dock multimedia keys
Message-ID: <ajDPtOyr8GJYaVYQ@google.com>
References: <20260528053203.9339-1-clamor95@gmail.com>
 <20260528053203.9339-5-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260528053203.9339-5-clamor95@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:clamor95@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:sre@kernel.org,m:ion@agorria.com,m:mirq-linux@rere.qmqm.pl,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-pm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8613-lists,linux-leds=lfdr.de];
	FORGED_SENDER(0.00)[dmitrytorokhov@gmail.com,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qmqm.pl:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EEBDF68BE63

Hi Svyatoslav,

On Thu, May 28, 2026 at 08:32:00AM +0300, Svyatoslav Ryhel wrote:
> From: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> 
> Add support for multimedia top button row of ASUS Transformer's Mobile
> Dock keyboard. Driver is made that function keys (F1-F12) are used by
> default which suits average Linux use better and with pressing
> ScreenLock + AltGr function keys layout is switched to multimedia keys.
> Since this only modifies codes sent by asus-ec-keys it doesn't affect
> normal keyboards at all.

I think using input handler to intercept ScreenLock + AltGr is quite
awkward. I think this also passes the original key events (unless you
make it a filter not a regular handler).

I do not see benefit for reacting to AltGr+ScreenLock on other keyboards
to activate the special mode on this one. So given the fact that you
already mange the data stream when you split it into "serio" ports,
maybe just intercept this key combo right there and create the input
device and signal input events right there?

Thanks.

-- 
Dmitry

