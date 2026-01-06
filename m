Return-Path: <linux-leds+bounces-6539-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F62BCF9891
	for <lists+linux-leds@lfdr.de>; Tue, 06 Jan 2026 18:07:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BEE83043F36
	for <lists+linux-leds@lfdr.de>; Tue,  6 Jan 2026 16:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5B14237713;
	Tue,  6 Jan 2026 16:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b9n4aZTO"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93501ADC97;
	Tue,  6 Jan 2026 16:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767718788; cv=none; b=FBoW5CLdf/rWdh42L2LjDLMi6e3nXmeAedzK1nPBJb/CTvIUnQOWCJ9/fwj0j9QJ7XjF2T52/0uA7ppOWMQWygsoY5c6Lbrzw4zsZUzRnfmaB1k0Ymt2TbGt9mqZu65THZT/3xlvVtb1xzD6Z9KM72wxmztD2s+cv/9EzllCS8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767718788; c=relaxed/simple;
	bh=CE2A9W2NClgjVaiRi81sJ67cEM/qS/UBt8uUqINi6+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c0+AhXXx7JzCxaPAWMXGQy3TDMbnWF18UrQzftJp2tvrof8eqpHESk62ExLlEmi1588bu11CH5YBPpZ3G0gk81j8ellNEBUsP+1+JnCr4zwWr01rz2f2BF5p8WCxmV6DGcdK1v9oiPvKpm6RhwLmEXoeidGNZN6tHMj+V8Mu+m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b9n4aZTO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27790C116C6;
	Tue,  6 Jan 2026 16:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767718788;
	bh=CE2A9W2NClgjVaiRi81sJ67cEM/qS/UBt8uUqINi6+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b9n4aZTOxJvpd9Yp8i5/YRGn1btueTxHt40OlVBz4JktIIzYwwDgUUZk0Mg6RNR+f
	 kJsstNUW6W20ocPbyre8EauK/0GWfQS4AQ90Rf9pmv0Ujmi8TR/LGZTjZxnXCHwYt2
	 54PTeRMu+lUwnxTX8pc+E0eRoVoBXjOnmMR4A8bjHO83cb52AYF2q0mauBwKnU5DeY
	 tSVQtjEMCYwzNj5wyEUCbKi+Y8VgyQM3g/GRnzBFvzo+StmJ5k51bLqbTL2G1rFv+h
	 nwT33YwCAWtCcquQYi8aBt1j1dtIvC2BW25PNCa7jtaQ5aVEFZKc7SLiVFfXp0fyBY
	 S0OkQWjk1ggGg==
Date: Tue, 6 Jan 2026 10:59:47 -0600
From: Rob Herring <robh@kernel.org>
To: Jonathan Brophy <professorjonny98@gmail.com>
Cc: lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Andriy Shevencho <andriy.shevchenko@linux.intel.com>,
	Jonathan Brophy <professor_jonny@hotmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v5 0/7] leds: Add virtual LED group driver with priority
 arbitration
Message-ID: <20260106165947.GA2233601-robh@kernel.org>
References: <20251230082336.3308403-1-professorjonny98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230082336.3308403-1-professorjonny98@gmail.com>

On Tue, Dec 30, 2025 at 09:23:13PM +1300, Jonathan Brophy wrote:
> From: Jonathan Brophy <professor_jonny@hotmail.com>
> 
> This patch series introduces a new LED driver that implements virtual LED
> groups with priority-based arbitration for shared physical LEDs. The driver
> provides a multicolor LED interface while solving the problem of multiple
> subsystems needing to control the same physical LEDs.
> 
> Key features:
> - Winner-takes-all priority-based arbitration
> - Full multicolor LED ABI compliance
> - Two operating modes (multicolor and standard/fixed-color)
> - Deterministic channel ordering by LED_COLOR_ID
> - Comprehensive debugfs telemetry (when CONFIG_DEBUG_FS enabled)
> - Optimized memory footprint (~200 bytes per LED in production builds)
> 
> Use cases:
> - System status indicators with boot/error/update priority levels
> - RGB lighting with coordinated control
> - Multi-element LED arrays unified into single logical controls

I still don't really understand what you are trying to do. You need to 
tell a story not just some bullet lists. What is it you want to do that 
you can't currently support. I would start from the top level. What do 
you need to be able to do from userspace. Describe what you need to do 
not in terms of "here's how I solved/implemented it" but what does the 
current interface lack. IOW, define the problem in a way we can provide 
alternate solutions.

I see "virtual" and that screams "doesn't belong in DT" to me. I assume 
there is some physical property of why certain LEDs are grouped 
together. Convince me that the board designer would define 
the grouping rather than the user running Linux. Multi-color LEDs are 
physically packaged together for example, so defining in DT makes sense.

If you can split this up into smaller series/features, that would help 
with your upstreaming. Otherwise, it looks like a huge pile to 
try to understand and we'll likely just move on to other series which 
are easier to review.

Rob

