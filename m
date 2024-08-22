Return-Path: <linux-leds+bounces-2505-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C54CB95B032
	for <lists+linux-leds@lfdr.de>; Thu, 22 Aug 2024 10:26:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3A121C236C6
	for <lists+linux-leds@lfdr.de>; Thu, 22 Aug 2024 08:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE30716DEBB;
	Thu, 22 Aug 2024 08:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V9Rx22Ec"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F6416DEB2
	for <linux-leds@vger.kernel.org>; Thu, 22 Aug 2024 08:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724315096; cv=none; b=YTEsU8P1LE6R0TSicKLUy+zmz4p1XFOeoB4T3JMkvZxrTa/QBdMzaXo7FBe1Owb4wGVUMPqVFHLUkZIcHwn2tBh0menbzvC/uqDx6gmD/YICEz75X2mQgZmtlavTQQhkzRcWajsX1kpgYP2GXLcUf1cPRsSPEuqRt1d5WVVWWW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724315096; c=relaxed/simple;
	bh=P8Bfe0HabBZqRiZFz5oL57i9cxP60g/IYlsv+YTce0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bWbQX5CFTF0XvQUEMgf2+pXYmIRQHcDFKAONg3zAFUJcBwtqLuGZnsLELCGWc1DIVTk86AJfzdMI22RXjJBd1N76dLEozn/YxPUlaLOcsKGuHSPydiI7gC4PbdgTWGoeiqWbn12Hqh93q+bThkWDbVbbmB5oZWEfsgGvdxt816w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V9Rx22Ec; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77E9CC4AF09;
	Thu, 22 Aug 2024 08:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724315096;
	bh=P8Bfe0HabBZqRiZFz5oL57i9cxP60g/IYlsv+YTce0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V9Rx22EcXGMy4fwl9oEHEdx54VIfWtpgnWd0gWXQWte8XNPPmogRhk8BKLTW2nykr
	 4Cjy673YV5T6Wepp6RZVsIjVv7FgOob8IdlBy4r4qba+WU6fbCj+zDczgchOs1229c
	 GdvZNQD8zqa5NLgYtOqS2trrUfN5eK91khlgYEYgN35ksbdpxLlmQjTLL+QCLbhGy9
	 KG4VF6uN55ge4YI6da9bIoZ5e+AVbntWqWklyp56XC/G+riWW159PxvUJkHLYAreyO
	 1fzqs2kdTeIwu51iUIQBn5quspMKYQFFOGLb3lsGGM9VIeoddbfDCRwApcxAGBnmvo
	 t+Q28GKLFw65Q==
Date: Thu, 22 Aug 2024 09:24:52 +0100
From: Lee Jones <lee@kernel.org>
To: FUKAUMI Naoki <naoki@radxa.com>
Cc: linux-leds@vger.kernel.org, pavel@ucw.cz
Subject: Re: [PATCH] leds: pwm-multicolor: fix multicolor PWM LED lights up
 without any setting
Message-ID: <20240822082452.GE6858@google.com>
References: <20240816102626.826-1-naoki@radxa.com>
 <20240821161119.GC6858@google.com>
 <A85312FB70235D56+bd5fad03-36bf-4df9-ad44-7f7eaa7b2aa9@radxa.com>
 <7DDC06B563854ED8+65e7204f-76df-4f36-8544-bede36a519fd@radxa.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7DDC06B563854ED8+65e7204f-76df-4f36-8544-bede36a519fd@radxa.com>

On Thu, 22 Aug 2024, FUKAUMI Naoki wrote:

> Hi,
> 
> On 8/22/24 06:26, FUKAUMI Naoki wrote:
> > Hi,
> > 
> > On 8/22/24 01:11, Lee Jones wrote:
> > > On Fri, 16 Aug 2024, FUKAUMI Naoki wrote:
> > > 
> > > > from drivers/leds/leds-pwm.c:led_pwm_set(),
> > > > 
> > > > /*
> > > >   * Disabling a PWM doesn't guarantee that it emits the inactive level.
> > > >   * So keep it on. Only for suspending the PWM should be
> > > > disabled because
> > > >   * otherwise it refuses to suspend. The possible downside is that the
> > > >   * LED might stay (or even go) on.
> > > >   */
> > > > 
> > > > do the same in led_pwm_mc_set().
> > > > 
> > > > this fixes LEDs light up without any setting (i.e. brightness is 0) on
> > > > Radxa E25.
> > > 
> > > Please redraft the commit message into proper sentences, complete with
> > > correct grammar.  All sentences should start with an uppercase char.
> > 
> > Thank you for your review!
> > 
> > I'll do it in next ver.
> > 
> > > Copying comment-blocks into commit messages to save authors from writing
> > > one isn't really the done thing.
> > 
> > Sorry, I could not understand this part. What should I do for this?
> 
> I (probably) understand what you said. I need to explain detail in my own
> words and use correct English.
> 
> unfortunately my knowledge about electrical circuits and English is not
> sufficient for now.
> I need some time to learn some things for writing "why my fix is correct".
> 
> then, I will not be able to send v2 so soon. if someone who understand well
> about this problem and the fix, feel free to reuse my patch (or make better
> patch).

You understood enough to read the comment and realise that it was
related.  Simply reword the comment block that you copied and pasted to
explain why this is also relevant to your device.

This is the sort of thing that AI might be able to help you with.

-- 
Lee Jones [李琼斯]

