Return-Path: <linux-leds+bounces-23-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 439F47EF269
	for <lists+linux-leds@lfdr.de>; Fri, 17 Nov 2023 13:13:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECFED1F24E63
	for <lists+linux-leds@lfdr.de>; Fri, 17 Nov 2023 12:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD583064E;
	Fri, 17 Nov 2023 12:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z0Y+HWF2"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412FA30646
	for <linux-leds@vger.kernel.org>; Fri, 17 Nov 2023 12:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 180DAC433C8;
	Fri, 17 Nov 2023 12:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700223179;
	bh=C590OJebVU4qBEXhA2RorWT4HoNvqypanlNedX24PIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z0Y+HWF2pYzZazMd/GaNQbB0xyU5VjxQ5CdF208121mUkqwOrW+oXlhEJ+1qQl170
	 I1Zswhq1FdFQoKDzXr6nvYNFD1WWyNZxIYH4plzE/l5C38YYVkaBW4c7fF/hFBMPSY
	 WzpL2J0JpcrzzsfHHcLTGISZT7c3f/ev1nBqhCGgCWglINqQEmqrmYnWBaTEN74OJ/
	 aY22RtYc/mJLObb6kPMvp71Rxl54rWqz8Ca3d/5Viez2snbHIFb88kZJJwi4JMH9qk
	 ksJYANuM6JJG1DIMEKoHENIsbyYeLYGH2AUmhezoK50fBDKdf+oDA/rJxR3OMpWxKz
	 ldeT6IQJ2ojmA==
Date: Fri, 17 Nov 2023 12:12:53 +0000
From: Lee Jones <lee@kernel.org>
To: m.brock@vanmierlo.com
Cc: Florian Eckert <fe@dev.tdt.de>, Eckert.Florian@googlemail.com,
	gregkh@linuxfoundation.org, jirislaby@kernel.org, pavel@ucw.cz,
	kabel@kernel.org, u.kleine-koenig@pengutronix.de,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [Patch v8 6/6] leds: ledtrig-tty: add additional line state
 evaluation
Message-ID: <20231117121253.GB137434@google.com>
References: <20231109085038.371977-1-fe@dev.tdt.de>
 <20231109085038.371977-7-fe@dev.tdt.de>
 <39e7c892299c74821b1105a0967063ca@vanmierlo.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <39e7c892299c74821b1105a0967063ca@vanmierlo.com>

On Thu, 09 Nov 2023, m.brock@vanmierlo.com wrote:

> Florian Eckert schreef op 2023-11-09 09:50:
> > The serial tty interface also supports additional input signals, that
> > can also be evaluated within this trigger. This change is adding the
> > following additional input sources, which could be controlled
> > via the '/sys/class/<leds>/' sysfs interface.
> > 
> > Explanation:
> > DCE = Data Communication Equipment (Modem)
> > DTE = Data Terminal Equipment (Computer)
> > 
> > - cts:
> >   DCE is ready to accept data from the DTE (CTS = Clear To Send). If
> >   the line state is detected, the LED is switched on.
> >   If set to 0 (default), the LED will not evaluate CTS.
> >   If set to 1, the LED will evaluate CTS.
> > 
> > - dsr:
> >   DCE is ready to receive and send data (DSR = Data Set Ready). If the
> >   line state is detected, the LED is switched on.
> >   If set to 0 (default), the LED will not evaluate DSR.
> >   If set to 1, the LED will evaluate DSR.
> > 
> > - dcd:
> >   DTE is receiving a carrier from the DCE (DCD = Data Carrier Detect).
> >   If the line state is detected, the LED is switched on.
> >   If set to 0 (default), the LED will not evaluate DCD.
> >   If set to 1, the LED will evaluate DCD.
> > 
> > - rng:
> >   DCE has detected an incoming ring signal on the telephone line
> >   (RNG = Ring Indicator). If the line state is detected, the LED is
> >   switched on.
> >   If set to 0 (default), the LED will not evaluate RNG.
> >   If set to 1, the LED will evaluate RNG.
> > 
> > Also add an invert flag on LED blink, so that the LED blinks in the
> > correct order.
> > 
> > * If one off the new enabled input signals are evaluatet as 'enabled',
> >   and data are transmitted, then the LED should first blink 'off' and
> >   then 'on' (invert).
> > * If all the new enabled input signals are evaluatet as 'disabled',
> >   and data are transmitted, then the LED should first blink 'on' and
> >   then 'off'.
> > 
> > Signed-off-by: Florian Eckert <fe@dev.tdt.de>
> > ---
> >  .../ABI/testing/sysfs-class-led-trigger-tty   | 40 ++++++++++
> >  drivers/leds/trigger/ledtrig-tty.c            | 77 ++++++++++++++++++-
> >  2 files changed, 116 insertions(+), 1 deletion(-)

[...]

> Reviewed-by: Maarten Brock <m.brock@vanmierlo.com>

Please snip your replies.

-- 
Lee Jones [李琼斯]

