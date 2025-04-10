Return-Path: <linux-leds+bounces-4456-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3812A84E4C
	for <lists+linux-leds@lfdr.de>; Thu, 10 Apr 2025 22:39:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 112519A609E
	for <lists+linux-leds@lfdr.de>; Thu, 10 Apr 2025 20:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7040928FFFC;
	Thu, 10 Apr 2025 20:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="wJKaM7wE"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0755290086;
	Thu, 10 Apr 2025 20:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744317585; cv=none; b=dkCbllSLH/IsC02I23DMGCXludYBWY3mOVjDSMz5X0SL8KinPYsr4ni2x4X+rjOu8kTseWJr5VxpKXeKvABiLpSll4OEGWTIWr5yKwqmCuhv7CaslOs/a6AVwOBUUS2o5S0jXjdPV0AAIY50roX5j65WBgg9a1hHajmipsc6eHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744317585; c=relaxed/simple;
	bh=2PzKMo4/Mmm0djd3Z1rt2RMSVKmRTqQOhJRhq6bOAOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J3qbUaKd5AOTCITfBlQLFQ01zHwl13Vjpk5SIcm78MMIBOxZonWeYQXhqEgd1iEOi8RDjbD8augHb9QWl9/4q6I553GJG59FKR4WqOgNxzhQcyturJjPp/SozYX0zBM8wEUC/1NsdzWfdZMRoppTbeFB+ueQ8jqGHt/9RzmcSno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=wJKaM7wE; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=nyVxhwk8khAAGT0GsMYgITxfdJKZP7FZgRCWrgQbIxg=; b=wJKaM7wEEO2RhHUXQTFtTrw1Z4
	fvhxB6xDBGOVeQNxhrl0wD5/QviPBwfYjjK5yda1N/+VWtnj5FnSjjhWsjnc/1d4OaLNbSpfPZ0BB
	ksABJzU2xppKIcGva4J3iaYiV4nUrinAhIcusycNrqku0UG2gXVDEJKDtB9MR0Rp+yMQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u2ygU-008j9H-D1; Thu, 10 Apr 2025 22:39:38 +0200
Date: Thu, 10 Apr 2025 22:39:38 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lee Jones <lee@kernel.org>
Cc: Tobias Junghans <tobias.junghans@inhub.de>,
	Andrew Lunn <andrew+netdev@lunn.ch>, linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v2] leds: trigger: netdev: Match net in
 netdev_trig_notify()
Message-ID: <45822bb5-a408-42c1-85b7-e179789d586a@lunn.ch>
References: <20250404151042.GC372032@google.com>
 <20250407090455.677846-1-tobias.junghans@inhub.de>
 <20250410101759.GT372032@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410101759.GT372032@google.com>

On Thu, Apr 10, 2025 at 11:17:59AM +0100, Lee Jones wrote:
> Andrew et al., please could you verify for sanity?

Sorry, i did not see this before.

Maybe we need a new MAINTAINER entry for
drivers/leds/triggers/ledtrig-timer.c which points to the netdev list?

Humm:

./scripts/get_maintainer.pl drivers/leds/trigger/ledtrig-netdev.c 
Lee Jones <lee@kernel.org> (maintainer:LED SUBSYSTEM,commit_signer:4/4=100%)
Pavel Machek <pavel@kernel.org> (maintainer:LED SUBSYSTEM)
Andrew Lunn <andrew@lunn.ch> (commit_signer:2/4=50%)
Marek Vasut <marex@denx.de> (commit_signer:2/4=50%,authored:2/4=50%,added_lines:15/36=42%,removed_lines:3/8=38%)
Heiner Kallweit <hkallweit1@gmail.com> (commit_signer:1/4=25%,authored:1/4=25%,removed_lines:2/8=25%)
Lukasz Majewski <lukma@denx.de> (commit_signer:1/4=25%,authored:1/4=25%,added_lines:21/36=58%,removed_lines:3/8=38%)
linux-leds@vger.kernel.org (open list:LED SUBSYSTEM)
linux-kernel@vger.kernel.org (open list)


So i should of been Cc:ed.

Network names spaces and files in /sysfs probably need netdev
involved, in order to get a good review.

> 
> On Mon, 07 Apr 2025, Tobias Junghans wrote:
> 
> > Different network devices may have the same device name if they are in
> > different network namespaces. This confuses ledtrig-netdev and leads to
> > undesired effects in certain situations.
> > 
> > When setting device_name to eth0, the trigger is attached to the
> > corresponding (physical) network device. Later a Docker container is
> > started. Docker now creates a virtual Ethernet interface (vethXXXX),
> > moves it to the container's net namespace and renames it to "eth0".
> > Subsequently ledtrig-netdev receives a NETDEV_CHANGENAME notification,
> > recognizes "eth0" as device and and switches its activity over to this
> > device. As a result the LED no longer blinks for the original (physical)
> > network device.

O.K. That make sense. So far, this has most been used in the embedded
world, which does not normally have containers etc.

> > The described erroneous behavior can be fixed by tracking and comparing
> > the network namespaces of network devices.

I think we need to go through the use cases, because i'm not sure the
netns is always obvious. When device_name_store() is called, what
netns is being referenced? Only some parts of /sysfs are netns aware.

I partially agree with tracking the network name space of
device. However, a struct net_device is unique. An LED trigger bound
to that netdev should follow that netdev as it moves between name
spaces. The trigger itself has no real concept of a name space, it is
the netdev which is in the name space. So where ever possible,
comparisons should be made based on struct netdev.

In order to make this easier to understand, it might be necessary to
break up netdev_trig_notify(). UNREGISTER, UP and CHANGE should match
based on netdev, and the name should not matter.

REGISTER is used to associate a netdev to a trigger, when all we know
is the name of the netdev, but don't yet have a pointer to it. Here i
agree we need to somehow know the netns:name tuple in order for the
match to work.

CHANGENAME falls into both camps. It could be a netdev associated to a
trigger which is changing name, so we need to follow that name
change. Or it could be a trigger which is not yet associated to a
netdev, and the new name of the netdev now matches the trigger, and so
the netdev needs to be associated to the trigger.

So i think in order to get a good understanding of what is going on,
it might be necessary to break this patch up, and have good commit
messages explaining what use cases each patch is addressing.

> > Signed-off-by: Tobias Junghans <tobias.junghans@inhub.de>
> > ---
> >  drivers/leds/trigger/ledtrig-netdev.c | 14 +++++++++++---
> >  1 file changed, 11 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
> > index 4b0863db901a..72bcb86cdcdb 100644
> > --- a/drivers/leds/trigger/ledtrig-netdev.c
> > +++ b/drivers/leds/trigger/ledtrig-netdev.c
> > @@ -62,6 +62,7 @@ struct led_netdev_data {
> >  
> >  	struct led_classdev *led_cdev;
> >  	struct net_device *net_dev;
> > +	struct net *net;
> >  
> >  	char device_name[IFNAMSIZ];
> >  	atomic_t interval;
> > @@ -274,6 +275,7 @@ static int set_device_name(struct led_netdev_data *trigger_data,
> >  	if (trigger_data->net_dev) {
> >  		dev_put(trigger_data->net_dev);
> >  		trigger_data->net_dev = NULL;
> > +		trigger_data->net = NULL;
> >  	}
> >  
> >  	memcpy(trigger_data->device_name, name, size);
> > @@ -284,6 +286,8 @@ static int set_device_name(struct led_netdev_data *trigger_data,
> >  	if (trigger_data->device_name[0] != 0)
> >  		trigger_data->net_dev =
> >  		    dev_get_by_name(&init_net, trigger_data->device_name);

Given we are talking about network name spaces, is the usage of
init_net correct here?

	Andrew

