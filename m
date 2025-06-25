Return-Path: <linux-leds+bounces-4882-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC72AE7FA7
	for <lists+linux-leds@lfdr.de>; Wed, 25 Jun 2025 12:38:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D7BE1BC7AE4
	for <lists+linux-leds@lfdr.de>; Wed, 25 Jun 2025 10:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 077F829E0FD;
	Wed, 25 Jun 2025 10:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qjLDR6zA"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4D629E0EB;
	Wed, 25 Jun 2025 10:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750847795; cv=none; b=KopDiGvI7XXJAx4AyX1aJYQfrklOhcGBUjKfcCp6/qR8FUHDvNvtfdJkze+WEn5zH9vTx6yaENWx4Q+kvWkPEnQ8zFHg3ElB6bqCaTDjKGah0eHlfCw9yl20nLulFdkvhx1IHYR/KiIJBFA+tG5ELBC2I/ejRDbjxIZHn0dG2TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750847795; c=relaxed/simple;
	bh=dYa6eaAh9xr3b6d7BvHXBDGX1jqkzejh0NVHRhQAUl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VzlnoA5CvTRTxIUwlGQVRXFiMqKFo4kUimBOSBsaV8Vkr/03gCFoTEDcjgKXeg+pgH7U7oech49YwG10K4EY6izLj8FfxMvGh52NAdj0dM3mUNUWobg+5zCgh0vNRA1keauqnUbr/ss+SXF3+OccsDb9RWTvUicBzhk+/Wru6eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qjLDR6zA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A9ACC4CEEA;
	Wed, 25 Jun 2025 10:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750847795;
	bh=dYa6eaAh9xr3b6d7BvHXBDGX1jqkzejh0NVHRhQAUl0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qjLDR6zAewrVmIxYAFyfkU06WV+hoYuFSttPwwSfo9am/d1q8xZ8/jNKWlYoZW7ol
	 9/WnutbkwCL6jeYUlLE4HUw9/v0dTld6Wdi0/uXl9AlFywsowiRwMkQO6zJBfEbWTf
	 FFVFHablPxONy22hN6RuJUiSHHyt+Lswwrgj3X8+E70RrOg0TW2iCv3NvpoVBlaJCl
	 rI18N/635aMguicwp7yzGIvZzOIM7h/k9McJ98Khsf4ca2QW6YSZV2fDnAUzdQoSAI
	 CTOIgRxc/powotA/ZOR+H5ukQGsjy+QmQGQrvHW17Ysas+pTFA5jvSQNzEDI92ThXE
	 xuFdMzlr6bGlQ==
Date: Wed, 25 Jun 2025 11:36:31 +0100
From: Lee Jones <lee@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Hans de Goede <hansg@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: trigger: ledtrig-cpu:: enforce NR_CPUS limit in
 Kconfig
Message-ID: <20250625103631.GU795775@google.com>
References: <20250620110820.3364008-1-arnd@kernel.org>
 <20250625092450.GT795775@google.com>
 <59044fff-6531-4425-8ccb-e21e17664f26@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <59044fff-6531-4425-8ccb-e21e17664f26@app.fastmail.com>

On Wed, 25 Jun 2025, Arnd Bergmann wrote:

> On Wed, Jun 25, 2025, at 11:24, Lee Jones wrote:
> > On Fri, 20 Jun 2025, Arnd Bergmann wrote:
> >> 
> >> Enforce this limit in Kconfig instead to avoid the build failure.
> >
> > I have so many questions!
> >
> > - This number seems arbitrary - what is the limiting factor?
> >   - Character size for printing?
> 
> That is my best guess, yes. The original commit 8f88731d052d
> ("led-triggers: create a trigger for CPU activity") already
> had this, plus
> 
> #define MAX_NAME_LEN 8
> snprintf(trig->name, MAX_NAME_LEN, "cpu%d", cpu);
> 
> which comes out to 10000 cpus (0 through 9999) in a NUL-terminated
> string. Obviously we could have a higher limit here but would
> technically still need to check that.
> 
> > - What platform did you test this on to blow through that number?
> 
> I was only compile-testing with a crazy number of CPUs, to see
> what would break, in particular when there are per-cpu structures
> or cpumask_t variables on the stack. I sent fixes for the ones
> that broke the build, but don't expect anything to actually
> need this at runtime. Some of the fixes I sent also address
> possible stack overflows that happen with a more realistic
> number of CPUs.
> 
> > - What if we really do want 10000+ CPUs?
> >   - And what will that LED array look like to support them all?
> 
> abcc131292aa ("ledtrig-cpu: Limit to 8 CPUs") actually added a
> runtime limit to eight CPUS, which is probably more reasonable.
> 
> > - If we're enforcing here, is the BUILD_BUG_ON() now superfluous?
> 
> Yes, but it documents the requirement better than just the
> Kconfig dependency. Since there is a runtime limit, we could
> probably just drop the compile-time check and not add the
> Kconfig check.

Your call.  I trust your judgement.

All of this was just a thought experiment.

-- 
Lee Jones [李琼斯]

