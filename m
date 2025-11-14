Return-Path: <linux-leds+bounces-6141-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B9AC5DCD0
	for <lists+linux-leds@lfdr.de>; Fri, 14 Nov 2025 16:17:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 43B783831E1
	for <lists+linux-leds@lfdr.de>; Fri, 14 Nov 2025 15:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 358813375C2;
	Fri, 14 Nov 2025 14:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="irrM6O2C"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D401337115;
	Fri, 14 Nov 2025 14:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763131928; cv=none; b=RUJnrgzB1xFGy7RDK+sCLKAg+cEDkXAZY9Esf4yyVqfODwqMP5D65w2ZOsIcwS0BSJwSk1b4jUhgaxIQuooZbB4t2zF5K9NtoMxOLtiwHFCzt4hn14igeLhQBu7nU0tkfT+DHMqfKzLW2f4/izJmMbKj+sBrC4kNamx3OBXiRP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763131928; c=relaxed/simple;
	bh=PgzNe1oxWC+IYjfstT6mPYn1E0VMJFfDp9PZ6v0bZIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lldKSKuJ5aUazG9kKBrWzKssWIgTOWo99O6AD6lUSQUs8sRPlzWn6RioeZ/90hvooqKQdHveLqoytOVtfFPn8X+wZhsAV0JaJEhy0S/EaAdWQVkHos+2+lU2Ywo5YBDQxa0r3wBpYyAswrY3QJHt3dNlLDS1xcAz2uUAfwej2qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=irrM6O2C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6A6DC4AF09;
	Fri, 14 Nov 2025 14:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763131927;
	bh=PgzNe1oxWC+IYjfstT6mPYn1E0VMJFfDp9PZ6v0bZIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=irrM6O2CN0KyVPfv2NBQycGZ/Ssyz8E27qaollH3M5FwQbByQRder8LQK3hlpA+FS
	 gi0ImWvPBKNGVsAYlduUehF/PRTvWkIUs1Oafpoxs+PCVpJc+XviQYViyxivAlFmCe
	 MKyrp/9njAywdUBqdB32C5uL1bMWSWNrrt4mEXLP8BvceVxAvm84yxWoHxhH0ub0kM
	 FBPotnKx8zbsDiOFx7JPBwEwxY0ZAdkPOE0L1ThqZIbqqlcc09CmHvpy9Zyz3TIGsU
	 AwSWJK/66JWvNXvyTCSPJG9GFuxzbeHkek96i9Byrba3eq2RPOXs2mfKx29lJJsVm8
	 5r0fiqWkA+Waw==
Date: Fri, 14 Nov 2025 08:56:34 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: kernel@oss.qualcomm.com, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: rgb: leds-qcom-lpg: Only enable TRILED when LPG is
 used by LED
Message-ID: <t453czpauswdttsl5cqxwk5ryc7aau3bz4jfwfe4istkffgp43@ffoiicvnbxzh>
References: <20251114-lpg_triled_fix-v1-1-9b239832c53c@oss.qualcomm.com>
 <7jf4xvqmlymwkyrdp2ulpazfwmhdmfegzigewc5esk2sj323a5@72skiavskrqt>
 <7732165a-4147-4917-b76a-1525aae13c25@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7732165a-4147-4917-b76a-1525aae13c25@oss.qualcomm.com>

On Fri, Nov 14, 2025 at 03:13:18PM +0800, Fenglin Wu wrote:
> 
> On 11/14/2025 12:58 PM, Bjorn Andersson wrote:
> > If chan->in_use, then the channel is exposed as a LED and
> > lpg_pwm_request() should have returned -EBUSY, so we should never reach
> > lpg_pwm_apply()?
> 
> Yes, I agree.
> 
> Change is trying to ignore enabling TRILED channel when the LPG channel
> mapping to TRILED is not used for controlling the LED (not defining the LED
> child nodes).
> 
> So the fix should be just removing this line instead of adding the if check.
> 

Sorry, it's been a while since I looked at this code, but isn't it
possible to configure a channel going through the triled to be exposed
as a PWM channel and if so, don't we need to enable the TRILED driver
for this channel in those cases?

> I will update it in patch v2.
> 
> > 
> > Why do you check chan->triled_mask? I guess we will still read/write the
> > triled regiter, but don't make any changes if this is 0?
> > 
> > Or is this the actual issue that you're fixing, that we read/write the
> > registers when we shouldn't? If so this should be clarified in the
> > commit message.
> 
> Yes, there was a case that a LPG channel mapping to TRILED is repurposed to
> control a fan, and it was seen that the BOB1 (supplies to TRILED) voltage
> bumped to higher voltage when the PWM channel was enabled.
> 

Is the signal still routed through the TRILED, or is it muxed to another
driver?

Regards,
Bjorn

> > 
> > Regards,
> > Bjorn

