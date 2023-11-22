Return-Path: <linux-leds+bounces-87-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC027F450C
	for <lists+linux-leds@lfdr.de>; Wed, 22 Nov 2023 12:44:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC7731C20873
	for <lists+linux-leds@lfdr.de>; Wed, 22 Nov 2023 11:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DF8C1F615;
	Wed, 22 Nov 2023 11:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LeWAAWB2"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA57BE7E
	for <linux-leds@vger.kernel.org>; Wed, 22 Nov 2023 11:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA249C433C8;
	Wed, 22 Nov 2023 11:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700653479;
	bh=7SCLZMf84i/qdLRLpb12nwODAA5V91JB6qPLNeOI4r8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LeWAAWB2FZYRKX72WUi+YzRnAWVj0km31wIJTRJ2a6Qo8HKK6/560QJjqhLYlLWTt
	 14N/F4CcIe6hhXj8L2cB+SM5EDF6OQnerLOdVfj1Mlz2BWXaOzAzbmsTghFQLFPVXD
	 oMAWM1p78QSfttqadhHzOV3OUnHeHi4NmgXuVJXbp8rBllrkoa/a58F9ylxGE78mol
	 RKm/dKV/eBH1CShSSsFbbVxQycuLkVNmMxyL4GpPrcib2Zzyej5PPcFnnNGcr6PoP5
	 YOQhtlROB1mGhvbVPEzNQ3oehlvNPrq78Ph52N8ZSWeo6xIVUgpMRpudfMl4QHmNkJ
	 nLrvbW5AboP/w==
Date: Wed, 22 Nov 2023 11:44:34 +0000
From: Lee Jones <lee@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Pavel Machek <pavel@ucw.cz>,
	Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	Johannes =?iso-8859-1?Q?Pen=DFel?= <johannes.penssel@gmail.com>,
	Jeremy Soller <jeremy@system76.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH] Revert "leds: class: Store the color index in struct
 led_classdev"
Message-ID: <20231122114434.GI173820@google.com>
References: <20231121142629.27083-1-tiwai@suse.de>
 <170057941222.880794.5199112193553712244.b4-ty@kernel.org>
 <87v89v9j9t.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87v89v9j9t.wl-tiwai@suse.de>

On Tue, 21 Nov 2023, Takashi Iwai wrote:

> On Tue, 21 Nov 2023 16:10:12 +0100,
> Lee Jones wrote:
> > 
> > On Tue, 21 Nov 2023 15:26:29 +0100, Takashi Iwai wrote:
> > > This reverts commit c7d80059b086c4986cd994a1973ec7a5d75f8eea.
> > > 
> > > The commit caused regressions to a few drivers (such as Logitech
> > > keyboard or System76 ACPI) that already had "color" leds sysfs entry;
> > > now they conflict with the commonly created sysfs of led class.
> > > 
> > > For addressing the regression, we revert the commit, so that the
> > > conflicting "color" sysfs entry is removed.
> > > 
> > > [...]
> > 
> > Applied, thanks!
> > 
> > [1/1] Revert "leds: class: Store the color index in struct led_classdev"
> >       commit: 17e1ad377bb1d39260e0594ee284d8e03f64fdfb
> 
> It turned out that drivers/leds/rgb/leds-group-multicolor.c
> initializes the cdev->color, and this revert breaks it.

Indeed:

linux/leds-fixes/drivers/leds/rgb/leds-group-multicolor.c: In function ‘leds_gmc_probe’:
linux/leds-fixes/drivers/leds/rgb/leds-group-multicolor.c:109:49: error: ‘struct led_classdev’ has no member named ‘color’
linux/leds-fixes/drivers/leds/rgb/leds-group-multicolor.c:120:13: error: ‘struct led_classdev’ has no member named ‘color’

> So please scratch my previous revert patch.
> I'm going to submit a partial revert instead.

Sure.

-- 
Lee Jones [李琼斯]

