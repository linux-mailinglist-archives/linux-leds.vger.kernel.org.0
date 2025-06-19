Return-Path: <linux-leds+bounces-4853-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C32AE03FA
	for <lists+linux-leds@lfdr.de>; Thu, 19 Jun 2025 13:38:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43C815A3711
	for <lists+linux-leds@lfdr.de>; Thu, 19 Jun 2025 11:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF83C22FE08;
	Thu, 19 Jun 2025 11:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XjUfrzdw"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A0822FDFA;
	Thu, 19 Jun 2025 11:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750333067; cv=none; b=aDQJOQMOZn89q/FFEdGHjT6XCcV2VTKr8qZbSaIpzFOvbgNJOZbitGxrHc/K1MN/LuFvZyd+I1y8svHBCDjX7UZvyOpzfCVvl7SND/3WfrYNuzhGzrNqSTJhSIiGX3+ZjxVr/OKb5Lmpk04yXH+qBLOv1wixavd+pEZXMgP3dYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750333067; c=relaxed/simple;
	bh=twEm/s9leWqXT5p14ZQ2TSjogKnNrZ1fMoKOt41dQQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OlTMm0ADnR6LlBGyBaeaUYllPdj3N7ZuKGfVOD5o33R8lttuHg96qWXDxqS/mubv0eY6oGajEx+WFWZsFC3shWgb2lNACFoxZDD5dUPBHjPT6WpTzTO3dCV7cghiX1ldttXM/anDdZL+o4wEdulWtXmSltlI6YTJqt4GNKoc6Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XjUfrzdw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FB0AC4CEEF;
	Thu, 19 Jun 2025 11:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750333067;
	bh=twEm/s9leWqXT5p14ZQ2TSjogKnNrZ1fMoKOt41dQQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XjUfrzdwB85S9+UkH2DwinKAoYILDGMPYbTDUEuhVBs+mmCOHZSnETtE+IajDyjGN
	 Mu7Ws3fAKWkjRr8IukJ3tqlsy5pYQflxpCkyfU3jSicpc6GivbUgiTs/mR1lZtPVon
	 r9Wyy87GB69iC035x5L/ljBsffKGA4LNeumAGeJdh7/UgK7GaKfnofccuocfAhssAl
	 ervd9JoyKZrqdD29YGP8MQ5h3UicW5pW000GH1WhodRQcrLPUg5CcID37oRZaog82d
	 lKRVBMvG/LDbv5dLoPYwPAk3fDj8enLWQRwg1Ln1k1Ooxt6AqAFv7sP9BkNY6WJPYS
	 xc/E/GJIa24pw==
Date: Thu, 19 Jun 2025 12:37:43 +0100
From: Lee Jones <lee@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Tobias Junghans <tobias.junghans@inhub.de>, linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 2/2] leds: trigger: netdev: refactor
 netdev_event_requires_handling()
Message-ID: <20250619113743.GE587864@google.com>
References: <20250610114029.268938-1-tobias.junghans@inhub.de>
 <20250610114029.268938-3-tobias.junghans@inhub.de>
 <0bcb999e-f32c-499e-9a10-41334ffc2255@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0bcb999e-f32c-499e-9a10-41334ffc2255@lunn.ch>

On Thu, 12 Jun 2025, Andrew Lunn wrote:

> On Tue, Jun 10, 2025 at 01:40:20PM +0200, Tobias Junghans wrote:
> > If there are network devices with the same name in different
> > namespaces, ledtrig-netdev gets confused easily and switches between
> > these devices whenever there are NETDEV_CHANGENAME/NETDEV_REGISTER
> > notifications.  This happens since ledtrig-netdev only checks for
> > device name equality regardless of previous associations with another
> > network device with the same name.
> > 
> > Real world example: eth0 is the primary physical network interface and
> > ledltrig-netdev is associated with that interface. If now Docker creates
> > a virtual Ethernet interface (vethXXXX), moves it to the
> > container's net namespace and renames it to eth0, ledtrig-netdev
> > switches to this device and the LED no longer blinks for the original
> > (physical) network device.
> > 
> > Fix this by refactoring the conditions under which to handle netdev
> > events:
> > 
> > - For processing NETDEV_REGISTER events, the device name has to match
> >   and no association with a net_dev must exist.
> 
> Sorry for taking a while to review this. It took me a while to think
> it through and produce a list of use cases. And might still be missing
> some.
> 
> Given the complexity here, i actually think we need verbose comments
> in the code.

Thanks Andrew - I'll leave it with you.   =:-)

[...]

-- 
Lee Jones [李琼斯]

