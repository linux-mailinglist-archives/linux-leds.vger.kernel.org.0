Return-Path: <linux-leds+bounces-357-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8616D8110BC
	for <lists+linux-leds@lfdr.de>; Wed, 13 Dec 2023 13:06:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B65E31C2084D
	for <lists+linux-leds@lfdr.de>; Wed, 13 Dec 2023 12:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 968CA28DBD;
	Wed, 13 Dec 2023 12:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X4Q93yb1"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756BA28DBC
	for <linux-leds@vger.kernel.org>; Wed, 13 Dec 2023 12:06:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3F6AC433C8;
	Wed, 13 Dec 2023 12:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702469160;
	bh=0fZ8lE5Gknw0KrjrV+z1K/C4pFCs6c1up/ve/h5nndc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=X4Q93yb1c/uBMqho8GwLNvGClTPk4dlhPqvmkLV2gtLKOfFTWM+YJCgm8o6mDuzGd
	 iObYr0N34+F8KOFUhK7ehwfrweBMakggski4VwDr0kG5/bqtCClrFP03l1GG9cM90V
	 9JbRllsBxD0BS4uLzilt9LQgjyMp5DM++xP9akkoTP7FA5mNAJzhbcsWBMT1j/wJWP
	 0rTWfC1wZp2PfipMboDmA0a/DKFWkPsAucScIVZieroXJMsFmYHPDKDBaViFU7VjDo
	 7Tst//GxSR1tFK+IC7ntiw5HieIQ0stSmhyIPd4xUhcHWW/k5zcFtNaE1cawqsme+8
	 zziaiBhicxpAA==
Date: Wed, 13 Dec 2023 13:05:55 +0100
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Li
 Zetao <lizetao1@huawei.com>, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>
Subject: Re: [GIT PULL] Immutable branch between LEDs and NetDev due for the
 v6.8 merge window:wq
Message-ID: <20231213130555.406aa2ef@dellmb>
In-Reply-To: <20231213112705.GI111411@google.com>
References: <99e7d3304c6bba7f4863a4a80764a869855f2085.1701143925.git.daniel@makrotopia.org>
	<170142826116.3357002.9561246405642038358.b4-ty@kernel.org>
	<6577315e.050a0220.50f30.0122@mx.google.com>
	<20231211084656.26578d89@kernel.org>
	<657784f6.5d0a0220.617b5.20ee@mx.google.com>
	<20231211140546.5c39b819@kernel.org>
	<20231213112705.GI111411@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 13 Dec 2023 11:27:05 +0000
Lee Jones <lee@kernel.org> wrote:

> On Mon, 11 Dec 2023, Jakub Kicinski wrote:
> 
> > On Mon, 11 Dec 2023 22:53:55 +0100 Christian Marangi wrote:  
> > > Soo that it's problematic to also have on net-next? (Sorry for the
> > > stupid question)  
> > 
> > Unless I pull from Lee the patch would be duplicated, we'd have two
> > commits with different hashes and the same diff. And if I pull we'd
> > get a lot of netdev-unrelated stuff into net-next:
> > 
> > $ git merge f07894d3b384344c43be1bcf61ef8e2fded0efe5
> > Auto-merging drivers/leds/trigger/ledtrig-netdev.c
> > Merge made by the 'ort' strategy.
> >  .../ABI/testing/sysfs-class-led-trigger-netdev     |  39 ++
> >  .../ABI/testing/sysfs-class-led-trigger-tty        |  56 ++
> >  .../bindings/leds/allwinner,sun50i-a100-ledc.yaml  | 137 +++++
> >  Documentation/devicetree/bindings/leds/common.yaml |   2 +-
> >  drivers/leds/Kconfig                               |  21 +
> >  drivers/leds/Makefile                              |   2 +
> >  drivers/leds/leds-max5970.c                        | 109 ++++
> >  drivers/leds/leds-sun50i-a100.c                    | 580 +++++++++++++++++++++
> >  drivers/leds/leds-syscon.c                         |   3 +-
> >  drivers/leds/leds-tca6507.c                        |  30 +-
> >  drivers/leds/rgb/leds-qcom-lpg.c                   |  52 +-
> >  drivers/leds/trigger/ledtrig-gpio.c                |  26 +-
> >  drivers/leds/trigger/ledtrig-netdev.c              |  32 +-
> >  drivers/leds/trigger/ledtrig-tty.c                 | 247 +++++++--
> >  drivers/tty/tty_io.c                               |  28 +-
> >  include/linux/leds.h                               |   3 +
> >  include/linux/tty.h                                |   1 +
> >  17 files changed, 1247 insertions(+), 121 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/leds/allwinner,sun50i-a100-ledc.yaml
> >  create mode 100644 drivers/leds/leds-max5970.c
> >  create mode 100644 drivers/leds/leds-sun50i-a100.c  
> 
> No, please don't do that.  None of the branches I maintain are stable.
> 
> It allows me to do things like this:
> 
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:
> 
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git ib-leds-netdev-v6.8
> 
> for you to fetch changes up to ee8bfb47222a5cc59dee345b7369c5f2068e78cd:
> 
>   docs: ABI: sysfs-class-led-trigger-netdev: Add new modes and entry (2023-12-13 11:24:55 +0000)
> 
> ----------------------------------------------------------------
> Immutable branch between LEDs and NetDev due for the v6.8 merge window
> 
> ----------------------------------------------------------------
> Daniel Golle (2):
>       leds: trigger: netdev: Extend speeds up to 10G
>       docs: ABI: sysfs-class-led-trigger-netdev: Add new modes and entry

Please don't pull this. The sysfs documentation for the link_* files
does not specify that they are available only if the underlying speeds
are supported.

Let's first fix this and then merge it.

Christian sent the patch
  leds: trigger: netdev: display only supported link speed attribute

It needs some updating first, but only after it is fixed should this be
merged.

Marek

