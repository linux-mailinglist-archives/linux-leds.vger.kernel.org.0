Return-Path: <linux-leds+bounces-4452-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 929D6A84065
	for <lists+linux-leds@lfdr.de>; Thu, 10 Apr 2025 12:18:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E308165078
	for <lists+linux-leds@lfdr.de>; Thu, 10 Apr 2025 10:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7E8F280A58;
	Thu, 10 Apr 2025 10:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bM4P97s8"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE1A27D76D;
	Thu, 10 Apr 2025 10:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744280283; cv=none; b=DOniaReUzExWCWg+Afsr31LSkzhsB0CHAKN9MLEYrqnGYLeOg1+HF8e5IiaFSxnZt6PVc3nWIE4I9r7GUGjzrC3iBYnBEU7RRUNJNl5WxIPYy1BBW36v4aJPSjzl1KVFyYXCko/c0K4rd1paUcGO/GEbb3KyimET83B3HZby78s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744280283; c=relaxed/simple;
	bh=izfixqFRC26tMDB0uED0fmOd0FPop6vqhdr1xBb7/1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mTOB2e/mbRkGPnCsShfqTkHSIKS48EGqb027TgN5vttlGpKY1penaKVBRmT0OOV+i6spKGh8n7j5x7Inn5dEnNqXXFSoC0yQ4WLFTq/EF5qnZs335LUNE0njh8luwG8bvrh19uQqoWnu2F+0AxFRK9SMCl5i8DCo/ERAD9dICys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bM4P97s8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32588C4CEE3;
	Thu, 10 Apr 2025 10:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744280283;
	bh=izfixqFRC26tMDB0uED0fmOd0FPop6vqhdr1xBb7/1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bM4P97s8QJvl2xCmuw8s20lpBbUOmxDdGyfAQNO9JrjTnfrCwdNesXoAWYcqyISAp
	 wFqX9AQVZpbDsH5Qd7Ue6EiaoXTElvBA3HzrJl7Io/3i6ucZDHKGKgqGnt+2LywUsO
	 VhaE06KS7UfPe5uGjA06T6G6VXVQVM7ouxVTPqrv5eA2eZwPSspnST0No4O3zdftzo
	 W0wmM6+I7Nl/hkkzdUAACgOXJIpe8JU12A0ftQlnJbr9eF0c963oDmYVXQSbqmeL67
	 3UY5iSWnWIt8TYkfLcalxKwEcMuQU2IB57JDj2kf3GkiAL7ta2i9b1sHpMlYC1Qboc
	 8MvFAf5V4S8TA==
Date: Thu, 10 Apr 2025 11:17:59 +0100
From: Lee Jones <lee@kernel.org>
To: Tobias Junghans <tobias.junghans@inhub.de>,
	Andrew Lunn <andrew+netdev@lunn.ch>
Cc: linux-leds@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2] leds: trigger: netdev: Match net in
 netdev_trig_notify()
Message-ID: <20250410101759.GT372032@google.com>
References: <20250404151042.GC372032@google.com>
 <20250407090455.677846-1-tobias.junghans@inhub.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250407090455.677846-1-tobias.junghans@inhub.de>

Andrew et al., please could you verify for sanity?

On Mon, 07 Apr 2025, Tobias Junghans wrote:

> Different network devices may have the same device name if they are in
> different network namespaces. This confuses ledtrig-netdev and leads to
> undesired effects in certain situations.
> 
> When setting device_name to eth0, the trigger is attached to the
> corresponding (physical) network device. Later a Docker container is
> started. Docker now creates a virtual Ethernet interface (vethXXXX),
> moves it to the container's net namespace and renames it to "eth0".
> Subsequently ledtrig-netdev receives a NETDEV_CHANGENAME notification,
> recognizes "eth0" as device and and switches its activity over to this
> device. As a result the LED no longer blinks for the original (physical)
> network device.
> 
> The described erroneous behavior can be fixed by tracking and comparing
> the network namespaces of network devices.
> 
> Signed-off-by: Tobias Junghans <tobias.junghans@inhub.de>
> ---
>  drivers/leds/trigger/ledtrig-netdev.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
> index 4b0863db901a..72bcb86cdcdb 100644
> --- a/drivers/leds/trigger/ledtrig-netdev.c
> +++ b/drivers/leds/trigger/ledtrig-netdev.c
> @@ -62,6 +62,7 @@ struct led_netdev_data {
>  
>  	struct led_classdev *led_cdev;
>  	struct net_device *net_dev;
> +	struct net *net;
>  
>  	char device_name[IFNAMSIZ];
>  	atomic_t interval;
> @@ -274,6 +275,7 @@ static int set_device_name(struct led_netdev_data *trigger_data,
>  	if (trigger_data->net_dev) {
>  		dev_put(trigger_data->net_dev);
>  		trigger_data->net_dev = NULL;
> +		trigger_data->net = NULL;
>  	}
>  
>  	memcpy(trigger_data->device_name, name, size);
> @@ -284,6 +286,8 @@ static int set_device_name(struct led_netdev_data *trigger_data,
>  	if (trigger_data->device_name[0] != 0)
>  		trigger_data->net_dev =
>  		    dev_get_by_name(&init_net, trigger_data->device_name);
> +	if (trigger_data->net_dev)
> +		trigger_data->net = dev_net(trigger_data->net_dev);
>  
>  	trigger_data->carrier_link_up = false;
>  	trigger_data->link_speed = SPEED_UNKNOWN;
> @@ -573,15 +577,16 @@ static int netdev_trig_notify(struct notifier_block *nb,
>  	struct led_netdev_data *trigger_data =
>  		container_of(nb, struct led_netdev_data, notifier);
>  	struct led_classdev *led_cdev = trigger_data->led_cdev;
> +	bool same_net = !trigger_data->net || net_eq(dev_net(dev), trigger_data->net);
>  
>  	if (evt != NETDEV_UP && evt != NETDEV_DOWN && evt != NETDEV_CHANGE
>  	    && evt != NETDEV_REGISTER && evt != NETDEV_UNREGISTER
>  	    && evt != NETDEV_CHANGENAME)
>  		return NOTIFY_DONE;
>  
> -	if (!(dev == trigger_data->net_dev ||
> -	      (evt == NETDEV_CHANGENAME && !strcmp(dev->name, trigger_data->device_name)) ||
> -	      (evt == NETDEV_REGISTER && !strcmp(dev->name, trigger_data->device_name))))
> +	if (!((dev == trigger_data->net_dev && same_net) ||
> +	      (evt == NETDEV_CHANGENAME && !strcmp(dev->name, trigger_data->device_name) && same_net) ||
> +	      (evt == NETDEV_REGISTER && !strcmp(dev->name, trigger_data->device_name) && same_net)))
>  		return NOTIFY_DONE;
>  
>  	cancel_delayed_work_sync(&trigger_data->work);
> @@ -597,12 +602,14 @@ static int netdev_trig_notify(struct notifier_block *nb,
>  		dev_put(trigger_data->net_dev);
>  		dev_hold(dev);
>  		trigger_data->net_dev = dev;
> +		trigger_data->net = dev_net(dev);
>  		if (evt == NETDEV_CHANGENAME)
>  			get_device_state(trigger_data);
>  		break;
>  	case NETDEV_UNREGISTER:
>  		dev_put(trigger_data->net_dev);
>  		trigger_data->net_dev = NULL;
> +		trigger_data->net = NULL;
>  		break;
>  	case NETDEV_UP:
>  	case NETDEV_CHANGE:
> @@ -702,6 +709,7 @@ static int netdev_trig_activate(struct led_classdev *led_cdev)
>  
>  	trigger_data->led_cdev = led_cdev;
>  	trigger_data->net_dev = NULL;
> +	trigger_data->net = NULL;
>  	trigger_data->device_name[0] = 0;
>  
>  	trigger_data->mode = 0;
> -- 
> 2.43.0
> 
> 

-- 
Lee Jones [李琼斯]

