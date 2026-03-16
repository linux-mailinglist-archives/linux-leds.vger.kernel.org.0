Return-Path: <linux-leds+bounces-7353-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 45MrKJSkt2m7TwEAu9opvQ
	(envelope-from <linux-leds+bounces-7353-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 16 Mar 2026 07:35:00 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 391212952F2
	for <lists+linux-leds@lfdr.de>; Mon, 16 Mar 2026 07:35:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1821F3039832
	for <lists+linux-leds@lfdr.de>; Mon, 16 Mar 2026 06:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AA7F34B404;
	Mon, 16 Mar 2026 06:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="u/1E1zCu"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098FC13635C;
	Mon, 16 Mar 2026 06:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773642827; cv=none; b=rW3qvpHpWBhyGH+WnhsCla1xTgW+wq/ag/lcERJ+piC6oirQ6rk8RhAZU1V2xtpv2z3wgwzvN0xR5O9SqHWlNGDHYBEBmSm0fXt2iLRCxRCR1U5CeDy7Bcqu3Gl/+//kbgK7RDyDQTxlIasrGQ/APoKXmdwcp4nzxvXFrUcFdzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773642827; c=relaxed/simple;
	bh=Dkywfmgei82k5odcdPZZ4qCI+IO8bBIHlMkgGEm1yaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PGiaIbkLmFvTcOM/tRjvmUONmkUKFf9avfES0LBkF/bRFUm/8KyAQxdUmuCwuv+P8r1ehwFsivjLeekHTFMf7+NbTCOSbqNNOzwFl3Ur3OAxUBFh39s+XQYrR0pS1y4c3jm3XCcxT2WZmiwAdbbay6ONwKbG/3ryfK7ZxFci4o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=u/1E1zCu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01E4AC19421;
	Mon, 16 Mar 2026 06:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773642826;
	bh=Dkywfmgei82k5odcdPZZ4qCI+IO8bBIHlMkgGEm1yaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u/1E1zCuDFBmUxj6jlulcq5x7vGGg1pSKluyGzbaTq1hNC0vjLMjjjBFGmjy7dRSp
	 bqzdhrUsgTO2wOBTyffXfmmz18F8O1QHBopO3c+i2IaFw/KsN8ItO4FRaI8jiBVKtw
	 ltEmDCgBGBdfUlISTQ4sVc8lEqChh7wNXZhyj+8g=
Date: Mon, 16 Mar 2026 07:33:28 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Markus Probst <markus.probst@posteo.de>,
	Markus Probst via B4 Relay <devnull+markus.probst.posteo.de@kernel.org>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Igor Korotin <igor.korotin.linux@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
	Robert Moore <robert.moore@intel.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	driver-core@lists.linux.dev, linux-pci@vger.kernel.org,
	linux-leds@vger.kernel.org, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: Re: [PATCH v3 7/7] leds: add synology microp led driver
Message-ID: <2026031645-unplowed-purist-9c4b@gregkh>
References: <20260313-synology_microp_initial-v3-0-ad6ac463a201@posteo.de>
 <20260313-synology_microp_initial-v3-7-ad6ac463a201@posteo.de>
 <DH1YH0GO75H8.18YSW2VMKRB3C@kernel.org>
 <39f1c9bb0dbde9f1b60785f8e838289c888ffdb0.camel@posteo.de>
 <DH3KAWWLECYW.3VBH7PIE7ZE20@kernel.org>
 <eb2f7498c5f3247265effc47b3445a04ac71956e.camel@posteo.de>
 <DH3M1023PCBI.1HYYZU93NS1JX@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DH3M1023PCBI.1HYYZU93NS1JX@kernel.org>
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7353-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	FREEMAIL_CC(0.00)[posteo.de,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,collabora.com,intel.com,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-leds,markus.probst.posteo.de,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 391212952F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 15, 2026 at 08:41:06PM +0100, Danilo Krummrich wrote:
> I.e. if we can't (easily) use mfd cells and would need a custom API, then why
> even split it up at all, given that splitting it up would probably the most
> complicated part of the whole driver.
> 
> Greg, what do you think?

I think this has yet to be proven to be a kernel driver at all at this
point, and not just a userspace daemon that listens to the serial port
and then does what is needed from there :)

Or, if someone can prove that the operations on this serial data stream
actually do require it to be in the kernel (which I have yet to see a
list of what this connection does, did I miss it?) then a single driver,
under the drivers/platform section of the kernel tree makes sense.

thanks,

greg k-h

