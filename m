Return-Path: <linux-leds+bounces-317-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E717180A427
	for <lists+linux-leds@lfdr.de>; Fri,  8 Dec 2023 14:08:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A27A2281B99
	for <lists+linux-leds@lfdr.de>; Fri,  8 Dec 2023 13:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB9731C691;
	Fri,  8 Dec 2023 13:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="6I+obFWl"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2196C171F;
	Fri,  8 Dec 2023 05:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=2uqrxoJfKu97qTEB3nwXnMLgOA8AJ2MT8uVklnbJidk=; b=6I+obFWleDOwa+2LqL7HXGXT+J
	8l1Kz4XRqO89xKXU7AEyM6dT4XM3X5AJovokahzxzKNyVjlP+sQcZ/4UH/D29bd8AJNhGhj5is9JG
	SfeYoxKdIKzhDsqz0MydIAL5PsOvNM7JL1xWbjj1hhz+MWzqqA+KhdoUrv5O4n0OR/9E=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rBaap-002Ptv-Ge; Fri, 08 Dec 2023 14:08:35 +0100
Date: Fri, 8 Dec 2023 14:08:35 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: Daniel Golle <daniel@makrotopia.org>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, Jakub Kicinski <kuba@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Li Zetao <lizetao1@huawei.com>, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 1/2] leds: trigger: netdev: extend speeds up to 10G
Message-ID: <b052c43c-5f4c-4cfa-8779-3dc66a451c4e@lunn.ch>
References: <99e7d3304c6bba7f4863a4a80764a869855f2085.1701143925.git.daniel@makrotopia.org>
 <20231207172923.62ce530e@dellmb>
 <cdcab57e-ef73-436d-8dac-f92219e4cbf9@lunn.ch>
 <20231208075804.4f8559e6@dellmb>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208075804.4f8559e6@dellmb>

> What if the netdev does not have a PHY? The MAC also has speed
> information.

The ethtool API provides a list of link modes the MAC supports:

/usr/sbin/ethtool enp2s0
Settings for enp2s0:
	Supported ports: [ TP	 MII ]
	Supported link modes:   10baseT/Half 10baseT/Full
	                        100baseT/Half 100baseT/Full
	                        1000baseT/Full

The MAC driver can provide this information by calling into phylib or
phylink, or it can do it some other way. In fact, none of the LED code
goes direct to the PHY when determining when to blink in software, its
all via the struct net_device.

We should use the ethtool API to determine which speed sysfs files
should exist.

       Andrew

