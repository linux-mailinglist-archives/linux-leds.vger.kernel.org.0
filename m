Return-Path: <linux-leds+bounces-7595-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOXiGEfOyml3AAYAu9opvQ
	(envelope-from <linux-leds+bounces-7595-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 30 Mar 2026 21:25:59 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DD00836052D
	for <lists+linux-leds@lfdr.de>; Mon, 30 Mar 2026 21:25:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 317F730398A5
	for <lists+linux-leds@lfdr.de>; Mon, 30 Mar 2026 19:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC1F1397E82;
	Mon, 30 Mar 2026 19:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W/oGHeMz"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6006396D35;
	Mon, 30 Mar 2026 19:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774898531; cv=none; b=ZfjVgu90FH3iSKA5AKasJeTizgl/Z7U1VXsYwfmZdWiu0DmcH3lF+BZWSAaf0G8uvEudzkMdtC7rQJIMwP7GoPFLNjCPTtDqdjdCWizO7h+64w71jAWoZdExw9hHbX9niWp0a3y7JZv9vq2R5rFCVj/4mBBV6lPiP3RLJY+v0eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774898531; c=relaxed/simple;
	bh=rviqdqwvEnDdhKp4lCEUAH6CRyr6KP/+ngSngOlJJtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f4K4vQ5p2wKyaq7t0SsCig5x+KCuWCFNv7Ixu8DgKBMq1R21SxSEabWNhGYZ45oWL1VjtQLEPwridMhFTP51vO8ucv68QusZnwL+qdeackyrx/VpmZs3qlm52LoMqW/UquN5vtNpelvxC5SiAWg1XAQ1iaTGVsY3dYOiKYyYjSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W/oGHeMz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08984C4CEF7;
	Mon, 30 Mar 2026 19:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774898531;
	bh=rviqdqwvEnDdhKp4lCEUAH6CRyr6KP/+ngSngOlJJtE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W/oGHeMzSEZs6mrxFN3BKzHYL+EGlaFDpfUxx9aPsnDCcyyeX9jxbR4mYa6IMB7Cz
	 RmYSot5MkKbNTaB5rBeH4xSgKlZJZbS5BWGNIJLwBmAP5hcHd4+XVVPnAE+KGgChvH
	 uusl5xi5Z+q4+j7P43jcIhLWxOFfiUPlW/MdQ2HZHis4BRkiN+kddM0EzoGpUMz2mz
	 /2Ib3LtGKboJKHcAvlOhaGx7wAqJz9DAzLD0qusVd2vluatlXngzinYupMqV7hxQJc
	 yOi92bA5pKNcR70JyyYvftCFytA5ckoVcNadwrf/ELJaT/WlVrZJ3nJ3Rb1p6YRu/r
	 kQojAChk4zQqg==
Date: Mon, 30 Mar 2026 14:22:07 -0500
From: Rob Herring <robh@kernel.org>
To: Markus Probst <markus.probst@posteo.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
	platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v5 2/4] ACPI: of: match PRP0001 in of_match_device
Message-ID: <20260330192207.GA3097402-robh@kernel.org>
References: <20260329-synology_microp_initial-v5-0-27cb80bdf591@posteo.de>
 <20260329-synology_microp_initial-v5-2-27cb80bdf591@posteo.de>
 <20260330-bipedal-invaluable-slug-0c6dea@quoll>
 <e4b194028dcf25b943438615a83bce68b0949e5f.camel@posteo.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4b194028dcf25b943438615a83bce68b0949e5f.camel@posteo.de>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linaro.org,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-7595-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DD00836052D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 07:04:21PM +0000, Markus Probst wrote:
> On Mon, 2026-03-30 at 09:00 +0200, Krzysztof Kozlowski wrote:
> > On Sun, Mar 29, 2026 at 08:02:16PM +0200, Markus Probst wrote:
> > > Export `acpi_of_match_device` function and use it to match for PRP0001
> > > in `of_match_device`, if the device does not have a device node.
> > > 
> > > This fixes the match data being NULL when using ACPI PRP0001, even though
> > > the device was matched against an of device table.
> > 
> > Fixes tag?
> > 
> > I don't see how this is going to fix !ACPI case - the
> > acpi_of_match_device() will just return false.
> While trying to argue I found out that there already is
> `device_get_match_data`, which takes PRP0001 into account.
> 
> I will now instead make a patch, which will make rust use this function
> instead of calling `of_match_device` and `acpi_match_device`
> individually, which ignores PRP0001.

IIRC, the rust binding already gives you the data pointer in probe.

> There are still a lot of drivers only using `of_match_device`, which
> makes it impossible to use PRP0001 with them. But this is not relevant
> for this driver.

Usually using of_match_device() in drivers is wrong. You generally just 
want the data pointer. There's a whole bunch of drivers still doing the 
old way.

Rob

