Return-Path: <linux-leds+bounces-2468-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 86361954E80
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 18:11:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA4401C243A8
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 16:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA7681BE860;
	Fri, 16 Aug 2024 16:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LCVdQqVX"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6001BE250;
	Fri, 16 Aug 2024 16:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723824673; cv=none; b=cQbNxHAP4x4lHncrRyRGtTOTpiQVQTkRu1nK8SKAtP8jiWsQyz37NTFvswJSbEHYVZvYse3gRzWb1rTlv0A5g3+i9tNJrviHzEecuxss+4RUr4VaGBScrODdP1DCAqadfOOLgu39etO/BtY0w8djKNGvL9eIaruV0f+j8KL3ie4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723824673; c=relaxed/simple;
	bh=PAZUDvd3q0geB8ZyBW+JbD6diVUg9FTVP8/5lWsekH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TWyQHXWEQJJ4PFFeYEOpLvanyf+uSEb+ovn5v/Nxvdhwp2AE1Zgj7mACs8rFgGxnOZP0l+OtOtqLCU6OtNLQac7vw4kbqdL7mr/njWTTYopmYtjVaDvPX0yxSMpa0MxV21IqhRjr2QbnNbcr/dQErhGhuetGsP7UWw7gxucB4Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LCVdQqVX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D66CC32782;
	Fri, 16 Aug 2024 16:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723824673;
	bh=PAZUDvd3q0geB8ZyBW+JbD6diVUg9FTVP8/5lWsekH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LCVdQqVXxHIG4Fqy+dHCTby8UTLjQ0wy1RzFFqFnbc3hXiz6AuuoLoRnHnv13LPjH
	 E1G9GyOOigKUpl2ZfFRfFemxOSHfKtgmkmtypN8sc4v6l1BkgtUrUlMMiIzni7nUCY
	 uLhv99ScC4WnzwtPghpnndd1yWOOgiCHKG+h+VqZbReJA8xcFX1BImm/VsrqzIgpYY
	 tzZNFLRU9pWO4MFbf0Ty0d2kni2rTW0jXLgsBLLX2yACGUmKmDEHrleicq2gq5JNy5
	 Vs7C+jy4CdkNBnAVJUoOtIYavkUPixulLJu8YtCLr33MN1tbg27Z4LB0B7eZon2sUc
	 5Agh7iZPVMB+g==
Date: Fri, 16 Aug 2024 17:11:08 +0100
From: Lee Jones <lee@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Carlos Ferreira <carlosmiguelferreira.2003@gmail.com>,
	ilpo.jarvinen@linux.intel.com, Pavel Machek <pavel@ucw.cz>,
	mustafa.eskieksi@gmail.com, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linux LED Subsystem <linux-leds@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] HP: wmi: Add documentation for the LED API naming
 scheme
Message-ID: <20240816161108.GE5853@google.com>
References: <20240719100011.16656-1-carlosmiguelferreira.2003@gmail.com>
 <20240719100011.16656-3-carlosmiguelferreira.2003@gmail.com>
 <7bf12e39-8956-4cd3-a90a-871291d84370@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7bf12e39-8956-4cd3-a90a-871291d84370@redhat.com>

On Mon, 12 Aug 2024, Hans de Goede wrote:

> Hi all,
> 
> +Cc Pavel, Lee, linux-leds for review by the linux LED subsystem folks.
> 
> Pavel, Lee there are 2 pdx86 drivers for control of zoned (3/4 zones)
> RGB backlit laptop keyboards pending:
> 
> https://lore.kernel.org/platform-driver-x86/20240719100011.16656-2-carlosmiguelferreira.2003@gmail.com/
> https://lore.kernel.org/platform-driver-x86/20240806205001.191551-2-mustafa.eskieksi@gmail.com/
> 
> both of these will use 1 multicolor LED class device per keyboard zone,
> using the naming convention documented in this patch.
> 
> It would be good if we can get feedback or an ack from you for this
> userspace API before merging these drivers.
> 
> Note the first part of the patch documents the already existing naming
> scheme for single zone (RGB or mono color) backlight keyboards. This
> scheme is already used by many drivers and by userspace consumers like
> upower. So this is just documenting existing userspace API which so far
> was not documented.
> 
> 
> Carlos, Thank you for writing this patch.
> 
> For v2 please change the patch subject to:
> 
> "Documentation: leds: leds-class: Add documentation for keyboard backlight LED device names"
> 
> and this should also be merged through the LED subsystem tree, so for v2
> please send this to Pavel + Lee with linux-leds + platform-driver-x86
> in the Cc.

Please use get_maintainer.pl when submitting patches:

  % ./scripts/get_maintainer.pl -f Documentation/leds/leds-class.rst
  Pavel Machek <pavel@ucw.cz> (maintainer:LED SUBSYSTEM)
  Lee Jones <lee@kernel.org> (maintainer:LED SUBSYSTEM)
  Jonathan Corbet <corbet@lwn.net> (maintainer:DOCUMENTATION)
  linux-leds@vger.kernel.org (open list:LED SUBSYSTEM)
  linux-doc@vger.kernel.org (open list:DOCUMENTATION)
  linux-kernel@vger.kernel.org (open list)

I'll review the patch once it's been submitted properly, thanks.

> On 7/19/24 11:59 AM, Carlos Ferreira wrote:
> > This patch adds documentation for the LED API class-device naming
> > scheme practice.
> >
> > Signed-off-by: Carlos Ferreira <carlosmiguelferreira.2003@gmail.com>
> > ---
> >  Documentation/leds/leds-class.rst | 40 +++++++++++++++++++++++++++++++
> >  1 file changed, 40 insertions(+)
> > 
> > diff --git a/Documentation/leds/leds-class.rst b/Documentation/leds/leds-class.rst
> > index 5db620ed27aa..8e74a436ca9b 100644
> > --- a/Documentation/leds/leds-class.rst
> > +++ b/Documentation/leds/leds-class.rst
> > @@ -116,6 +116,46 @@ above leaves scope for further attributes should they be needed. If sections
> >  of the name don't apply, just leave that section blank.
> >  
> >  
> > +Keyboard backlight control
> > +==========================
> > +
> > +For backlit keyboards with a single brightness / color settings a
> > +single (multicolor) LED device should be used to allow userspace
> > +to change the backlight brightness (and if possible the color).
> > +This LED device must have a name ending in ':kbd_backlight'.
> > +
> > +For RGB backlit keyboards with multiple control zones, one multicolor
> > +LED device should be used per zone. These LED devices' name
> > +must follow the following form:
> > +
> > +	"<devicename>:rgb:kbd_zoned_backlight-<zone_name>"
> > +
> > +and <devicename> must be the same for all zones of the same keyboard.
> > +
> > +Where possible <zone_name> should be a value already used by other
> > +zoned keyboards with a similar or identical zone layout, e.g.:
> > +
> > +<devicename>:rgb:kbd_zoned_backlight-right
> > +<devicename>:rgb:kbd_zoned_backlight-middle
> > +<devicename>:rgb:kbd_zoned_backlight-left
> > +<devicename>:rgb:kbd_zoned_backlight-corners
> 
> The -corners zone was based on a misunderstanding about
> the Excaliber laptop's functionality, please drop
> the "<devicename>:rgb:kbd_zoned_backlight-corners"
> line here as well as below.
> 
> Regards,
> 
> Hans
> 
> 
> 
> > +<devicename>:rgb:kbd_zoned_backlight-wasd
> > +
> > +or:
> > +
> > +<devicename>:rgb:kbd_zoned_backlight-main
> > +<devicename>:rgb:kbd_zoned_backlight-cursor
> > +<devicename>:rgb:kbd_zoned_backlight-numpad
> > +<devicename>:rgb:kbd_zoned_backlight-corners
> > +<devicename>:rgb:kbd_zoned_backlight-wasd
> > +
> > +Note that this is intended for keyboards with a limited number of zones,
> > +keyboards with per key addressable backlighting must not use LED
> > +class devices since the sysfs API is not suitable for rapidly change
> > +multiple LEDs in one "commit" as is necessary to do animations /
> > +special effects on such keyboards.
> > +
> > +
> >  Brightness setting API
> >  ======================
> >  
> 

-- 
Lee Jones [李琼斯]

