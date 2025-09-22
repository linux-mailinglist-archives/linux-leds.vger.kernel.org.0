Return-Path: <linux-leds+bounces-5541-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D02C9B929C3
	for <lists+linux-leds@lfdr.de>; Mon, 22 Sep 2025 20:36:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A64F2A6088
	for <lists+linux-leds@lfdr.de>; Mon, 22 Sep 2025 18:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23CA531A54C;
	Mon, 22 Sep 2025 18:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Rq8DOSPV"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC909315D46;
	Mon, 22 Sep 2025 18:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758566165; cv=none; b=ci887V1wrtPxt1gVzGqxHkY5v9ym33DYq1cJTcGgneZskXs8jr3oa3B2AOz6rxkeg6cRpbrjNO7VN8G3ZOQJNHZy15YynkdLgyB//0SyBBLNTIpMqZJRhGuzEHAudBrbnxHAYOeMWzii1oftP37LRj/Go23OAt/fjwJ2GLSL1CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758566165; c=relaxed/simple;
	bh=2cJWyVyj/GX3tOPewGqEX910nRTlTV+vvZm81KH82aE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z5ttdwfFnjNWVvu1reDGUnvuvrv7NYcpEAj7QhCCO+ZxtfISs6lWT+8AYBqkG7TbIW8MiLU7SZqP1MD9F+PjhcLTL2cl0HyWwyEtNUk3WPZrQVwEhAS5JhNW0YE1DIZcuZewTsu4bygVNoOO4vnXVf3wK1Jd28QxZkDzHw8bLnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Rq8DOSPV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E24C0C4CEF5;
	Mon, 22 Sep 2025 18:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1758566163;
	bh=2cJWyVyj/GX3tOPewGqEX910nRTlTV+vvZm81KH82aE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rq8DOSPViLcz6EEOWINWJHoOxVzI7qiZeO5lm1nz5oFG3NLFO5KgCjQAs4JV8AEpl
	 MG93z+Q4kXzQvTOb6GEmAupmbWLcnYujpSAwu3RyAzzUsBiXiKaYtvBazT1qYM2K8o
	 23BL4TZk03pTUUSqjILZbM15UVN2peTMwPLU4NTI=
Date: Mon, 22 Sep 2025 20:36:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Nam Tran <trannamatk@gmail.com>
Cc: lee@kernel.org, pavel@kernel.org, rdunlap@infradead.org,
	christophe.jaillet@wanadoo.fr, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v14 0/4] leds: add new LED driver for TI LP5812
Message-ID: <2025092259-stranger-affecting-1c75@gregkh>
References: <2025091113-mournful-smirk-8e03@gregkh>
 <20250922181341.10761-1-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250922181341.10761-1-trannamatk@gmail.com>

On Tue, Sep 23, 2025 at 01:13:41AM +0700, Nam Tran wrote:
> On Thu, 11 Sep 2025, Greg KH wrote:
> 
> > On Sun, Sep 07, 2025 at 11:09:40PM +0700, Nam Tran wrote:
> > > This patch series adds initial support for the TI LP5812,
> > > a 4x3 matrix RGB LED driver with autonomous engine control.
> > > This version provides a minimal, clean implementation focused
> > > on core functionality only. The goal is to upstream a solid
> > > foundation, with the expectation that additional features can
> > > be added incrementally in future patches.
> > > 
> > > The driver integrates with the LED multicolor framework and
> > > supports a set of basic sysfs interfaces for LED control and
> > > chip management.
> > > 
> > > Signed-off-by: Nam Tran <trannamatk@gmail.com>
> > 
> > The sysfs api is really odd here.  WHy not do the same thing as this
> > other controller recently submitted does:
> > 	https://lore.kernel.org/r/20250911-v6-14-topic-ti-lp5860-v3-0-390738ef9d71@pengutronix.de
> 
> Thank you for the feedback!
> I agree that consistency is important, and I've reviewed the patch you referenced.
> 
> I also checked the LP5860 datasheet and noticed that its driver exposes sysfs entries
> for configuring registers like `R_current_set`, `G_current_set`, and `B_current_set`.
> Similarly, the LP5812 requires register-level configuration for operation.
> 
> In my driver, I've implemented the following sysfs attributes:
> - '/sys/bus/i2c/devices/.../lp5812_chip_setup/dev_config' - Configures drive mode and
> scan order (Dev_Config_1 and Dev_Config_2 registers).
> - '/sys/bus/i2c/devices/.../lp5812_chip_setup/sw_reset' - Triggers a software reset of
> the device (Reset register).
> - '/sys/bus/i2c/devices/.../lp5812_chip_setup/fault_clear' - Clears fault status
> (Fault_Clear register).
> - '/sys/class/leds/led_<id>/activate' - Activate or deactivate the specified LED channel
> in runtime (led_en_1, led_en_2 registers).
> - '/sys/class/leds/led_<id>/led_current' - To change DC/PWM current level of each led
> (Manual_DC_xx and Manual_PWM_xx registers).
> - '/sys/class/leds/led_<id>/max_current' - To show max current setting (Dev_Config_0 register).
> - '/sys/class/leds/led_<id>/lod_lsd' - To read lod, lsd status of each LED
> (LOD_Status_0, LOD_Status_1, LSD_Status_0, LSD_Status_1 registers).
> 
> These attributes map directly to LP5812 registers. I’ve kept the interface minimal and
> focused only on essential functionality needed to operate the device.
> 
> If any of these attributes seem unconventional or redundant, I’d appreciate clarification
> so I can revise accordingly.
> 
> > but better yet, why does this need to be a kernel driver at all?  Why
> > can't you just control this directly from userspace with a program
> > there?
> 
> LP5812 is controlled via I2C, and its register map is non-trivial. Moving control to userspace
> would require users to manually handle I2C transactions and understand the register layout,
> which is error-prone and not user-friendly.

So you write it once in a library, or in a userspace program, and it is
done.  Don't expose these low-level things in a custom api that could be
done in userspace instead.

> Moreover, the driver integrates with the LED multicolor framework, allowing standardized control
> via existing userspace tools. This abstraction is difficult to achieve reliably from userspace alone.

But this is a custom api for the leds, not like any other one out there.
So how would it integrate with anything else?

> > For USB, we generally do not allow these types of crazy apis to be added
> > to the kernel when controlling the device can be done from userspace.  I
> > think the same thing can happen here too, right?
> 
> USB devices benefit from standardized descriptors and interfaces, which reduce the need for custom
> sysfs APIs. In contrast, LP5812 has no such standard interface, and some customization is necessary.

Many USB devices do not benifit from that at all, you directly control
them from userspace using vendor-specific apis.  Just like this device,
nothing different just because it is an i2c device.

> I’m open to improving the sysfs interface or moving parts to another method if that’s more appropriate.
> Please let me know which specific changes you’d recommend.

sysfs really doesn't seem to be the correct api here, you are making a
custom one just for this one device that is not shared by any other one,
so userspace has to write custom code to control it.  So why not just
write one program, in userspace, to handle it all at once, instead of 2?

> For completeness, I considered these methods:
> - sysfs: Recommended and standard for LED drivers.
> - i2c-tools: Not recommended, intended for development/debug only.
> - ioctl: Not recommended for new LED drivers.
> - debugfs: For debugging only.
> - Direct I2C register access: Requires users to know the register map and protocol.

A library will handle the i2c direct register access.  Again, do not
make custom sysfs apis if at all possible.

thanks,

greg k-h

