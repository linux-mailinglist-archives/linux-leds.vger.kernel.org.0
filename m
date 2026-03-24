Return-Path: <linux-leds+bounces-7459-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJhPI7DZwWmJXQQAu9opvQ
	(envelope-from <linux-leds+bounces-7459-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 24 Mar 2026 01:24:16 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EA48B2FFA19
	for <lists+linux-leds@lfdr.de>; Tue, 24 Mar 2026 01:24:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5424C312B1CB
	for <lists+linux-leds@lfdr.de>; Tue, 24 Mar 2026 00:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57FFA2343BE;
	Tue, 24 Mar 2026 00:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="sZ662905"
X-Original-To: linux-leds@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDEC2248B9;
	Tue, 24 Mar 2026 00:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311489; cv=none; b=FHGG6eCcS/dpNQ5YSQRgJpKi++jvx+D8B7ZW6RflkGmsZkWHc+olcGAx8NLyF9JH7eXAUndqaDzufLwFRAr1HRIrGvylwi0/9sTtYYJ9VJkFpMT74camBgDEIF8cRc5qQ7lU5QPXggGPFZdv+kz6ARDSup9yzTB+NyyfL7WfR2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311489; c=relaxed/simple;
	bh=orAPuInm4zLrdumPOA24e1Op/6f0xyztBgvPPT5KutA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S7AAOtAJBi/bB4yGgRDv6ghYoSUmTS8v7yp0wvxmU4yg368YGoxl+F5xX/QCdDqasRb1B/ctSuTB+6zMAx2YVKgwuJ1z9xuyylKD4CSP8goDgHsrZQZuJoWW7SPMQhliLmCe3N0n33U1n8gvgCjjg2W6/jNlgx5tyvnA+sDShoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=sZ662905; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MSX287mEj1PJ0+XbuTwc2jwqBFKpfZ05vKNTdfaTtl4=; b=sZ6629058AagkkFpPjIjx6Cghk
	K9W+B1mGljVY0+QGbgArajLwE1zhg89Swm31V/nmbkqUtcRr+qRgUnIq/wFde9SAvZon5yHXMCR3R
	swwp20keUYq/Qyzmf9poS31TdRaJBaz68aWG2vueLZDl/FBclewi7+23aK7ar1tkRgxAV7ivvQu/9
	tfJAb9Ys+E/NFEGFipZsb6C8HnMelzE0+RLVxF1RYRtBPHr9sNnSPa9nIxfS2ConDfzlsGqr8n/rA
	OBj1uUMIjrahpkwOvhnfq4TBw95ZrW1smdWB4yy/WSqoZcHSvxH3Q9/KkKy2C/QYibzUfvne6lgLf
	kgeUMN4g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60384)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w4pSt-0000000016k-1WXx;
	Tue, 24 Mar 2026 00:17:47 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w4pSo-000000004XZ-45Va;
	Tue, 24 Mar 2026 00:17:43 +0000
Date: Tue, 24 Mar 2026 00:17:42 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Mark Brown <broonie@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Peter Rosin <peda@axentia.se>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-spi@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-fpga@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH 04/10] regulator: of: switch to using
 class_find_device_by_fwnode()
Message-ID: <acHYJvbSZVPldSCU@shell.armlinux.org.uk>
References: <20260322-remove-device-find-by-of-node-v1-0-b72eb22a1215@gmail.com>
 <20260322-remove-device-find-by-of-node-v1-4-b72eb22a1215@gmail.com>
 <360a8b4a-6507-417a-9fc1-c53b14868657@sirena.org.uk>
 <acGFksyx3SA0kJ5b@google.com>
 <7d46803e-b285-4e9c-8856-10100fa0ea85@sirena.org.uk>
 <cf92122d-6b15-458a-bf89-189a0a6874f7@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf92122d-6b15-458a-bf89-189a0a6874f7@lunn.ch>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7459-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,axentia.se,intel.com,linuxfoundation.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-leds@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.982];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,armlinux.org.uk:url,shell.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: EA48B2FFA19
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 09:01:47PM +0100, Andrew Lunn wrote:
> On Mon, Mar 23, 2026 at 07:05:13PM +0000, Mark Brown wrote:
> > On Mon, Mar 23, 2026 at 11:28:27AM -0700, Dmitry Torokhov wrote:
> > > On Mon, Mar 23, 2026 at 02:00:43PM +0000, Mark Brown wrote:
> > 
> > > > The regulator API is very deliberately specifically using the OF APIs,
> > > > not the ACPI APIs, since ACPI really doesn't want to model regulators.
> > 
> > > For now? We also have software nodes and maybe we come up with something
> > > else in the future...
> > 
> > > I think we should use firmware-agnostic APIs as much as possible, and
> > > only use OF- or ACPI-specific ones when there is no generic equivalent.
> > > This makes the code most flexible.
> > 
> > I think this is a worrying idea for core code like this, we have
> > specific firmware bindings for specific firmware interfaces with the
> > different interfaces having very different ideas of how things should be
> > modelled.  The chances that firmware agnostic code is going to do the
> > right thing seem low, and encouraging the use of generic APIs that might
> > happen to run OK raises the risk that we'll get firmware vendors relying
> > on them and leaving us with a conceptual mishmash to sort through.
> 
> How do you handle deprecated OF properties? This is a problem i've run
> into before. A developer needs an ACPI binding, so they blindly
> convert from of_ to device_ without engaging brain. As a result, they
> bring all the deprecated OF properties we want to die into the brand
> new ACPI bindings.
> 
> A agree with Mark here. OF != ACPI, and anything which makes it appear
> they are the same is just going to lead developers down the wrong path
> and increase Maintainers work pointing out all the problems.

That's three who agree.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

