Return-Path: <linux-leds+bounces-6632-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B47B4D18957
	for <lists+linux-leds@lfdr.de>; Tue, 13 Jan 2026 12:53:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1A52E30022F2
	for <lists+linux-leds@lfdr.de>; Tue, 13 Jan 2026 11:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 322BC36C0D7;
	Tue, 13 Jan 2026 11:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OT6Aadk/"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3B02FC876;
	Tue, 13 Jan 2026 11:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768305178; cv=none; b=ccNAaVyZHM4aGpD7LCeQSTHL09ua425Mqz6pxrXExpj4dL5Xq+imfTpA5hMGtT+uR50hME3mrqlRXhXj9XMJzSw3hqKoWz7YsP27rU0nxJtdRARLedLBGNGBg8jZD9muc1p98MVLAwyA0UsDT/0cr72gGNRRvbvi6DjF8GV8oD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768305178; c=relaxed/simple;
	bh=UQEM/XvXI8Xk8lLCq8C4OJydTEi187TCloJpzXczboU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pYUGs3TMTaUG6o97tyjOxl2JEWDzPKAqZBpRaiFlghYob9LqQ2QjlccoxuE3so0qbItkQY6XIMcN+g4yuVxBTOZpYqlT9qTLA8VUSzoEcf9s+k9vLb6G76Q1ACOOwkWhlArf/O56xgutMXeBWHjjKnikpIYl9+X60AM3saOqMxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OT6Aadk/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20797C116C6;
	Tue, 13 Jan 2026 11:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768305177;
	bh=UQEM/XvXI8Xk8lLCq8C4OJydTEi187TCloJpzXczboU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OT6Aadk/qp/RPedcR4RhV9X/ApqPi85FbiPoRG4sDuzYxYOMBX9FQZs0mya4FV0oB
	 kmA8+hnZeSw4yVozcWDgNjvHX4w4lvIDCHhnLbqrXMtjyHEvJbWnVtEsdGzwL7STI+
	 E+6hdXlYx1FdrBzzTKKrEdYzyZJA2l3zX+Hl4gs6UBHR0TJ9e6hm6gpAi6GPSdOzOu
	 zPFfRwwKCYTwHYT6VvYY3fuagr4ncIAZWG2iwKlK7wT6fX5HbY3HhNqeHO7nQcDNs9
	 e363QLncptm7khIPkFmN+Qgbc42ha0uWECuSqo2Z/CDBPC8Nh9wLc5PkmAezThll1V
	 P6QVCENdn5TWA==
Date: Tue, 13 Jan 2026 11:52:52 +0000
From: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Jonathan Brophy <professorjonny98@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Andriy Shevencho <andriy.shevchenko@linux.intel.com>,
	Jonathan Brophy <professor_jonny@hotmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v5 0/7] leds: Add virtual LED group driver with priority
 arbitration
Message-ID: <20260113115252.GF1902656@google.com>
References: <20251230082336.3308403-1-professorjonny98@gmail.com>
 <20260106165947.GA2233601-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260106165947.GA2233601-robh@kernel.org>

On Tue, 06 Jan 2026, Rob Herring wrote:

> On Tue, Dec 30, 2025 at 09:23:13PM +1300, Jonathan Brophy wrote:
> > From: Jonathan Brophy <professor_jonny@hotmail.com>
> > 
> > This patch series introduces a new LED driver that implements virtual LED
> > groups with priority-based arbitration for shared physical LEDs. The driver
> > provides a multicolor LED interface while solving the problem of multiple
> > subsystems needing to control the same physical LEDs.
> > 
> > Key features:
> > - Winner-takes-all priority-based arbitration
> > - Full multicolor LED ABI compliance
> > - Two operating modes (multicolor and standard/fixed-color)
> > - Deterministic channel ordering by LED_COLOR_ID
> > - Comprehensive debugfs telemetry (when CONFIG_DEBUG_FS enabled)
> > - Optimized memory footprint (~200 bytes per LED in production builds)
> > 
> > Use cases:
> > - System status indicators with boot/error/update priority levels
> > - RGB lighting with coordinated control
> > - Multi-element LED arrays unified into single logical controls
> 
> I still don't really understand what you are trying to do. You need to 
> tell a story not just some bullet lists. What is it you want to do that 
> you can't currently support. I would start from the top level. What do 
> you need to be able to do from userspace. Describe what you need to do 
> not in terms of "here's how I solved/implemented it" but what does the 
> current interface lack. IOW, define the problem in a way we can provide 
> alternate solutions.

I'm inclined to agree.

Describe the problem in detail and give proper real-world examples.

> I see "virtual" and that screams "doesn't belong in DT" to me. I assume 
> there is some physical property of why certain LEDs are grouped 
> together. Convince me that the board designer would define 
> the grouping rather than the user running Linux. Multi-color LEDs are 
> physically packaged together for example, so defining in DT makes sense.

Same.  Drop the virtual keyword here since (I think) you are actually
describing the grouping of real hardware, which isn't virtual at all.

Full disclosure, I'm dropping this set for now.

I look forward to your next submission.

-- 
Lee Jones [李琼斯]

