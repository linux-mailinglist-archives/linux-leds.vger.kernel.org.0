Return-Path: <linux-leds+bounces-7126-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBLfH2+7qmmiVwEAu9opvQ
	(envelope-from <linux-leds+bounces-7126-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 06 Mar 2026 12:33:03 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E449421FB2E
	for <lists+linux-leds@lfdr.de>; Fri, 06 Mar 2026 12:33:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E13F63019052
	for <lists+linux-leds@lfdr.de>; Fri,  6 Mar 2026 11:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8501827B343;
	Fri,  6 Mar 2026 11:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EOUVZhfU"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62726273803
	for <linux-leds@vger.kernel.org>; Fri,  6 Mar 2026 11:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772796746; cv=none; b=XkSFmmZKjXCuyK/QzNJIvCEykandggSBlKyDTdSXEMR1DMkGl5ig5wzhWVwrB4R1fnwuk90oIy5nbkfMBUN+Ko3XI68y0W8eXQR0DhDD4UVdo6XAiQDVh90Z20NJKIXB02OYRpBgVffAd8LF4U3DnH10pw7cF2O4b0lZLBFqSJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772796746; c=relaxed/simple;
	bh=ze8UGvxgmXBJBZvoVM5cZ5bIqoD3x9eqbFCPcoWbC1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kx6Y92rhIknTFIUqdnZWg9i3Uu7x4s/u8PnLdz/Onxu4zzw3319ChTpEWDcM7suSKNrqB+mhj8lBIfXqMOFpQMb5kHtT7/QXjzFhsdrCxcJcaZCmtUKgQuj6Rqoa1z1One8PIvbIFkUYUaQtWePP1vC9SfKo9wq5P6BCp4DQwTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EOUVZhfU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74504C4CEF7;
	Fri,  6 Mar 2026 11:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772796746;
	bh=ze8UGvxgmXBJBZvoVM5cZ5bIqoD3x9eqbFCPcoWbC1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EOUVZhfU+HQ4OltB8x0hM09npM9yFJxVnvqjNOwdp+JKkokvjsh8WV6F2RhIPhx4R
	 96Dw/PqqykCpc9lVn4akIrOpJm1djAMxDGpWg0blEZdnQCYs/gLoPY3QSmKfqnXEy4
	 3pbn9CiVi8P1xFzrg6utP0cEiQe4H7fDzMzYjqq6GLpCmho39SlS0aCByyJaz5p/W9
	 w7jWMErsYIsSESXb/K2DIkpsvMH5e9SV9g1XZh41AwmJrX4XuXutAnWCTLpHTJ1OG6
	 12j7OQ0xw8puV7GXspT/6EX8YQKAZOHoB4WO3IGkAbA+i/toc6cdDz3I4vGdnJe+6y
	 BLIiY8QSH+FUg==
Date: Fri, 6 Mar 2026 11:32:21 +0000
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Michael Tretter <m.tretter@pengutronix.de>,
	Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
	kernel@pengutronix.de, Thorsten Schmelzer <tschmelzer@topcon.com>
Subject: Re: [PATCH] leds: led-class: detect brightness conversion base from
 string
Message-ID: <20260306113221.GI183676@google.com>
References: <20260123-leds-class-convert-brightness-value-v1-1-ae9d3ae4224b@pengutronix.de>
 <aamLXuyzEiqJGDtu@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aamLXuyzEiqJGDtu@black.igk.intel.com>
X-Rspamd-Queue-Id: E449421FB2E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7126-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Thu, 05 Mar 2026, Andy Shevchenko wrote:

> On Fri, Jan 23, 2026 at 10:57:26AM +0100, Michael Tretter wrote:
> > From: Thorsten Schmelzer <tschmelzer@topcon.com>
> > 
> > sysfs-class-led doesn't specify the number format for the brightness,
> > but the class only accepts base 10 numbers.
> > 
> > Use the automatic base detection of kstrtoul and accept the brightness
> > as hex value as well.
> 
> This obviously brings a regression.
> Previously the 000000000000100 is 100, now it's 64.
> 
> While I don't care much (I even like the change), I have to point this out.
> 
> The correct fix is to update documentation.

Again, should we remove this patch that you like?

-- 
Lee Jones [李琼斯]

