Return-Path: <linux-leds+bounces-6670-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E31B5D3A1E0
	for <lists+linux-leds@lfdr.de>; Mon, 19 Jan 2026 09:42:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBBC83046564
	for <lists+linux-leds@lfdr.de>; Mon, 19 Jan 2026 08:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B0B7345CA3;
	Mon, 19 Jan 2026 08:40:57 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6783F34405B
	for <linux-leds@vger.kernel.org>; Mon, 19 Jan 2026 08:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768812055; cv=none; b=iGutZ0AVTyc4pfdBvPGnBNQQ6xImgO78PT7wwycRrfYxdozk1rGxwk4hrSoNpCJLlTYZRaNT9HSHBnrA3cAdsDI+Duq63m3kco7s76y9wVUc+m+PhCGBOT6dH2VTfgxiTXWLNlXr+NOh7fFHbD6d+UShe4ismzMEAYeKKlLcn2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768812055; c=relaxed/simple;
	bh=XyytnfwG8RbL6j9YUWLQbcewzeaemSgBwG7vjzILPiM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HcVr1+8DGC/S8jLAhudzDByBz6GCR3iUOQxbZHMh1NxVkyU6p9PPxwkMiRw5N4GVEM6ElYMrXNFiuZtvXJWmuMTcKmMrWO/ddrMZA15iTazHWjz7QhvZHW5K2kmMQFWzupxHSZmPeUV2RoZuj/RN3iz7WqOydQ1MshHtFpSCswk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1vhkoW-0007Rg-Ot; Mon, 19 Jan 2026 09:40:44 +0100
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org, Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: Re: [lee-leds:for-leds-next] BUILD REGRESSION
 e257dc532c20bd93f0076c18cb5ffd739a5f0bb4
In-Reply-To: <20260113105722.GC1902656@google.com> (Lee Jones's message of
	"Tue, 13 Jan 2026 10:57:22 +0000")
References: <202601110018.iHp14xac-lkp@intel.com>
	<20260113105722.GC1902656@google.com>
User-Agent: mu4e 1.12.13; emacs 30.2
Date: Mon, 19 Jan 2026 09:40:44 +0100
Message-ID: <87v7gy6lmb.fsf@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org

On 2026-01-13 at 10:57 GMT, Lee Jones <lee@kernel.org> wrote:

Hi Lee,

> +Steffen
> 
> > tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
> > branch HEAD: e257dc532c20bd93f0076c18cb5ffd739a5f0bb4  leds: lp55xx: Simplify with scoped for each OF child loop
> > 
> > Error/Warning (recently discovered and may have been fixed):
> > 
> >     ERROR: modpost: "lp5860_device_init" [drivers/leds/rgb/leds-lp5860-spi.ko] undefined!
> >     ERROR: modpost: "lp5860_device_remove" [drivers/leds/rgb/leds-lp5860-spi.ko] undefined!

hm, I'm not sure I understand why this is happening for some of the defconfigs.

> >     drivers/leds/rgb/leds-lp5860-core.c:72:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
> >     drivers/leds/rgb/leds-lp5860-core.c:72:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
> >

okay. This one is easy. Of course I should return the ret from the regmap_read on error.
Should I send a fixup! for your next-branch or a patch that fixes it?

> >     drivers/leds/rgb/leds-lp5860-spi.c:87:1: sparse: sparse: bad integer constant expression

Looks like a false positive to me. That's the MODULE_AUTHOR line.


Best regards,
Steffen

-- 
Pengutronix e.K.                | Dipl.-Inform. Steffen Trumtrar |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |

