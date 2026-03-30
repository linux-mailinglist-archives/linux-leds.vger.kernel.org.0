Return-Path: <linux-leds+bounces-7580-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBOHFmseymmu5QUAu9opvQ
	(envelope-from <linux-leds+bounces-7580-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 30 Mar 2026 08:55:39 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 03ECD356208
	for <lists+linux-leds@lfdr.de>; Mon, 30 Mar 2026 08:55:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9065305AC97
	for <lists+linux-leds@lfdr.de>; Mon, 30 Mar 2026 06:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5D4B396D09;
	Mon, 30 Mar 2026 06:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ccOw7LLi"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AC63815EA;
	Mon, 30 Mar 2026 06:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774853482; cv=none; b=NttXCMgfZJw3Pb6pXYej7hRYMazxvG81ATJnowoWOUACStHLGzHaQZOJjyAtvklWVX/iiggfvyNg22KhS6X8fpRLFR5LBDtCupWajfZaUTRZ/v/cwgeE0/Y6gBpfB2Z425vWBqs2oyUk1BPnhdnIA3nC+Ec5TcqqjZnjoK39EcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774853482; c=relaxed/simple;
	bh=+rEwJajDjdKi+ikUg7LiJD0xscdXNzDgZURZGTbRRfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UayiKVR6yoM4OtPF7aG4fgrmYw3MohWqClzGhv1hBVoCCi9y35lnLCJnFkTMiC66iDgw0XGuD1DXUEHnzpm4zqQ+HlE6OzLHFttn5m7pLgCJef4MZMyHwxFcWp0fpcLhmI9I6KM6Z3JKcudt5Gd3D1T3oC1qUV/oIp3H4DFoXlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ccOw7LLi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB104C19423;
	Mon, 30 Mar 2026 06:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774853482;
	bh=+rEwJajDjdKi+ikUg7LiJD0xscdXNzDgZURZGTbRRfU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ccOw7LLiYJqTd4UG7Sast6JqwnGoAuuj3C1wufrAxsRf7MTkypNL65Fjn/Gyr1JXu
	 un+HcCqe610AzJ3AyjRbDBFC4XNBYqiOs67riTkd47D8/dkA+2Ay9pN9z8/x7WKv7q
	 HRRGDT1GSSu5nyRMvctF8P/fOZppJxKst7dIHokKotnXwEzIltHIG6ovQjOGCU8Xp4
	 HZvwLdbOH67sp1uY8B42t5ZYHLR9qZfOVV0u+giUbiwe+FyflytWxqirJ5JlGYVSz+
	 /YD5YtSVMctVjmy/09uMRDSrt1H+nDg6suUeObmoxo0KpOoo6ILC5Hg0wCkb+zWSWV
	 3FaE0q2T7Dm8g==
Date: Mon, 30 Mar 2026 08:51:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Markus Probst <markus.probst@posteo.de>
Cc: Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Len Brown <lenb@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: embedded-controller: Add synology
 microp devices
Message-ID: <20260330-delicate-sassy-mayfly-ebcca7@quoll>
References: <20260329-synology_microp_initial-v5-0-27cb80bdf591@posteo.de>
 <20260329-synology_microp_initial-v5-1-27cb80bdf591@posteo.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260329-synology_microp_initial-v5-1-27cb80bdf591@posteo.de>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7580-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linaro.org,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 03ECD356208
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 29, 2026 at 08:02:15PM +0200, Markus Probst wrote:
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

Last time you had one compatible and implied they are all compatible.
Now none of them are compatible, which might be accurate, but nothing
explains WHY they are not compatible in the commit msg.

> +
> +  fan-failure-gpios:
> +    description: GPIOs needed to determine which fans stopped working on a fan failure event.
> +    minItems: 2
> +    maxItems: 3

Constraints cannot be flexible. You need allOf:if:then: block to narrow
them per variant.

Best regards,
Krzysztof


