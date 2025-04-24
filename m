Return-Path: <linux-leds+bounces-4538-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C97A9A560
	for <lists+linux-leds@lfdr.de>; Thu, 24 Apr 2025 10:10:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 145F64612B7
	for <lists+linux-leds@lfdr.de>; Thu, 24 Apr 2025 08:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EBAF205ABB;
	Thu, 24 Apr 2025 08:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QaMA/fQ0"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667EB1FECAB;
	Thu, 24 Apr 2025 08:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745482173; cv=none; b=YP10arckMya9/gQC4LqQ1DdMXwvzcuaDpDWGwBnEVRh+V+U41s8gLjztqE07qzUAV3cXQBiVXvrUlY/11Z7gHIv1fjsml8DQ4EqLZfxhJ3g6S922pRWG/Y43uvsJFf0KhfGs3phqOBES3FhSHjSCAbfU5bGTweLl02kD+yUwIzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745482173; c=relaxed/simple;
	bh=w4aTI2tw2DECYyVbFBHcA3pi5NPmv7fqQhPg0hNjcSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FyhRFnkl5NnSE9LivDKc+PsjbxN2Wdm9UKrp+X436T3/IFP04HoaRlTr5OkLkmTOj67nfJI9DSmb1rl9v4PrFpW/JBN/8QisnB5aXUX6Oo12rH3HxGrv5wUBj5wOvJTzjLOYlfsTahuuYg4wP6cAaGRs+FLHhEqdgfr9mcxG1Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QaMA/fQ0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A86B0C4CEE3;
	Thu, 24 Apr 2025 08:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745482171;
	bh=w4aTI2tw2DECYyVbFBHcA3pi5NPmv7fqQhPg0hNjcSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QaMA/fQ0rd3RondULivhj2s86mCPhYvpUNik3E9nY0Jr3HLqxH1jzmY20jbW7kMBt
	 6I4hss5ulHUaytccsH9rWYHMZKObCwkQjV6GTDQCpv/Mju6KDrh1vdXpk/hzN0dXg8
	 FochVIQMqwhUNI7dLB2XN0K/LMGUfy9cs9MrmIdhRL3kYWFjhHRTQ//Am3YOfAzseu
	 jFh/gBAkNFmY4C7S6VscS5Mm78Hf0hcvuLhQJn6AEqQT+NH52juwselhzf74K6wNc5
	 51xtK7e69+ZHReMHEv16DfrU43/XGdA/39eJLItGOh2FwHV64X8fKBMfJTRZR14vap
	 3SNAGNz5wxIjQ==
Date: Thu, 24 Apr 2025 09:09:27 +0100
From: Lee Jones <lee@kernel.org>
To: Tobias Junghans <tobias.junghans@inhub.de>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v2] leds: trigger: netdev: refactor dev matching in
 netdev_trig_notify()
Message-ID: <20250424080927.GC8734@google.com>
References: <20250411074421.GV372032@google.com>
 <20250423131325.235098-1-tobias.junghans@inhub.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250423131325.235098-1-tobias.junghans@inhub.de>

On Wed, 23 Apr 2025, Tobias Junghans wrote:

> If there are network devices with the same name in different
> namespaces, ledtrig-netdev gets confused easily and switches between
> these devices whenever there are NETDEV_CHANGENAME/NETDEV_REGISTER
> notifications.  This happens since ledtrig-netdev only checks for
> device name equality regardless of previous associations with another
> network device with the same name.
> 
> Real world example: eth0 is the primary physical network interface and
> ledltrig-netdev is associated with that interface. If now Docker creates
> a virtual Ethernet interface (vethXXXX), moves it to the
> container's net namespace and renames it to eth0, ledtrig-netdev
> switches to this device and the LED no longer blinks for the original
> (physical) network device.
> 
> Fix this by refactoring the conditions under which to return early with
> NOTIFY_DONE inside netdev_trig_notify():
> 
> - For processing NETDEV_REGISTER events, the device name has to match
>   and no association with a net_dev must exist.
> 
> - For processing NETDEV_CHANGENAME events, the associated and notified
>   network device have to match. Alternatively the device name has to
>   match and no association with a net_dev must exist.
> 
> - For all other events, the associated and notified network device have
>   to match.
> 
> Signed-off-by: Tobias Junghans <tobias.junghans@inhub.de>
> ---
>  drivers/leds/trigger/ledtrig-netdev.c | 29 +++++++++++++++++++--------
>  1 file changed, 21 insertions(+), 8 deletions(-)

Please send subsequent versions independently, rather than attached to
the end of lengthy (or any for that matter) mail threads.  This gets
confusing, fast!

Also, this is v3.

Please resubmit.

-- 
Lee Jones [李琼斯]

