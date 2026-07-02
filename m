Return-Path: <linux-leds+bounces-8854-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WjrCFrSfRmqxaQsAu9opvQ
	(envelope-from <linux-leds+bounces-8854-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 19:28:20 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A33C6FB5C7
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 19:28:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=mrYeRCUL;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8854-lists+linux-leds=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-leds+bounces-8854-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AFF433040B86
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 16:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CB444A33F9;
	Thu,  2 Jul 2026 16:24:33 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B55B4B8DF5;
	Thu,  2 Jul 2026 16:24:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783009473; cv=none; b=Df+HPOPyzbNOWMKoxjUSud+KnpvRJ3FJNx9ZbxuIQKLp2ygXRzx+HOzXQuiemSz5cEDrdcjiCnUjpsYWkD7lanXHsEDCXr5COb+pw+yJE0vH3E007DosQGykq1UyaNGUtUjvSPe9Zb2RvtEooEQ3gLYU6Ronsei3TDISTCK8BQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783009473; c=relaxed/simple;
	bh=LyELoBdYpOS52lrM65tWCHhBtYJPbctbHnjtovUWUdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L22TmLqXJGzmi0uGw0cJQvg3bmms2S9FpbBePkUDkYG4vgUesi6oU/ML39j4AcymR0pSTgMDdmsLE7hn+fj4G8/mRiIqBjwr/unLBCEJmRJzXYb7Ym4bZGp/sCnxECpScvAm0rDHbIsE6DBUjkd1j+88U9FEBYHTe79WcYbnZFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mrYeRCUL; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 233C81F00A3A;
	Thu,  2 Jul 2026 16:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783009471;
	bh=cqd+4QwoSxwHlQ2+3ip+f3FNRocLcFAUKig9cva6AE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mrYeRCULMDMZneRGnsoqgqfV3S43/KxQri2F/0qp9fnc0w7RpFPdFpA9+sQuF09Jd
	 MgU8pGAZcMovKNwbh3YZczjgFfHIobsOJe9d2gKHm4XL/lOQ/nmYQvEdWC6NLlen47
	 zlpLN/Adz6HiOQWNvJaO7by7d1hH3r5uuW2V6vOlVRpgR9EoEjyInAK+2JwTRDDZML
	 nRlnPHwt1+p1LenBFB7Xzm+EPyTpDCSGVE7wBsPQDux7VofNt5FSyv9OlffWiZHwBV
	 oqFJNpIavFVSA3fPlDrWsvcRQcX3c2JBJ4mV1IKAi0rlw7VaV7hSkKckJFhX2V92aX
	 iUcemQfQQQlXg==
Date: Thu, 2 Jul 2026 17:24:25 +0100
From: Lee Jones <lee@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Pavel Machek <pavel@kernel.org>, Sebastian Reichel <sre@kernel.org>,
	Ion Agorria <ion@agorria.com>,
	=?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v9 0/7] mfd: Add support for Asus Transformer embedded
 controller
Message-ID: <20260702162425.GD2108533@google.com>
References: <20260625081529.22447-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625081529.22447-1-clamor95@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-8854-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:clamor95@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dmitry.torokhov@gmail.com,m:pavel@kernel.org,m:sre@kernel.org,m:ion@agorria.com,m:mirq-linux@rere.qmqm.pl,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-pm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,agorria.com,rere.qmqm.pl,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7A33C6FB5C7

On Thu, 25 Jun 2026, Svyatoslav Ryhel wrote:

> Add support for embedded controller used in Asus Transformers for
> managing power and input functions.
> 
> ---
> Changes in v2:
> - converted sysfs debug exports into debugfs
> - added kernel-doc comments for exposed functions
> - fixed minor typos and inconsistencies

LEDs and MFD look okay.

Let me know when you have all the other Acks and I'll merge it through MFD.

-- 
Lee Jones

