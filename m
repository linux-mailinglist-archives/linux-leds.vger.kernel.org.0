Return-Path: <linux-leds+bounces-7697-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3BUrHDFX22k3AgkAu9opvQ
	(envelope-from <linux-leds+bounces-7697-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 12 Apr 2026 10:26:25 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB95A3E3177
	for <lists+linux-leds@lfdr.de>; Sun, 12 Apr 2026 10:26:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1DB5300575A
	for <lists+linux-leds@lfdr.de>; Sun, 12 Apr 2026 08:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C25C3033DF;
	Sun, 12 Apr 2026 08:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XQsDp/Ia"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354A57262F;
	Sun, 12 Apr 2026 08:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775982382; cv=none; b=dyczIZZvEPJNMqiCX8AJBNL3RAi+lxd0+Tux0DWhjx7/Jd8K89yUsW33lrPl0Jk3X729f1R3BLqYMvYlx15VUGjasQ1JVHt52eCF1/sHLoO4THuRAFNRczq2Te/cX2ZgkrC9sm1GnwfHCOhybO3EbQAvTAC+QWPnnNT8NC7OG6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775982382; c=relaxed/simple;
	bh=cfBrcSWwcevFwkdPbQiXo3iCG6nOcw8bkeirs2KTYn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OJJxbeGz/I6/Qj2VDnhhlmOtOGjydVbctb3gqAikPAFpy3u5PkTI2XjONHYNikNT6uNc+hu0SfvY35vv9Caf7159Bv9hAR5A3ezTl7O4TQCUPjleEjHzkdv3aohZs5Wd6ik592phLHcgQzqcnRgdA8DycGUxc8fHHnlC+iG3Gfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XQsDp/Ia; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EDF3C19424;
	Sun, 12 Apr 2026 08:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775982381;
	bh=cfBrcSWwcevFwkdPbQiXo3iCG6nOcw8bkeirs2KTYn8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XQsDp/IaWMHWUf30T4GKek1gvjdHCa9bT2UIDJKu0xbNQvJ0PQcxgMuqBnnASDG4E
	 cTtdak+V0tWt4ZXnGmqAkfkTnZe5b9atnOo3XV7GWo5RFvPaNsF0yAUG8CftYROeK5
	 Iv2BH2CFCV1Q5wkMvw8nb88HwvUmdPigFfUS2g8TN5Pvox9r7KbEJSkDjFNzPrRDG+
	 yesG0vpTv/SZfWXf4XPS7L0EJGfpO2C533XWwugqJ2g7C48fo3LmVYEXJHJc94Yrlb
	 wQDbYPmOT3MbgErAenRIYiEvm0bgiydm51SVwzmc0+RE+hUuuoaxEYI5mABNYgJanF
	 ewmxyk8anQpZg==
Date: Sun, 12 Apr 2026 10:26:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Markus Probst <markus.probst@posteo.de>
Cc: Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v7 2/2] dt-bindings: embedded-controller: Add synology
 microp devices
Message-ID: <20260412-cuddly-taipan-of-reputation-1cafe0@quoll>
References: <20260411-synology_microp_initial-v7-0-9a3a094e763a@posteo.de>
 <20260411-synology_microp_initial-v7-2-9a3a094e763a@posteo.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260411-synology_microp_initial-v7-2-9a3a094e763a@posteo.de>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7697-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linaro.org,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AB95A3E3177
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 11, 2026 at 05:27:35PM +0200, Markus Probst wrote:
> +properties:
> +  compatible:
> +    enum:
> +      - synology,ds923p-microp
> +      - synology,ds918p-microp
> +      - synology,ds214play-microp
> +      - synology,ds225p-microp
> +      - synology,ds425p-microp
> +      - synology,ds710p-microp
> +      - synology,ds1010p-microp
> +      - synology,ds723p-microp
> +      - synology,ds1522p-microp
> +      - synology,rs422p-microp
> +      - synology,ds725p-microp
> +      - synology,ds118-microp
> +      - synology,ds124-microp
> +      - synology,ds223-microp
> +      - synology,ds223j-microp
> +      - synology,ds1823xsp-microp
> +      - synology,rs822p-microp
> +      - synology,rs1221p-microp
> +      - synology,rs1221rpp-microp
> +      - synology,ds925p-microp
> +      - synology,ds1525p-microp
> +      - synology,ds1825p-microp

Previous comment is not resolved. For example you stated that ds723p is
compatible with ds725p, so this should be expressed.

ds918p and ds415p as well. ds925p and several others you EXPLICITLY
wrote they are compatible:

"ds925p, ds1525p, ds1825p, ds1823xsp:
- supports fan rpm report via an adt7475 chip and therefore does not
have gpios for fan failure
- no system current sensor"

Probably many more cases, I did not verify all of them.

If there is going to be new version, please organize the patch
documenting the compatible (DT bindings) before the patch using that
compatible.
See also: https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation/devicetree/bindings/submitting-patches.rst#L46

> +
> +  fan-failure-gpios:
> +    description: GPIOs needed to determine which fans stopped working on a fan failure event.
> +    minItems: 2
> +    maxItems: 3
> +
> +required:
> +  - compatible

Best regards,
Krzysztof


