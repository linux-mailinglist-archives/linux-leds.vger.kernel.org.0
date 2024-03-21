Return-Path: <linux-leds+bounces-1284-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F05886070
	for <lists+linux-leds@lfdr.de>; Thu, 21 Mar 2024 19:18:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1DF42829D4
	for <lists+linux-leds@lfdr.de>; Thu, 21 Mar 2024 18:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A89A13173C;
	Thu, 21 Mar 2024 18:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MOW3ezqt"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B3610782
	for <linux-leds@vger.kernel.org>; Thu, 21 Mar 2024 18:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711045133; cv=none; b=AtBIKoUMEHr48CT75kj3YGD3Wuva7lkWWSO9rE1gKRyqrt36Cm0J0AMm4V/wIxiOYNGVK76OzoH2qKnRiKii+YP0fBv2KLVyf0GavlKnyMKbbwDFnlv5k2y+bEOG78C+dIXNWzamIQoIM00+q8WaQ3SUt9itAhLCJALuK3qvTPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711045133; c=relaxed/simple;
	bh=GQpowxJw63mXS10U49/S+wQpE1NhFSGJq4pwE63vIWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R/hfpHhailQB859XMkSAgroXO+QmyZ41aoI/UkPAayTL755I1UvT1mNJ9gftZt/Qv+m6yGfEGCF5JSRHFuZc8t3/giVFJ5S7VGXhhpk3sLtVPv5L3dwiC62Rnpdq7R+Shu7NclMAaq8RTddbIUf1o8+7ATMn34H43fl7+SyfQ4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MOW3ezqt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B372FC433F1;
	Thu, 21 Mar 2024 18:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711045132;
	bh=GQpowxJw63mXS10U49/S+wQpE1NhFSGJq4pwE63vIWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MOW3ezqtW6sOxzixNCsQJRq4jJyfXBk9ZOyr+m534viuctRP3SeR1+CeRww+Jl3+B
	 n8AkZd4GBuYVhqjr/NInK2bBDpvjXQxKXE29rK3blSgaex8iOEV3PXMfkuksc5mhkB
	 vup7IUSBTSQI2VgJYV0j1kOTz3HLiloqEiv76iVMX4VY0AaPxMP43N/Kn7A0iB+8hE
	 FPcNJJmsOG99hw/jbCqB92k3c0QrHi8XJBYkXFt9YcjiKutpocCeT2We90F1bh3SiL
	 uyIuQ5UGVBAvWtoEkxXG8bA0/RnOoZjy51sFMxXsXwAqW8G/w/9gJJ/5i13bZeCM4o
	 iKAYut6ggFpAA==
Date: Thu, 21 Mar 2024 18:18:49 +0000
From: Lee Jones <lee@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
	Kate Hsuan <hpa@redhat.com>, linux-leds@vger.kernel.org
Subject: Re: [RFC 0/2] leds: Add led_mc_set_brightness() and
 led_mc_trigger_event() functions
Message-ID: <20240321181849.GI13211@google.com>
References: <20240309190835.173703-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240309190835.173703-1-hdegoede@redhat.com>

On Sat, 09 Mar 2024, Hans de Goede wrote:

> Hi All,
> 
> Here is a patch-series adding led_mc_set_brightness() and
> led_mc_trigger_event() functions for changing multi-color LED colors
> from inside the kernel.
> 
> This is a preparation series for adding a new trigger to
> drivers/power/supply/power_supply_leds.c which changes the color
> of a RGB LED depending on if the battery is discharging (LED off)
> charging (LED red) or full (LED green)
> 
> This is marked as RFC since the power_supply_leds.c changes have not
> been written yet and as such this is compile-tested only atm.
> The main goal of this RFC is to gather review feedback on the
> chosen approach in these 2 patches.
> 
> Regards,
> 
> Hans
> 
> 
> Hans de Goede (2):
>   leds: core: Add led_mc_set_brightness() function
>   leds: trigger: Add led_mc_trigger_event() function
> 
>  drivers/leds/led-class-multicolor.c |  1 +
>  drivers/leds/led-core.c             | 31 +++++++++++++++++++++++++++++
>  drivers/leds/led-triggers.c         | 20 +++++++++++++++++++
>  include/linux/leds.h                | 26 ++++++++++++++++++++++++
>  4 files changed, 78 insertions(+)

What is it you want me to do with this RFC patches Hans?

-- 
Lee Jones [李琼斯]

