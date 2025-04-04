Return-Path: <linux-leds+bounces-4403-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7036A7C049
	for <lists+linux-leds@lfdr.de>; Fri,  4 Apr 2025 17:10:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C5DC3B633A
	for <lists+linux-leds@lfdr.de>; Fri,  4 Apr 2025 15:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1273C1EFFB4;
	Fri,  4 Apr 2025 15:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FAaORcKG"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B281EF0AE
	for <linux-leds@vger.kernel.org>; Fri,  4 Apr 2025 15:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743779447; cv=none; b=qKT1P8jvPrm0BijIMvRdNhfG+dVFTDIBDtDSEpXoW7jsGA928osfRqkGxkKSmuj0MMj7U48C8b+mU3icEQmqsgsq4rWat4+M21x/onfLsK+EihQcco4T0f7by+T2L1aSW1usm9UMp/hlhkGKVoMONiphRkX6Oc06u7XyE0p7ul4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743779447; c=relaxed/simple;
	bh=Q9JPyfv6LpHrebW9/7QuXE1It8xryL7t1lC3Ya0E5yY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XsyRGFBaqkRXrVDmqnlqNjMM/PvAHEegaFsiyUjSKXNNOQRQ5XkayaXiSJRWMb3XRWfw0uiJ8NSS9PoFEwDGtz1rhTQwPjAo1kmB70DmpYICJ6v0YBJKJ8/yXRKBdXZWDZAKRS4OUuW0HpcXPKqaLizZg6oKbmrtYFIFOql9XXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FAaORcKG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABD4CC4CEDD;
	Fri,  4 Apr 2025 15:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743779445;
	bh=Q9JPyfv6LpHrebW9/7QuXE1It8xryL7t1lC3Ya0E5yY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FAaORcKGjRayvr1AE30OO/5HBP+U7m+4FKppbIf5z8Pa5A7cj2PS2PHLH2AiaxHIN
	 bNXaTHMPka231G6/7F4P2uatk+tMQ89NhexFl1Nk4pzS5xaOp336E5yLM1ajF53ZDG
	 c5rYyyA2OBsrhBGoNOR/192RBXuwnzdLfOFxxEjqCCCVGQ5EylOvRY5rroQNbaJtQL
	 XYRIif6jS0kqiRhdegUr+EUQCrAbbkj3917040WtNezPp62x/9IIixTdaYWRpe6QTU
	 A4+t+oHWdBDCHggDhNaZOLVZVUoRgZE6LxBjapJADsAzoHtU9jQJxqrFpts9uQCoGU
	 w+S9SPbxSS5sg==
Date: Fri, 4 Apr 2025 16:10:42 +0100
From: Lee Jones <lee@kernel.org>
To: Tobias Junghans <tobias.junghans@inhub.de>
Cc: linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: trigger: netdev: Match net in netdev_trig_notify()
Message-ID: <20250404151042.GC372032@google.com>
References: <20250401085002.492904-1-tobias.junghans@inhub.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401085002.492904-1-tobias.junghans@inhub.de>

On Tue, 01 Apr 2025, Tobias Junghans wrote:

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
> index 4b0863db901a..1d620149c071 100644
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
> +	bool same_net = trigger_data->net == NULL || (dev && net_eq(dev_net(dev), trigger_data->net));

Doesn't looks like 'dev' can be NULL, so:

  !trigger_data->net || net_eq(dev_net(dev), trigger_data->net);

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

