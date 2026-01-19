Return-Path: <linux-leds+bounces-6671-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C44FBD3A74E
	for <lists+linux-leds@lfdr.de>; Mon, 19 Jan 2026 12:47:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78C02309DFA6
	for <lists+linux-leds@lfdr.de>; Mon, 19 Jan 2026 11:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57826314B62;
	Mon, 19 Jan 2026 11:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XsLVFYH0"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1325313551
	for <linux-leds@vger.kernel.org>; Mon, 19 Jan 2026 11:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768822995; cv=none; b=YhUx163M7Zv7d+KHxRy9I7ABvfo9RTZ8qLCuR2QOd6ogRqk5Fa1zaFbLiRUT7UO0GYN46ms5/a6WEXSTp0FYVro/PKy1WALbD/5lgOrPLCF2VaWjx5Upfr2UjdEO5mhG1wlk7ZPjb06ChEl2a0B5kD7EInercFKwTkttCn1Lfao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768822995; c=relaxed/simple;
	bh=+k5ilaCg1lajg4gg0yuUdM3uBkZj5eWPSQAIUxty3Kc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MqUHqV6SURoTmQUpaMVCdjR7Erf1UiFAzSknZFciKgiiiWUQ0V4JJQA0N9SAAW6cil1Kbn5BlkaOtKv5jlKYh4tYGicSD8hZH5o/NZunbQdLo5GtCuVz5qrYQDbT4C1idrQwxjoJsVJa7enYSMRGAG4rlhSg06pohdyX+aM+ras=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XsLVFYH0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2B14C2BC86;
	Mon, 19 Jan 2026 11:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768822993;
	bh=+k5ilaCg1lajg4gg0yuUdM3uBkZj5eWPSQAIUxty3Kc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XsLVFYH0S44jaGnNQwP1Bcswzaf0KzAzWBvsjGC9zPXQ0n2s0X9zIEHyKPV0cbzXy
	 qeMe0JFxASxts5G7qYHm2zXj9PaOA4Z3BaZbgfynWT9RPameentEW1YVu8wqqLJviK
	 jY2cEuppl/pqIP5U0aBciFH7V6X2y+O6tEfh1GvZPS+xGt0QbzvVYlZOQrPp2HeOOX
	 yyuCMx2PiaRgBjKiUBB2PKFq2OofyGVD3XCX5MtyJOWDVrep1CdZ5EMs9bWVUiJynE
	 puH7cYOuI5Bg//JBXFtYk/GqCDRhxqGSJIeSIfwKPhQK0lLhvRZ8WcrochCOl4rP/Z
	 LxMfWdT1llFvA==
Date: Mon, 19 Jan 2026 11:43:09 +0000
From: Lee Jones <lee@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: linux-leds@vger.kernel.org
Subject: Re: [lee-leds:for-leds-next] BUILD REGRESSION
 e257dc532c20bd93f0076c18cb5ffd739a5f0bb4
Message-ID: <20260119114309.GB882947@google.com>
References: <202601110018.iHp14xac-lkp@intel.com>
 <20260113105722.GC1902656@google.com>
 <87v7gy6lmb.fsf@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87v7gy6lmb.fsf@pengutronix.de>

On Mon, 19 Jan 2026, Steffen Trumtrar wrote:

> On 2026-01-13 at 10:57 GMT, Lee Jones <lee@kernel.org> wrote:
> 
> Hi Lee,
> 
> > +Steffen
> > 
> > > tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
> > > branch HEAD: e257dc532c20bd93f0076c18cb5ffd739a5f0bb4  leds: lp55xx: Simplify with scoped for each OF child loop
> > > > Error/Warning (recently discovered and may have been fixed):
> > > >     ERROR: modpost: "lp5860_device_init"
> > [drivers/leds/rgb/leds-lp5860-spi.ko] undefined!
> > >     ERROR: modpost: "lp5860_device_remove" [drivers/leds/rgb/leds-lp5860-spi.ko] undefined!
> 
> hm, I'm not sure I understand why this is happening for some of the defconfigs.
> 
> > >     drivers/leds/rgb/leds-lp5860-core.c:72:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
> > >     drivers/leds/rgb/leds-lp5860-core.c:72:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
> > >
> 
> okay. This one is easy. Of course I should return the ret from the regmap_read on error.
> Should I send a fixup! for your next-branch or a patch that fixes it?

Please sent a follow-up.

-- 
Lee Jones [李琼斯]

