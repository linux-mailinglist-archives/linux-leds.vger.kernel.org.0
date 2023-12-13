Return-Path: <linux-leds+bounces-362-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B97A48117AF
	for <lists+linux-leds@lfdr.de>; Wed, 13 Dec 2023 16:43:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE31228606A
	for <lists+linux-leds@lfdr.de>; Wed, 13 Dec 2023 15:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AC6C381D9;
	Wed, 13 Dec 2023 15:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T2sHLqfX"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA2E364B1
	for <linux-leds@vger.kernel.org>; Wed, 13 Dec 2023 15:38:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C816BC433C7;
	Wed, 13 Dec 2023 15:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702481882;
	bh=gScubWv7+ZzEnPJcCeVKQ22MVXXXNr97yRWbtv+NF0g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=T2sHLqfXvg9T3II4rQGTdcTvXulOsp7sNYJ54yV3gHU0Jgfaq31E4smT+XznySFO3
	 LgGM+9Z6QLRZwxj5Bu7Y/2vsNVQp9NczPM2L0nCEW1tJdKkUBJmgyUTnP+y7W0zvbE
	 1IwoIqbhmABGes3iWB8/e2KVEHasTZbFOlhlnJ0oaI6gg0b+EWqGc6z+kFs2KsBx92
	 57NvpXzl11/wqIraHM4jZFUd/aZn9rXSXXQGvAUbO2YG/hDQwH5V3SIdDraUFkrU8w
	 mr5BQSeQUa4hFxTk2pEHhoQ/yU9RAaJHHDEUOJ2VLbhp8Bwnpk2xldeEs98fD3tfA9
	 Hnsrbi+hC8Zcg==
Date: Wed, 13 Dec 2023 16:37:57 +0100
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, Jakub Kicinski
 <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Daniel Golle
 <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>, Li Zetao
 <lizetao1@huawei.com>, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 1/2] leds: trigger: netdev: display only supported
 link speed attribute
Message-ID: <20231213163757.1d576bb7@dellmb>
In-Reply-To: <20231213150033.17057-1-ansuelsmth@gmail.com>
References: <20231213150033.17057-1-ansuelsmth@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

> +	/* Display only supported entry */
> +	if (attr == &dev_attr_link_10.attr &&
> +	    (test_bit(ETHTOOL_LINK_MODE_10baseT_Half_BIT, supported_link_speed) ||
> +	     test_bit(ETHTOOL_LINK_MODE_10baseT_Full_BIT, supported_link_speed)))
> +		return attr->mode;
> +
> +	if (attr == &dev_attr_link_100.attr &&
> +	    (test_bit(ETHTOOL_LINK_MODE_100baseT_Half_BIT, supported_link_speed) ||
> +	     test_bit(ETHTOOL_LINK_MODE_100baseT_Full_BIT, supported_link_speed)))
> +		return attr->mode;
> +
> +	if (attr == &dev_attr_link_1000.attr &&
> +	    (test_bit(ETHTOOL_LINK_MODE_1000baseT_Half_BIT, supported_link_speed) ||
> +	     test_bit(ETHTOOL_LINK_MODE_1000baseT_Full_BIT, supported_link_speed)))
> +		return attr->mode;
> +
> +	if (attr == &dev_attr_link_2500.attr &&
> +	    test_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT, supported_link_speed))
> +		return attr->mode;
> +
> +	if (attr == &dev_attr_link_5000.attr &&
> +	    test_bit(ETHTOOL_LINK_MODE_5000baseT_Full_BIT, supported_link_speed))
> +		return attr->mode;
> +
> +	if (attr == &dev_attr_link_10000.attr &&
> +	    test_bit(ETHTOOL_LINK_MODE_10000baseT_Full_BIT, supported_link_speed))
> +		return attr->mode;

Why only the T modes? There are much more ethtool modes for these
speeds, for example at least 5 modes for 1000 mbps speed:
  1000baseT_Half
  1000baseT_Full
  1000baseKX_Full
  1000baseX_Full
  1000baseT1_Full

There are also 2 possible modes for 2500 mbps
  2500baseT
  2500baseX

Ditto for 10 mbps and 100 mbps.

So if you're doing this, why not do it properly?

There is an aarray
  static const struct phy_setting settings[]
in
  drivers/net/phy/phy-core.c
and a function phy_speeds() which will tell you which speeds are
supported for a given ethtool mode bitmap.

Or you can add another function there,
  bool phy_speed_supported(unsigned long mask, unsigned int speed)
and use that one.

Marek

