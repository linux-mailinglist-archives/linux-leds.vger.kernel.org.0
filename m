Return-Path: <linux-leds+bounces-338-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F00580D2AD
	for <lists+linux-leds@lfdr.de>; Mon, 11 Dec 2023 17:47:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 804D91C21132
	for <lists+linux-leds@lfdr.de>; Mon, 11 Dec 2023 16:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90C543B785;
	Mon, 11 Dec 2023 16:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oE/Olgqy"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DE9321A3
	for <linux-leds@vger.kernel.org>; Mon, 11 Dec 2023 16:46:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F92AC433C8;
	Mon, 11 Dec 2023 16:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702313218;
	bh=M40PI+a7RNFzj/ZFgspMXJXtnJLcZwidsLCpYvdczs8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oE/OlgqySbql/JS2lw29WxTdP8SDQ/XWh/IJ73gM+4NRb0Vf38scOsUGTtNynCB/I
	 pVrpb3Scme+8mexL2fjcntYaLwVOi43r/u33GYgFfVgnONz6DM+AYfiOlE+DP/5MFG
	 Qkf2raas9EqIB75LC8Lk7+jWk4uXGIqSvwm+QEm9NjouPRx5gQue5BJhRg4Sriaaaw
	 TMVNLPbpOLV//SdM0OL/sLVO+1E/TyAzS38cU51H1QDaZgEMFmwTuQF2TP2DGebn11
	 Jk10m3MO97ydZhWQVAe5eMBKvqLl3stiVs6NuFoCAjZTrU4d0WEkoucam3d/imR+Ax
	 efIVKNY5mrZ2g==
Date: Mon, 11 Dec 2023 08:46:56 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>, Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Andrew Lunn <andrew@lunn.ch>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Li Zetao <lizetao1@huawei.com>,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Daniel Golle
 <daniel@makrotopia.org>
Subject: Re: [PATCH v3 1/2] leds: trigger: netdev: extend speeds up to 10G
Message-ID: <20231211084656.26578d89@kernel.org>
In-Reply-To: <6577315e.050a0220.50f30.0122@mx.google.com>
References: <99e7d3304c6bba7f4863a4a80764a869855f2085.1701143925.git.daniel@makrotopia.org>
	<170142826116.3357002.9561246405642038358.b4-ty@kernel.org>
	<6577315e.050a0220.50f30.0122@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 11 Dec 2023 16:57:15 +0100 Christian Marangi wrote:
> > [1/2] leds: trigger: netdev: extend speeds up to 10G
> >       commit: bc8e1da69a68d9871773b657d18400a7941cbdef
> > [2/2] docs: ABI: sysfs-class-led-trigger-netdev: add new modes and entry
> >       commit: f07894d3b384344c43be1bcf61ef8e2fded0efe5
> >  
> 
> Hi, Lee
> 
> I'm working on adding LEDs support for qca8081 PHY. This PHY supports
> 2500 link speed.
> 
> Is it possible to have an immutable branch for this series so we can
> have this in net-next? 
> 
> Jakub can you also help with this?

I'm guessing that if it's already applied - it's already applied.

Lee, we seem to be getting quite a few LEDs/netdev patches - do you
reckon we should ask Konstantin for a separate repo to which we can
both apply, and then merge that into our respective trees? Because
stacking the changes on stable branches may get weird and/or error
prone. Or is separate tree an overkill at this stage? IDK..

