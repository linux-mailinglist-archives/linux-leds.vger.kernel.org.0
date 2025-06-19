Return-Path: <linux-leds+bounces-4859-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB600AE0A1E
	for <lists+linux-leds@lfdr.de>; Thu, 19 Jun 2025 17:18:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22542168883
	for <lists+linux-leds@lfdr.de>; Thu, 19 Jun 2025 15:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C43DD22488B;
	Thu, 19 Jun 2025 15:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vKiX1jRO"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927263085DB;
	Thu, 19 Jun 2025 15:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750346240; cv=none; b=lV0Q/Nimk/wTifwbGHkjTNc+YAYXIhSn8s8GZ6No8dTLDRx+rGt+Ace5dLn7WXp8sYy4FjGwtCqHi5tyjABPuFz5yr67UMgZtmiU0eaRjpzsTBWahWM3Qp77a4FNAuwWVy3FHzXaBWr3H+DPMCRUj5OeJaEDCJIdHqs6redRzEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750346240; c=relaxed/simple;
	bh=9cHT5F3Iq4DLNV/UcU+5bQAcKLZIjNQZKQaN/qYAq44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=harkR+VKSkHTr/HePsgwYMvZum2F/grWvIIZ4ZM0iv+Sa+lRsvx+g0eXalQCIdJiIdlZ9e90ySc4jgHFfsqCQOBrFBUI3/wWeRatV0MQbxqDIlMIVDrVqvFh3WP8qZAYO8CAOU9W0MIoFNzXu7SdrJltkxaWZbnCr45o7yTvpuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vKiX1jRO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97502C4CEEA;
	Thu, 19 Jun 2025 15:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750346240;
	bh=9cHT5F3Iq4DLNV/UcU+5bQAcKLZIjNQZKQaN/qYAq44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vKiX1jROnvKTvYN3bZ9iGjqOPBAWiJT0wzDfVlBfQ9Js+NUvB+MhZ+vlYpedxozWE
	 dLJpLKlTpGarBV/xgwtUFw/KjVWIOdzOLAlk2duINgGPIzjwJIJsEP5JzI0NCMn1DL
	 Z2jGia4zbUfJpdV2vnUx/JdHPL2H08u9//mjrIXLjlSogUZKeCsUqhcZO9KMV2Dyo8
	 vn/34AXSwfLlyX8nP4NRZdtw8yvPKO8LOzyTJHJ+F/RSFYa2Vg61PWWP91KNxz5tqM
	 13YEG3JWFaPQRggFRfMYM5bzQYVAXj5kq060KUnE0SSxfHqsWZjebMnpIVOILB5SSi
	 F3DqfSi31IHyQ==
Date: Thu, 19 Jun 2025 16:17:14 +0100
From: Lee Jones <lee@kernel.org>
To: Hans de Goede <hansg@kernel.org>
Cc: Armin Wolf <W_Armin@gmx.de>, Werner Sembach <wse@tuxedocomputers.com>,
	ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com,
	chumuzero@gmail.com, corbet@lwn.net, cs@tuxedo.de,
	ggo@tuxedocomputers.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [RFC PATCH 2/3] platform/x86: Add Uniwill laptop driver
Message-ID: <20250619151714.GJ795775@google.com>
References: <20250615175957.9781-1-W_Armin@gmx.de>
 <20250615175957.9781-3-W_Armin@gmx.de>
 <41de4cd4-2a27-4b14-a1c0-e336a3cec317@tuxedocomputers.com>
 <d645ba09-1820-4473-96bb-8550ed0b0a26@gmx.de>
 <20250619094757.GB587864@google.com>
 <ebd9489d-2783-468a-ad07-e7d1c04fb165@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ebd9489d-2783-468a-ad07-e7d1c04fb165@kernel.org>

On Thu, 19 Jun 2025, Hans de Goede wrote:

> Hi Lee,
> 
> On 19-Jun-25 11:47 AM, Lee Jones wrote:
> > On Tue, 17 Jun 2025, Armin Wolf wrote:
> > 
> >> Am 16.06.25 um 14:46 schrieb Werner Sembach:
> >>
> >>> Hi, small additon
> >>>
> >>> Am 15.06.25 um 19:59 schrieb Armin Wolf:
> >>>> +        functionality.
> >>>> +
> >>>> +What: /sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/rainbow_animation
> >>>> +Date:        Juni 2025
> >>>> +KernelVersion:    6.17
> >>>> +Contact:    Armin Wolf <W_Armin@gmx.de>
> >>>> +Description:
> >>>> +        Forces the integrated lightbar to display a rainbow
> >>>> animation when the machine
> >>>> +        is not suspended. Writing "enable"/"disable" into this file
> >>>> enables/disables
> >>>> +        this functionality.
> >>>> +
> >>>> +        Reading this file returns the current status of the rainbow
> >>>> animation functionality.
> >>>> +
> >>>> +What: /sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/breathing_in_suspend
> >>>> +Date:        Juni 2025
> >>>> +KernelVersion:    6.17
> >>>> +Contact:    Armin Wolf <W_Armin@gmx.de>
> >>>> +Description:
> >>>> +        Causes the integrated lightbar to display a breathing
> >>>> animation when the machine
> >>>> +        has been suspended and is running on AC power. Writing
> >>>> "enable"/"disable" into
> >>>> +        this file enables/disables this functionality.
> >>>> +
> >>>> +        Reading this file returns the current status of the
> >>>> breathing animation
> >>>> +        functionality.
> >>>
> >>> maybe this would be better under the /sys/class/leds/*/ tree if possible
> >>
> >> I CCed the LED mailing list so that they can give us advice on which location is the preferred one for new drivers.
> > 
> > No need to involve the LED subsystem for a hardware function controlled
> > by a single register value just because the interface involves an LED.
> 
> Lee, the question here is where put the sysfs attribute to put the lightbar
> in breathing mode e.g. which of these 2 should be used?  :
> 
> 1. /sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/breathing_in_suspend
> 2. /sys/class/leds/uniwill-lightbar/breathing_in_suspend
> 
> I think this is a fair question and since 2. involves the LED class userspace
> API I also think that asking for the LED maintainers input is reasonable.
> 
> FWIW I'm not sure myself. 2. is the more logical place / path. But 2. adds
> a custom sysfs attr the LED class device. Whereas 1. adds a custom sysfs attr
> in a place where these are more or less expected.

Right.  It was a reasonable question.  Did I imply otherwise?

If it wasn't clear, my vote (this is not a dictatorship) is for 1.

-- 
Lee Jones [李琼斯]

