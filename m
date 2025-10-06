Return-Path: <linux-leds+bounces-5650-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9560BBBF0ED
	for <lists+linux-leds@lfdr.de>; Mon, 06 Oct 2025 21:08:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 912A31899070
	for <lists+linux-leds@lfdr.de>; Mon,  6 Oct 2025 19:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E141F2512EE;
	Mon,  6 Oct 2025 19:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uD8hJPWF"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02061D61A3;
	Mon,  6 Oct 2025 19:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759777706; cv=none; b=ZlE6mvjrqMW8l0X0JbL6pGtmekn0jEv4TY/egC+i0xqaORBvNbQW4xvk6mHCRgHM0vaKoVBl/PdiLRTPXg9rH8GW1OJlncypvFjplIj8jz/uGi1VOCVPjiOWM9313/bk9etO53B42Sd0emmRjoHfcEpKd0Udv2286dxmRBK7TA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759777706; c=relaxed/simple;
	bh=y7eB5Aq5t61EIBq8FizZqyAOn5r9BRoMjG9Gdpz6Tzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vh3isF4Yv3iGI3vZ07VmtjLteKX6M/sEhSr5V/C7b2gs3H6nh4G7XV6aapuuOrtab9Ps8Mq0uce8dmpqATDtdfdzFUGsA8x2b+CWlNDb6aVPOWHjZh1UbLIGs80xEN316jrpmsFcHeMyr/ZJyTnMattvo96djDEYmt8Ag6sh3f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uD8hJPWF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CD38C4CEF5;
	Mon,  6 Oct 2025 19:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759777705;
	bh=y7eB5Aq5t61EIBq8FizZqyAOn5r9BRoMjG9Gdpz6Tzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uD8hJPWFbKLdWtulj5XUIgCrgpIcXYfvHT3M5zcTUwJx1jEWY9+hLIGQtBcBkAUmw
	 aw6NdNg7CAlhFc2cpBwi7dDlXnRBv6CeW0mahR9pAxsbLsG6z/uQvR2nBsDicZgIhc
	 Wp7PA+XsGZG4KcPFfEFda/4JIgRQsRyorjpZOI1MeAFcgefs+fuBvBxe0YFFHwicea
	 ETsv4DZwn81arKsESHcZ9H4om40CElC0vToQ9HpDxiqOBFw6xz1Nl9IxwwStJkn2E3
	 JCUoblTAm/VMMN75XQyLiCL81CvjUtiRxD0Axr83xKYZHe8/kreEvJR27D6hnhZNY3
	 L2JuBxXk++h2Q==
Date: Mon, 6 Oct 2025 12:08:19 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Armin Wolf <W_Armin@gmx.de>
Cc: kernel test robot <lkp@intel.com>, ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com, chumuzero@gmail.com, corbet@lwn.net,
	cs@tuxedo.de, wse@tuxedocomputers.com, ggo@tuxedocomputers.com,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, rdunlap@infradead.org,
	alok.a.tiwari@oracle.com, linux-leds@vger.kernel.org,
	lee@kernel.org, pobrn@protonmail.com
Subject: Re: [PATCH v4 1/2] platform/x86: Add Uniwill laptop driver
Message-ID: <20251006190819.GA2406882@ax162>
References: <20250928013253.10869-2-W_Armin@gmx.de>
 <202509290415.uez00SgW-lkp@intel.com>
 <6146d57b-f855-40b1-a644-3af6b28ceea4@gmx.de>
 <20251002233627.GA3978676@ax162>
 <402f254d-7217-43e8-867f-66daab3ead86@gmx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <402f254d-7217-43e8-867f-66daab3ead86@gmx.de>

On Sun, Oct 05, 2025 at 08:06:57PM +0200, Armin Wolf wrote:
> Am 03.10.25 um 01:36 schrieb Nathan Chancellor:
> 
> > Hi Armin,
> > 
> > On Thu, Oct 02, 2025 at 08:41:19PM +0200, Armin Wolf wrote:
> > > i think this is a problem inside the clang compiler. I did not encounter this warning when
> > > build for x86-64 using gcc.
> > Clang is actually saving you from yourself, it is a bug in GCC that it
> > does not warn for this:
> > 
> > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=91951
> 
> Oh my, i didn't expect that. Thank you for explaining this issue to to me,
> it seems that i still have much to learn.

In your defense, it is quite a subtle interaction. It is probably worth
throwing something in the documentation that explicitly calls this out,
though I am not immediately sure of where...

Cheers,
Nathan

