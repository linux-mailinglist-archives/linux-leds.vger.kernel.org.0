Return-Path: <linux-leds+bounces-6636-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC8BD18ED5
	for <lists+linux-leds@lfdr.de>; Tue, 13 Jan 2026 13:52:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3714A3137794
	for <lists+linux-leds@lfdr.de>; Tue, 13 Jan 2026 12:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA1B638FEE8;
	Tue, 13 Jan 2026 12:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aoompz+7"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C9B38F94A;
	Tue, 13 Jan 2026 12:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768308059; cv=none; b=SZerxjX5p12F2UHYaMjAA0VdOntbwkzIrvsvEIJnk1ZsOMLi/5fYDpuKrHc6KX4zC2owW1E1axA57s5F/mkIwLlWvxsI2h5ceUml0ZGaB1TppqiBKiLAdIPd0Wk+9BM6aUvoyydQCni0QuWDUXKAcFQJDwDk5YZCnVt7mh6OEoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768308059; c=relaxed/simple;
	bh=M7burtfJlClOlU3DcfcIqf7/Ur1TzdjES5S11p9zNs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M2AroSwuAHOKtYwOadtUpxwC3k09BD0EgHdK1pcFPJrXMQMOFg3/Zo6WgAzsIN8UUNGmIz9UpEyv+LrUoAycJLywdb3HnrqmMUF46VqwEpGaPg7khbVW+7CnNTlAi0gY9nRNzAhCt0+3n2+fh10gu+JaZ05oQJaz3fDPRqOzkUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aoompz+7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81D49C116C6;
	Tue, 13 Jan 2026 12:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768308059;
	bh=M7burtfJlClOlU3DcfcIqf7/Ur1TzdjES5S11p9zNs4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aoompz+7ntCp25xkW0wQnxzLMW2PnBW/G7A1gi6p37Zju6fbQhq/sMDsd+yI6ixzs
	 8SSNgUl879NzoUfWSDZwbHx8VOei6brQouUXzoZ3Vwfir40ZxxA6pk5hR3hllcRSYI
	 NJAaPL85RwPhDzhkVl1LPhx+6+chQCpXu/vGVw6c2F4FiVSQGeZY0q9+7e8vc6mlgv
	 xeI4vhnewP7/Sw8p3MOsq9AOXvLB0dNtosO8+Oan75SsDZq53iPVdHl8b6rjcb/+Ae
	 X1syMf/3O1FIQ9t6L99ZflHD3HeQRcMLUhUAcmIjoEVdQ7j+JFkTbDRehfciI5epxf
	 4lkQZivlFwpIw==
Date: Tue, 13 Jan 2026 12:40:53 +0000
From: Lee Jones <lee@kernel.org>
To: Nam Tran <trannamatk@gmail.com>
Cc: pavel@kernel.org, gregkh@linuxfoundation.org, rdunlap@infradead.org,
	christophe.jaillet@wanadoo.fr, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v21 0/3] leds: add new LED driver for TI LP5812
Message-ID: <20260113124053.GA2842980@google.com>
References: <20260111135519.28112-1-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260111135519.28112-1-trannamatk@gmail.com>

On Sun, 11 Jan 2026, Nam Tran wrote:

> This patch series adds initial support for the TI LP5812,
> a 4x3 matrix RGB LED driver with autonomous engine control.
> This version provides a minimal, clean implementation focused
> on core functionality only. The goal is to upstream a solid
> foundation, with the expectation that additional features can
> be added incrementally in future patches.
> 
> The driver integrates with the LED multicolor framework and
> supports a set of basic sysfs interfaces for LED control and
> chip management.
> 
> Signed-off-by: Nam Tran <trannamatk@gmail.com>

Still does not apply - which branch did you rebase this to?

---

Applied patch Documentation/devicetree/bindings/leds/ti,lp5812.yaml cleanly.
Applied patch MAINTAINERS cleanly.
warning: squelched 137 whitespace errors
warning: 142 lines add whitespace errors.
Falling back to patching base and 3-way merge...
Auto-merging MAINTAINERS
No changes -- Patch already applied.
Applying: leds: add basic support for TI/National Semiconductor LP5812 LED Driver
Using index info to reconstruct a base tree...
M	MAINTAINERS
M	drivers/leds/rgb/Kconfig
M	drivers/leds/rgb/Makefile
Checking patch MAINTAINERS...
Checking patch drivers/leds/rgb/Kconfig...
Checking patch drivers/leds/rgb/Makefile...
Checking patch drivers/leds/rgb/leds-lp5812.c...
Checking patch drivers/leds/rgb/leds-lp5812.h...
Applied patch MAINTAINERS cleanly.
Applied patch drivers/leds/rgb/Kconfig cleanly.
Applied patch drivers/leds/rgb/Makefile cleanly.
Applied patch drivers/leds/rgb/leds-lp5812.c cleanly.
Applied patch drivers/leds/rgb/leds-lp5812.h cleanly.
Falling back to patching base and 3-way merge...
error: Your local changes to the following files would be overwritten by merge:
	MAINTAINERS
	drivers/leds/rgb/Kconfig
	drivers/leds/rgb/Makefile
Please commit your changes or stash them before you merge.
error: The following untracked working tree files would be overwritten by merge:
	drivers/leds/rgb/leds-lp5812.c
	drivers/leds/rgb/leds-lp5812.h
Please move or remove them before you merge.
Aborting
error: Failed to merge in the changes.
Patch failed at 0002 leds: add basic support for TI/National Semiconductor LP5812 LED Driver

-- 
Lee Jones [李琼斯]

