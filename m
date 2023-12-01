Return-Path: <linux-leds+bounces-234-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD72C8015CA
	for <lists+linux-leds@lfdr.de>; Fri,  1 Dec 2023 22:57:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99518281CED
	for <lists+linux-leds@lfdr.de>; Fri,  1 Dec 2023 21:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3CB75A0F7;
	Fri,  1 Dec 2023 21:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="d1eqoEMz"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 936D5F4;
	Fri,  1 Dec 2023 13:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=c24QmA3+untiwBEp6FWSdMisTTqrv2ueZSSnx7g0vaI=; b=d1eqoEMzKyJWi6561R0SnbcnZA
	w8NfugKFpzDvuoGqoJXQJWpBXvBQmhz6ad1tI7O7B5RSE//CqAGl9rf6NHymR13iYHDZWYBIxO1aK
	vtOu1nnK06ah+hGRrrkLGJLlthRQ/V3FgQ4ZjsqtyWk4PoeyMK8WwhUBMr8FXOdLIM6w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r9BVe-001nyW-3k; Fri, 01 Dec 2023 22:57:18 +0100
Date: Fri, 1 Dec 2023 22:57:18 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>, Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH v2] leds: trigger: netdev: fix RTNL handling to prevent
 potential deadlock
Message-ID: <b7ac7af8-5979-404f-a11a-ad558658e1f1@lunn.ch>
References: <fb5c8294-2a10-4bf5-8f10-3d2b77d2757e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb5c8294-2a10-4bf5-8f10-3d2b77d2757e@gmail.com>

On Fri, Dec 01, 2023 at 11:23:22AM +0100, Heiner Kallweit wrote:
> When working on LED support for r8169 I got the following lockdep
> warning. Easiest way to prevent this scenario seems to be to take
> the RTNL lock before the trigger_data lock in set_device_name().
> 

> Fixes: d5e01266e7f5 ("leds: trigger: netdev: add additional specific link speed mode")
> Cc: stable@vger.kernel.org
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

