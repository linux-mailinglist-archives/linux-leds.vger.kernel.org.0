Return-Path: <linux-leds+bounces-4537-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B00A9A305
	for <lists+linux-leds@lfdr.de>; Thu, 24 Apr 2025 09:13:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2511E3A6110
	for <lists+linux-leds@lfdr.de>; Thu, 24 Apr 2025 07:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CCCD1E9B00;
	Thu, 24 Apr 2025 07:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a+t6NxaH"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3CF1E7640
	for <linux-leds@vger.kernel.org>; Thu, 24 Apr 2025 07:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745478819; cv=none; b=YGllFJw56YhL3Hj5by5yQC0D1pDH0ZSBxLEp6RfT+ULHkmr3jAdnLOvm3AWxzVE7xaI7/TF+AHbmaPO3DJG4jhxRxK4MO19n/7imVakPKjyMEAKXNY+6r6YgMCbWmDXAUPVAEPtx4ytddGc0lH8qEAuR00EV9agJPGawttkLJeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745478819; c=relaxed/simple;
	bh=1LcGE5nEj/FwcZf9NvIxwUjg9MVtzKE/3jQ0/Dt2N4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vf6eREQD4aY5mHto5pulpI4J0GSYJXgBWPHzVkKwYcAdZiDil3kFojLXpxpjIjV6kCeQiyQFAAHZmiiLUYBJebvMJV56JQ9KHLQ1fUzX5y9dYYcAo/PNtijjoZbR82UrvrfA1IF42pKeD9Dx9JsRrGUNPqmgZI4Or6emJQL4cxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a+t6NxaH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70ED1C4CEE3;
	Thu, 24 Apr 2025 07:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745478818;
	bh=1LcGE5nEj/FwcZf9NvIxwUjg9MVtzKE/3jQ0/Dt2N4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a+t6NxaHumFFNgeldAdXbcg7DJioI9PZROhB/aMUl78Q4loiRCyEka03uSeuJ/lt6
	 9ng1Mrbr5ia1ILvK1/z0j2QSYzWPscDbaaMnZKqXeXFDpJB7Gy18cT0KXyvGz5/qIw
	 ASWb+i0lA2sPGtsFT0sqPkRKDNxnA1PyCAX2wwfOS2dOBiNKwlt6FppNFlBCxBYoGT
	 +BGxUL/1w9pPU05AxVm+GBppHejsZHakyC4cfyG8Hz6m+Q0oMPggMsQpVc6NXX1aD2
	 9q7YQAxfmCoNJtcwJ45Ms5sAjryGe8FMtHWbl29QC2KTA0EHodBXWWVTHwSfOGk7t7
	 yIQ1rXTIWg7nQ==
Date: Thu, 24 Apr 2025 08:13:34 +0100
From: Lee Jones <lee@kernel.org>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: pavel@kernel.org, linux-leds@vger.kernel.org
Subject: Re: LEDs Testing Framework
Message-ID: <20250424071334.GB8734@google.com>
References: <20250423092551.GA8734@google.com>
 <2481f089-7da5-44fe-9e74-7dbcd64e486f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2481f089-7da5-44fe-9e74-7dbcd64e486f@gmail.com>

Hey Jacek,

On Wed, 23 Apr 2025, Jacek Anaszewski wrote:
> On 4/23/25 11:25, Lee Jones wrote:
> > Good morning Pavel, et al.,
> > 
> > Is anyone aware of any LED testing frameworks?
> > 
> > I would like to author one, but I'm hesitant to reinvent the wheel.
> > 
> > Kind regards,
> > Lee
> 
> AFAIK there is only tools/leds/get_led_device_info.sh script written by
> me few years ago, while working on LED naming standardization.

Thanks for getting back to me.

Yes, I noticed that one when looking around.

Okay, this sounds like we're good for setting something up.

Stand-by for patches. :)

-- 
Lee Jones [李琼斯]

