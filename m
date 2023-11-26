Return-Path: <linux-leds+bounces-164-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F38CA7F9562
	for <lists+linux-leds@lfdr.de>; Sun, 26 Nov 2023 22:04:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE6D0280CA3
	for <lists+linux-leds@lfdr.de>; Sun, 26 Nov 2023 21:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54DFFDDB3;
	Sun, 26 Nov 2023 21:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="1YG5PQog"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A38C3FB;
	Sun, 26 Nov 2023 13:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=2Q5gstFNRlEEzWGzwLA8thOYmzjFADoIAcEoQZvU8YM=; b=1YG5PQogv1zRwXuePA2idU9Le/
	30M3s+T13yKZlnItm6mFjAwctlv0VdDnoD5f6ThykPkJq94btp99oCfsH8H7hJitLJwi9KIu1PATO
	zXGGoRnoh3XCZWDaZIQKfI8lcBtAl2nGmG7YJDpg82l36WVnKPYwGsrxzvLWuftGNnwU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r7MIg-001GvN-Se; Sun, 26 Nov 2023 22:04:22 +0100
Date: Sun, 26 Nov 2023 22:04:22 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Li Zetao <lizetao1@huawei.com>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: trigger: netdev: extend speeds up to 10G
Message-ID: <4bade634-f2f7-4bfc-b882-67cfe9e47b8f@lunn.ch>
References: <3655d56c08b60f0ce562ceab3a627fef046a7617.1701029732.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3655d56c08b60f0ce562ceab3a627fef046a7617.1701029732.git.daniel@makrotopia.org>

On Sun, Nov 26, 2023 at 08:17:03PM +0000, Daniel Golle wrote:
> Add 2.5G, 5G and 10G as available speeds to the netdev LED trigger.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

One thing to consider is how this get merged. I assume you will have a
PHY driver patch soon making use of this? We can either:

1) Get Lee to merge it into the LED tree and then create a stable
branch which gets pulled into netdev.

2) Merge into netdev, with Lees Acked-by: 

It seems unlikely there will be any merge conflicts. So netdev does
seem like an O.K. way to go.

    Andrew

