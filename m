Return-Path: <linux-leds+bounces-3934-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBE2A31406
	for <lists+linux-leds@lfdr.de>; Tue, 11 Feb 2025 19:25:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E0D87A05D6
	for <lists+linux-leds@lfdr.de>; Tue, 11 Feb 2025 18:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C6C41E7C2B;
	Tue, 11 Feb 2025 18:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hD2L5F/C"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E301E3DFD;
	Tue, 11 Feb 2025 18:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739298300; cv=none; b=Jl7DpcS4k8yAJYMakokmk06NITn8DWv3o1r1sBLKjpHQ/PeNhAJXz+3U5aMYlEcIsb66NxFkk9LBbDVR49H6PwvObsS3vOD0OdzbOa+JJiwiWJvnBQkpA1Lg+sUWZNtLLbURo1o3i2gvth39VDXAfv/dGrZdMEtLkg/mBWJqKyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739298300; c=relaxed/simple;
	bh=kM0H5lA9t2fpVFtlNKyU3+1PJ3U/cEVn7vnImdyXzmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fRlcRrkuIioP70KP/hm2Qp/1sJB2bK2BZgjW3/CYyf6pNbm42DNVeCxkOS+cpD34Jvlz3NppdebiF5kGzSCOOtlGoewPSN/LVS3lB0op4aJHFe26d6dReOZALdBwh1RNWNaLmsTHkp6cgDqIo4mqqOQ5lP8BwYoZpTZ0krdzY9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hD2L5F/C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3121C4CEDD;
	Tue, 11 Feb 2025 18:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739298299;
	bh=kM0H5lA9t2fpVFtlNKyU3+1PJ3U/cEVn7vnImdyXzmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hD2L5F/CmMSGF1Xo9DAHBOLYTzEHGpiz6EsVlfluHk3jesDTX3VXcuHaAGFP9mk9T
	 onvEzcPwL0yLMZsKU4kXH11OEq8JAB3vuNVVE4F1eBLxI9kYaKgRF27spa0tzxKwfN
	 m3jCOIFXByISGZgtoUSiF417cS/esPEI25h3Jxe4=
Date: Tue, 11 Feb 2025 13:24:58 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Lee Jones <lee@kernel.org>, tools@kernel.org, 
	Pavel Machek <pavel@ucw.cz>, kernel list <linux-kernel@vger.kernel.org>, rafael@kernel.org, 
	linux-leds@vger.kernel.org
Subject: Re: MAINTAINERS: Move Pavel to kernel.org address
Message-ID: <20250211-coral-copperhead-of-dignity-bcb3ce@lemur>
References: <Z6Ow+T/uSv128wdR@duo.ucw.cz>
 <20250211141109.GV1868108@google.com>
 <CAHk-=whdcXj==9TkCpQYpmzLweCoDzd9_i8SrODjaQ3ysSe6dw@mail.gmail.com>
 <20250211155614.GY1868108@google.com>
 <20250211160125.GA2274105@google.com>
 <CAHk-=whFeiixFbNx8F8rVeCC-Zdco_sFyYynAbRyJH_NAx0Ukw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHk-=whFeiixFbNx8F8rVeCC-Zdco_sFyYynAbRyJH_NAx0Ukw@mail.gmail.com>

On Tue, Feb 11, 2025 at 09:40:24AM -0800, Linus Torvalds wrote:
> On Tue, 11 Feb 2025 at 08:07, Lee Jones <lee@kernel.org> wrote:
> >
> > > Out of interest, how did you apply it?  b4 was playing up for me.
> 
> So I had no issues, but I don't actually use b4 to apply the patches,
> only to fetch them.
> 
> >   Fetching patch(es)
> >   /home/lee/bin/apply-patch.sh: line 134: /tmp/<Z6Ow+T/uSv128wdR@duo.ucw.cz>.mbox: No such file or directory
> >
> > Where apply-patch.sh: line 134:
> >
> >   b4 am -3 -slt ${PATCHES} -o - ${id} > ${MBOX}
> >
> > My first guess would be the stray '/' in the Message-ID.
> 
> I don't know your apply-patch.sh script, so maybe the bug is there,
> and it's your MBOX thing that you create without quoting the message
> ID.

That would be my guess, too, as b4 itself has no trouble fetching or applying
this series:

	$ b4 shazam Z6Ow+T/uSv128wdR@duo.ucw.cz
	Grabbing thread from lore.kernel.org/all/Z6Ow%2BT%2FuSv128wdR@duo.ucw.cz/t.mbox.gz
	Analyzing 7 messages in the thread
	Analyzing 0 code-review messages
	Checking attestation on all messages, may take a moment...
	---
	  ✓ [PATCH] MAINTAINERS: Move Pavel to kernel.org address
	  ---
	  ✓ Signed: DKIM/ucw.cz
	---
	Total patches: 1
	---
	Applying: MAINTAINERS: Move Pavel to kernel.org address

-K

