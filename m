Return-Path: <linux-leds+bounces-353-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFB9810DE1
	for <lists+linux-leds@lfdr.de>; Wed, 13 Dec 2023 11:06:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DCFDB20C0C
	for <lists+linux-leds@lfdr.de>; Wed, 13 Dec 2023 10:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 755B022314;
	Wed, 13 Dec 2023 10:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="OPwMqNJt"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC9E883;
	Wed, 13 Dec 2023 02:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=DU16zi8C8rSb8wBiZF7N3q5YkCOaje3ALTOIqa12Rls=; b=OPwMqNJtYxJY74GOJZ4kO51X7g
	CRxANP+hAK0KpzshNF07PUR0Z48SMf9MSWT/vxNbOjCzx/Wtrf3q/8vW5QSwBhIQJfx/rfvBb2cR7
	UyOFgxfKlcbSqKAeHanauqtRS+Z0qgc/GTsF6IwSrtXinvZQYH7XCS9lSvPYYpeNkLgM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rDM8Y-002nvF-5G; Wed, 13 Dec 2023 11:06:42 +0100
Date: Wed, 13 Dec 2023 11:06:42 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>,
	Li Zetao <lizetao1@huawei.com>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Subject: Re: [PATCH] leds: trigger: netdev: display only supported link speed
 attribute
Message-ID: <8cb5f20f-f9da-4d26-af2d-f63771990fd3@lunn.ch>
References: <20231209150724.25565-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231209150724.25565-1-ansuelsmth@gmail.com>

On Sat, Dec 09, 2023 at 04:07:24PM +0100, Christian Marangi wrote:
> With the addition of more link speed mode to the netdev trigger, it was
> pointed out that there may be a problem with bloating the attribute list
> with modes that won't ever be supported by the trigger as the attached
> device name doesn't support them.
> 
> To clear and address this problem, change the logic where these
> additional trigger modes are added.
> 
> Since the netdev trigger REQUIRE a device name to be set, attach to the
> device name change function additional logic to parse the supported link
> speed modes using ethtool APIs and add only the supported link speed
> modes attribute.
> 
> This only apply to the link speed modes and every other mode is still
> provided by default.

Deleting the file and then re-creating it is not so nice when handling
user space. Have you tried this while holding the file open?

Please take a look at the is_visible() method of a sysfs group. If it
returns 0, the file is simply not visible in sysfs, but it still
exists. It is not a problem if a process holds it open when it becomes
invisible.

    Andrew

---
pw-bot: cr

