Return-Path: <linux-leds+bounces-356-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FB88110BA
	for <lists+linux-leds@lfdr.de>; Wed, 13 Dec 2023 13:05:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BEA91C209CE
	for <lists+linux-leds@lfdr.de>; Wed, 13 Dec 2023 12:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2B2128DBE;
	Wed, 13 Dec 2023 12:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fWPgbClH"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4812286B6
	for <linux-leds@vger.kernel.org>; Wed, 13 Dec 2023 12:05:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58E06C433C8;
	Wed, 13 Dec 2023 12:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702469129;
	bh=x3oRn837VPa7bmsGIuv/KDiEKRYzL03PVgV7p67+CHQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fWPgbClHGcESgcgFfFV+nPKAvUcJrVYgQMbLkRIDX0gfSxTIDFSGWlL8xs4t5oKtA
	 X/3ua3ilSEnI4z88sykJ8WIfvy5Pwe/R4a8bNdOLqDgdyNekuNnN2nAE1F74HC1mx5
	 sRlUS3AJu/vhcNQmOgVKZ69M4RDN3K4Klr5bSFAUNTpjJrHS8RTmgernGm57gBNAB5
	 11s9TcnXYquMdLUYnr74m0Fwgo8Qc6icP/3t6rCZu8MPR3FNLkw5CUG4xYlWzGc0Rh
	 DvRqB4Mf81N9VMBM8mKb8LCucLwnOwze1rgp4Sfy3P3FyWGLivKdHWM/NKbiGGwyad
	 1zZU9O9iA0pWQ==
Date: Wed, 13 Dec 2023 13:05:21 +0100
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, Andrew Lunn
 <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Daniel Golle <daniel@makrotopia.org>, Li Zetao
 <lizetao1@huawei.com>, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: trigger: netdev: display only supported link
 speed attribute
Message-ID: <20231213130521.11513e0a@dellmb>
In-Reply-To: <20231209150724.25565-1-ansuelsmth@gmail.com>
References: <20231209150724.25565-1-ansuelsmth@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat,  9 Dec 2023 16:07:24 +0100
Christian Marangi <ansuelsmth@gmail.com> wrote:

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
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/leds/trigger/ledtrig-netdev.c | 56 +++++++++++++++++++++++----
>  1 file changed, 49 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
> index 09e75fd9f2bc..ce84808e231c 100644
> --- a/drivers/leds/trigger/ledtrig-netdev.c
> +++ b/drivers/leds/trigger/ledtrig-netdev.c
> @@ -61,6 +61,8 @@ struct led_netdev_data {
>  	bool hw_control;
>  };
>  
> +static int add_link_speed_attr(struct led_netdev_data *trigger_data);
> +
>  static void set_baseline_state(struct led_netdev_data *trigger_data)
>  {
>  	int current_brightness;
> @@ -262,8 +264,10 @@ static int set_device_name(struct led_netdev_data *trigger_data,
>  	trigger_data->carrier_link_up = false;
>  	trigger_data->link_speed = SPEED_UNKNOWN;
>  	trigger_data->duplex = DUPLEX_UNKNOWN;
> -	if (trigger_data->net_dev)
> +	if (trigger_data->net_dev) {
>  		get_device_state(trigger_data);
> +		add_link_speed_attr(trigger_data);
> +	}
>  
>  	trigger_data->last_activity = 0;
>  
> @@ -396,6 +400,50 @@ DEFINE_NETDEV_TRIGGER(full_duplex, TRIGGER_NETDEV_FULL_DUPLEX);
>  DEFINE_NETDEV_TRIGGER(tx, TRIGGER_NETDEV_TX);
>  DEFINE_NETDEV_TRIGGER(rx, TRIGGER_NETDEV_RX);
>  
> +static int add_link_speed_attr(struct led_netdev_data *trigger_data)
> +{
> +	struct led_classdev *led_cdev = trigger_data->led_cdev;
> +	struct device *dev = led_cdev->dev;
> +	struct ethtool_link_ksettings cmd;
> +	int ret;
> +
> +	/* First remove any entry previously added */
> +	device_remove_file(dev, &dev_attr_link_10);
> +	device_remove_file(dev, &dev_attr_link_100);
> +	device_remove_file(dev, &dev_attr_link_1000);
> +	device_remove_file(dev, &dev_attr_link_2500);
> +	device_remove_file(dev, &dev_attr_link_5000);
> +	device_remove_file(dev, &dev_attr_link_10000);

Noooooo!

> +	ret = __ethtool_get_link_ksettings(trigger_data->net_dev, &cmd);
> +	if (ret)
> +		return ret;
> +
> +	/* Add only supported entry */
> +	if (test_bit(ETHTOOL_LINK_MODE_10baseT_Half_BIT, cmd.link_modes.supported) ||
> +	    test_bit(ETHTOOL_LINK_MODE_10baseT_Full_BIT, cmd.link_modes.supported))
> +		device_create_file(dev, &dev_attr_link_10);
> +
> +	if (test_bit(ETHTOOL_LINK_MODE_100baseT_Half_BIT, cmd.link_modes.supported) ||
> +	    test_bit(ETHTOOL_LINK_MODE_100baseT_Full_BIT, cmd.link_modes.supported))
> +		device_create_file(dev, &dev_attr_link_100);
> +
> +	if (test_bit(ETHTOOL_LINK_MODE_1000baseT_Half_BIT, cmd.link_modes.supported) ||
> +	    test_bit(ETHTOOL_LINK_MODE_1000baseT_Full_BIT, cmd.link_modes.supported))
> +		device_create_file(dev, &dev_attr_link_1000);
> +
> +	if (test_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT, cmd.link_modes.supported))
> +		device_create_file(dev, &dev_attr_link_2500);
> +
> +	if (test_bit(ETHTOOL_LINK_MODE_5000baseT_Full_BIT, cmd.link_modes.supported))
> +		device_create_file(dev, &dev_attr_link_5000);
> +
> +	if (test_bit(ETHTOOL_LINK_MODE_10000baseT_Full_BIT, cmd.link_modes.supported))
> +		device_create_file(dev, &dev_attr_link_10000);
> +
> +	return 0;
> +}

This should be done via the is_visible sysfs attribute_group method.

Also documentation for the link_* files should be changed so that it
says that the files are present only if those speeds are available.

Marek

