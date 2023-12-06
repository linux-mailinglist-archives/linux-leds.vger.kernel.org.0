Return-Path: <linux-leds+bounces-260-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DCA806595
	for <lists+linux-leds@lfdr.de>; Wed,  6 Dec 2023 04:21:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 939E71F2167B
	for <lists+linux-leds@lfdr.de>; Wed,  6 Dec 2023 03:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49E16D266;
	Wed,  6 Dec 2023 03:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JyPhFpIX"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F55CA7C;
	Wed,  6 Dec 2023 03:21:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53FF1C433C8;
	Wed,  6 Dec 2023 03:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701832870;
	bh=yywnjbuPZla/pSAJgzZ1cxKwAcBkdRc5SvoOnxevUBM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JyPhFpIXhAutoW4rlOpgkh2UDIULOr0kPmue3qZesZczxM9ptjyuG2miv+3GocLMa
	 2tAx3J+BJxaWSXf2cAaRpnY4Wx+7sXtP8tpH5rcevaI5AX5zOVXueBLvSXCNQLOG4k
	 sGGWflWiohPSWKouPu8npImvxxoRDunfDemufqOHbWtndMp0OJyozAmt3DAQ4PM+dr
	 80hLX+sbMTpWjJYgQv3rwA4Yf/1Pdaq6x8WHhS3+2cNhT3mzps9C2kiEkFcI9Wluf1
	 0AmuCu5O1c64yV14Ze9stMwRtJ5wvtfG1fTfrq1YcUehGinFpGjAC+tfxlMtdOzBGQ
	 VDzwVxyOCruUQ==
Date: Tue, 5 Dec 2023 19:21:09 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Christian Marangi
 <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Simon Horman
 <horms@kernel.org>
Subject: Re: [PATCH v2] leds: trigger: netdev: fix RTNL handling to prevent
 potential deadlock
Message-ID: <20231205192109.7c7fa56b@kernel.org>
In-Reply-To: <20231204144808.26083e8a@kernel.org>
References: <fb5c8294-2a10-4bf5-8f10-3d2b77d2757e@gmail.com>
	<20231204144808.26083e8a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 4 Dec 2023 14:48:08 -0800 Jakub Kicinski wrote:
> On Fri, 1 Dec 2023 11:23:22 +0100 Heiner Kallweit wrote:
> > When working on LED support for r8169 I got the following lockdep
> > warning. Easiest way to prevent this scenario seems to be to take
> > the RTNL lock before the trigger_data lock in set_device_name().  
> 
> Pavel/Lee, would you like to handle this patch?
> Or should we ship it to Linus on Thu?

Better safe than step on someone's toes, so I'll drop this version
from the netdev PW.

