Return-Path: <linux-leds+bounces-185-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA417FA027
	for <lists+linux-leds@lfdr.de>; Mon, 27 Nov 2023 13:59:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98617B20E9D
	for <lists+linux-leds@lfdr.de>; Mon, 27 Nov 2023 12:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C52A288A7;
	Mon, 27 Nov 2023 12:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="QuZXhlD4"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C715818A;
	Mon, 27 Nov 2023 04:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KNlwQ+EpDzbvhIrjpzXpPnu6zDb9H31bxvZBDY3/C6E=; b=QuZXhlD46PqKuZIl8Aw0YL4oMY
	e+eABfs6RBq3W0Xogukvs2xeFDRBvnEfBHadSy5bKwdh2fsuVHtU0XvqniKPRjbb6MJpQvmUK1g2m
	4GedfEerjQoE12qAELT7ACJtcjr7ubIKYjnLeCWIezaG5gC3Q+BCGg4ABF8iPWJh6dMY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r7bCN-001LBH-7B; Mon, 27 Nov 2023 13:58:51 +0100
Date: Mon, 27 Nov 2023 13:58:51 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Li Zetao <lizetao1@huawei.com>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] leds: trigger: netdev: extend speeds up to 10G
Message-ID: <25ec2bbe-bced-448a-9852-3f81932fbb52@lunn.ch>
References: <120eddc938b588622020822510e3c19a4d169686.1701035950.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <120eddc938b588622020822510e3c19a4d169686.1701035950.git.daniel@makrotopia.org>

On Sun, Nov 26, 2023 at 10:07:18PM +0000, Daniel Golle wrote:
> Add 2.5G, 5G and 10G as available speeds to the netdev LED trigger.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> ---
> v2: add missing sysfs entries
> 
>  drivers/leds/trigger/ledtrig-netdev.c | 32 ++++++++++++++++++++++++++-
>  include/linux/leds.h                  |  3 +++

Sorry, missed it the first time. Please extend
Documenation/ABI/testing/sysfs-class-led-trigger-netdev.

	Andrew

