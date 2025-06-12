Return-Path: <linux-leds+bounces-4789-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C30C0AD65E0
	for <lists+linux-leds@lfdr.de>; Thu, 12 Jun 2025 04:57:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 518063ABAF6
	for <lists+linux-leds@lfdr.de>; Thu, 12 Jun 2025 02:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E11F51C861E;
	Thu, 12 Jun 2025 02:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="hMn6RkDB"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B244A28F1;
	Thu, 12 Jun 2025 02:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749697042; cv=none; b=ARk6yJuqCmpmzCykFrqFcqYc6+DRBRQZi1dW1rudGRda2Xl5sUNh3T5ECrxK3/DHpjs9SS6EgvrVuN97djY1k4fu1OpN08QbZaC5c8eK1Yu6mFNXjYH7UNHexwGyWe6td1L5Dy9cDl1lqOAiX1or39yILu7JAPyUtkzj+f/XqC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749697042; c=relaxed/simple;
	bh=fMhEhu1/yjPzJ03beow89CHuvunpI+dK0RfUI4ER5AU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QJy5Q4cfGVeQfcvvP9sWCDn9nlUv3WL4Mkd7mPmPrV8IVIdkfnXvwATsJfkRr2XMo9RG0qGwR/cg8KohclrLjwo8CqlYZM0NDSIvuUINv2PeV4gColIVCNdGhceSD2IwE4kwxVNh6MZ6TRRHWobe1N2P+9MgfOwLcpWXA8pfKmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=hMn6RkDB; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=YrPR7aNLenkb/rPbjtjgCOKJM1EhucRndbKS1dxSdOA=; b=hMn6RkDBQ13OFUEY+bLWzRemVy
	7d7NI61206fR4aq+H95Ov+LF09HPgXZoaDEDL1RMJ57vGADeCvc8ncchBQIJ1AC1phwMghrwIYmDR
	1hsJixUwDw19By2LQfyM9C8q++TAHFjob5rn6A2Xo+EwuV+pXu6xKd5BQIE74YwcEsmg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uPY7w-00FUGR-WF; Thu, 12 Jun 2025 04:57:17 +0200
Date: Thu, 12 Jun 2025 04:57:16 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Tobias Junghans <tobias.junghans@inhub.de>
Cc: Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 2/2] leds: trigger: netdev: refactor
 netdev_event_requires_handling()
Message-ID: <0bcb999e-f32c-499e-9a10-41334ffc2255@lunn.ch>
References: <20250610114029.268938-1-tobias.junghans@inhub.de>
 <20250610114029.268938-3-tobias.junghans@inhub.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610114029.268938-3-tobias.junghans@inhub.de>

On Tue, Jun 10, 2025 at 01:40:20PM +0200, Tobias Junghans wrote:
> If there are network devices with the same name in different
> namespaces, ledtrig-netdev gets confused easily and switches between
> these devices whenever there are NETDEV_CHANGENAME/NETDEV_REGISTER
> notifications.  This happens since ledtrig-netdev only checks for
> device name equality regardless of previous associations with another
> network device with the same name.
> 
> Real world example: eth0 is the primary physical network interface and
> ledltrig-netdev is associated with that interface. If now Docker creates
> a virtual Ethernet interface (vethXXXX), moves it to the
> container's net namespace and renames it to eth0, ledtrig-netdev
> switches to this device and the LED no longer blinks for the original
> (physical) network device.
> 
> Fix this by refactoring the conditions under which to handle netdev
> events:
> 
> - For processing NETDEV_REGISTER events, the device name has to match
>   and no association with a net_dev must exist.

Sorry for taking a while to review this. It took me a while to think
it through and produce a list of use cases. And might still be missing
some.

Given the complexity here, i actually think we need verbose comments
in the code.

> - For processing NETDEV_CHANGENAME events, the associated and notified
>   network device have to match. Alternatively the device name has to
>   match and no association with a net_dev must exist.
> 
> - For all other events, the associated and notified network device have
>   to match.
> 
> Signed-off-by: Tobias Junghans <tobias.junghans@inhub.de>
> ---
>  drivers/leds/trigger/ledtrig-netdev.c | 29 +++++++++++++++++++--------
>  1 file changed, 21 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
> index 6e16619719fe..a3f30e6f74b4 100644
> --- a/drivers/leds/trigger/ledtrig-netdev.c
> +++ b/drivers/leds/trigger/ledtrig-netdev.c
> @@ -578,15 +578,28 @@ static const struct attribute_group *netdev_trig_groups[] = {
>  static bool netdev_event_requires_handling(unsigned long evt, struct net_device *dev,
>  					   struct led_netdev_data *trigger_data)
>  {
> -	if (evt != NETDEV_UP && evt != NETDEV_DOWN && evt != NETDEV_CHANGE
> -	    && evt != NETDEV_REGISTER && evt != NETDEV_UNREGISTER
> -	    && evt != NETDEV_CHANGENAME)
> -		return false;
> -
> -	if (!(dev == trigger_data->net_dev ||
> -	     (evt == NETDEV_CHANGENAME && !strcmp(dev->name, trigger_data->device_name)) ||
> -	     (evt == NETDEV_REGISTER && !strcmp(dev->name, trigger_data->device_name))))

At the beginning of this function i would put some background.

/* /sys/class/leds is unaware of network names spaces. All LEDs will
   be visible in all network name spaces. However a network interface
   is only in one network name space. Interface names are unique
   within a network name space, but not across name spaces. The same
   name can appear in multiple name spaces. However the interface dev
   pointer is unique, and does not change when an interface moves
   between namespaces.

   LEDs can either support software blinking, hardware blinking for a
   netdev, or both. When the trigger is activated on an LED which
   supports hardware blinking for a netdev, a request will be made to
   get the struct device it blinks for. This may not be available,
   e.g. the PHY has not been associated to a MAC yet. However, if the
   device is known, the trigger is associated to the device.
*/

Right, in the process of writing this, i found another issue:

netdev_trig_activate() calls led_cdev->hw_control_get_device() to get
the device this LED can hardware blink for. From the device it gets
the name, and calls set_device_name(). set_device_name() then uses:
dev_get_by_name(&init_net, trigger_data->device_name) to convert the
name into a netdev. However, it is looking in the base network name
space, and there is no guarantee that it is where the device actually
is! We should actually use to_net_dev(dev) to get the struct
net_device, and pass that to set_device_name(), or a variant of it.

continuing...

/* If a hardware blinking LED cannot be associated to a device, its
   device name can be set the same as for a software blinking LED, via
   /sys/class/led/<LED>/device_name, once the device actually exists.
   An interface of that name will be found and associated to the
   trigger.
*/

And here is the next issue. It looks for the device in init_net, the
base network namespace. But if i've done something like:

$ ip netns exec n42 bash
$ echo eth24 > /sys/class/led/LED-wan/device_name

we want it to find eth24 in network name space n42.
device_name_store() has to be called in process context, and that
process must have a network namespace associated to it. But i've no
idea how you get to it, this is not something i've done before....

But i think set_device_name() needs to change, and not be hard coded
for init_net. We need to keep the netns in the trigger_data structure.

> +	switch (evt) {
> +	case NETDEV_REGISTER:

So, register...

	/* 1. The name and netns match to those set by
              /sys/class/led/.../device_name. Associate the device to
	      the trigger.

           2. The device was previously associated to this
	      trigger. The device has moved from one netns to another.
	      Reassociate the device to the trigger. The netns in trigger_data
	      needs updating, and the device might of changed name
	*/

> +		if (trigger_data->net_dev ||
> +		    strcmp(dev->name, trigger_data->device_name))
> +			return false;
> +		break;
> +	case NETDEV_CHANGENAME:

	/* 1. The device is associated to this trigger_data. Update
	      trigger_data->device_name with the new name.

           2. The trigger has no device associated to it. The new name
              of the device and its netns match those set via 
              /sys/class/led/.../device_name. Associate the device to
	      the trigger.
        */

> +		if (trigger_data->net_dev != dev &&
> +		    (trigger_data->net_dev ||
> +		     strcmp(dev->name, trigger_data->device_name)))
> +			return false;
> +		break;
> +	case NETDEV_UNREGISTER:

        /* Disconnect the device from the trigger. However, ensure it can be
	   reassociated if the device appears in a different namespace.

> +	case NETDEV_UP:
        /* When the interface was registered, it might not of had a PHY 
	   attached, so check if the PHYs LEDs support hardware blinking.
        */
> +	case NETDEV_DOWN:
> +	case NETDEV_CHANGE:

        /* Update LED state, including the link speed. */
> +		if (trigger_data->net_dev != dev)
> +			return false;
> +		break;

I'm not sure you can have a simple bool needs further
processing/ignore this event. When you get into the details, i think
you will find you will need to take actions depending on various
conditions.

Tomorrow i will look at the socket system calls and see how you get a
processes network namespace.

	Andrew

