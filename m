Return-Path: <linux-leds+bounces-5544-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7889B96B5C
	for <lists+linux-leds@lfdr.de>; Tue, 23 Sep 2025 18:04:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D53A48816E
	for <lists+linux-leds@lfdr.de>; Tue, 23 Sep 2025 16:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35EA026F291;
	Tue, 23 Sep 2025 16:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WQzFa4pE"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1DB266B56
	for <linux-leds@vger.kernel.org>; Tue, 23 Sep 2025 16:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758643428; cv=none; b=qZb5HLhG0KVCjnbe8wqSnHWrcq8rvuk76S8JNELgs1SlRPTnwy667Bq5nfTBfk3fUG5fxTfmi0hhJGMob5bR8wIZiiu4AdmXCB2WwyXG8Qy5TbepjDSx+crs8uIGA8zkowsEtyIaoG40CVLzbXukYCQ/vmR+zqMVrw1JGEL+5Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758643428; c=relaxed/simple;
	bh=acYIptEhY/FTS13q/p4Gqp2WqXvXWWwi73HB+X0La/c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PhQSiI6O21AEtm8NkXCbTgelfgOZzNzEXCCk+6YH3mpfxen7llJCFkGeASm1DKgK7OXfnVOZR5l+dVSCgFs0TcMQXqtpEnz0MRi06/v+VG+oXOBPFMo2YKQHhJV87BZsMpGuqDsO3YWHfdhiRrNf7vm299vloCbc7a2EnOTZ2Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WQzFa4pE; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-32326e2f0b3so4950129a91.2
        for <linux-leds@vger.kernel.org>; Tue, 23 Sep 2025 09:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758643424; x=1759248224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCjwXZdvlr5TGiQ9Gsc1mgLjFMZKnntp5GpNV0BrGWg=;
        b=WQzFa4pEsPBbVBoCnvylGCDfbdc0npfEQNI6Em5pTR6TO/4ItA3Lz8Jc420/lKoEXT
         jCF+aeypN52vGpGZwNj+aCpH5z8/lDSz/NmV280Kj2XZPS3sB9NFeBQix2y/dPW5RcDm
         ZCz+Pd4CfrM8ma86lIcxFiChB8B2Kr1Y4U65WR9EYkXc42g/DxAqL5E4keEpvGPTi2bL
         /nA4TgAu5dIjNGAQzNqL7EoWmMdh1s3B0HXh4PBcqaX6BOHvq25dBol8/yzGqNgIazyw
         58mqhxLaMKaaQCY72w9WGL1ZhVkVQLCIOBmfP7eH0msaQAnjr9vWa8QLmCvMEstuRsEW
         hKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758643424; x=1759248224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TCjwXZdvlr5TGiQ9Gsc1mgLjFMZKnntp5GpNV0BrGWg=;
        b=TBZMWKWmdmT8nZY11fujcQXx6duff+cgAacyH2TzifaFxQFCTE/7NeSgpJPU/f4Su6
         e78oF7rYZ1Ql/VcbQkUjKaNRl12k/TWP/6aG50s+dLdvvHkQHY2SHKKy5iIAqKXJjl3t
         jMMg0pOio7Ak9a/V/9y8DQ3GJ7KG0xcDrHPubY4acnMs1YljNOnBUHcfdHkYqBlsF88l
         kXDK89lZvtpOgfQTy9kjW+3haJRpqRANnPmjSMzEhVJEyMv5jfFrnlj1gHtMQI7JsuNI
         17BnBka6NHjXLBck35+K22JHuRMdtk9TyfjRxwiyVxSoUxgz+XJx+ALjPF9KemHe6sBk
         k5rw==
X-Forwarded-Encrypted: i=1; AJvYcCWbFLf+QFp7B1BCdXNrRxwJXPaWIYM4cBAA9AEW9OwhSQgrzcwdMdDbODgH4vnQdtmDIDN9ZKWiMmOu@vger.kernel.org
X-Gm-Message-State: AOJu0YwMqhbRssnxdJ+vMC8Jh9+8Co40PyJgRx3jwOFCYx4ALeQtq2/A
	FiCKGx2b8iiGezMQYYarpdpnBGSrC9t5osyZKvk3I9aDkRNPL4N1hTNc
X-Gm-Gg: ASbGncv8eZHt7cWRKAD3ViHT0vSqtgd3UDaW0FTPosZwG8pwTjObHVQPNZBA0X8E0jj
	Wzw4frSbB2mbZ42I0Amkm6JM+J8oWo1eApwlcEs4BXpZZ4Ms8PUJ57ig9DZXrkEjadvg0Sy4sqV
	h5KDNfTbyhX63a/jFstLhiu8yk+nwceFXDiGCHL+12bBTL3VE8twaVfGXstmKq2Cld0ad9OWn57
	mBrRjd7VBNskIGi1RINhHo0xbIbHhXAE3Udy9Z6lUP5h4z4Q5OTnTldvfqseO84YzGP/8Enkjln
	7U/trDtPDaIVHn8pd4mObRaSUlHWwNBQ7E25b+UO7R23W8FBJEXiAfFhaapvp+Tzdsq93DOxoXP
	Kggknq5+HeqhHTkjhqEJe4GcDRTyoFEw=
X-Google-Smtp-Source: AGHT+IHISW90NLk8XtYPSy5uwi6/z+EnNYEUhS0pqc4r9TqWhWKXchg9EW4j0OUL/iKfwlQcDt+IiQ==
X-Received: by 2002:a17:90b:2787:b0:32e:9daa:7347 with SMTP id 98e67ed59e1d1-332a92c9d80mr3777330a91.7.1758643423923;
        Tue, 23 Sep 2025 09:03:43 -0700 (PDT)
Received: from DESKTOP-P76LG1N.lan ([58.187.66.24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ed276d2f8sm19447325a91.24.2025.09.23.09.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 09:03:43 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: gregkh@linuxfoundation.org
Cc: lee@kernel.org,
	pavel@kernel.org,
	rdunlap@infradead.org,
	christophe.jaillet@wanadoo.fr,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v14 0/4] leds: add new LED driver for TI LP5812
Date: Tue, 23 Sep 2025 23:03:36 +0700
Message-Id: <20250923160336.12464-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2025092259-stranger-affecting-1c75@gregkh>
References: <2025092259-stranger-affecting-1c75@gregkh>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 22 Sep 2025, Greg KH wrote:

> On Tue, Sep 23, 2025 at 01:13:41AM +0700, Nam Tran wrote:
> > On Thu, 11 Sep 2025, Greg KH wrote:
> > 
> > > On Sun, Sep 07, 2025 at 11:09:40PM +0700, Nam Tran wrote:
> > > > This patch series adds initial support for the TI LP5812,
> > > > a 4x3 matrix RGB LED driver with autonomous engine control.
> > > > This version provides a minimal, clean implementation focused
> > > > on core functionality only. The goal is to upstream a solid
> > > > foundation, with the expectation that additional features can
> > > > be added incrementally in future patches.
> > > > 
> > > > The driver integrates with the LED multicolor framework and
> > > > supports a set of basic sysfs interfaces for LED control and
> > > > chip management.
> > > > 
> > > > Signed-off-by: Nam Tran <trannamatk@gmail.com>
> > > 
> > > The sysfs api is really odd here.  WHy not do the same thing as this
> > > other controller recently submitted does:
> > > 	https://lore.kernel.org/r/20250911-v6-14-topic-ti-lp5860-v3-0-390738ef9d71@pengutronix.de
> > 
> > Thank you for the feedback!
> > I agree that consistency is important, and I've reviewed the patch you referenced.
> > 
> > I also checked the LP5860 datasheet and noticed that its driver exposes sysfs entries
> > for configuring registers like `R_current_set`, `G_current_set`, and `B_current_set`.
> > Similarly, the LP5812 requires register-level configuration for operation.
> > 
> > In my driver, I've implemented the following sysfs attributes:
> > - '/sys/bus/i2c/devices/.../lp5812_chip_setup/dev_config' - Configures drive mode and
> > scan order (Dev_Config_1 and Dev_Config_2 registers).
> > - '/sys/bus/i2c/devices/.../lp5812_chip_setup/sw_reset' - Triggers a software reset of
> > the device (Reset register).
> > - '/sys/bus/i2c/devices/.../lp5812_chip_setup/fault_clear' - Clears fault status
> > (Fault_Clear register).
> > - '/sys/class/leds/led_<id>/activate' - Activate or deactivate the specified LED channel
> > in runtime (led_en_1, led_en_2 registers).
> > - '/sys/class/leds/led_<id>/led_current' - To change DC/PWM current level of each led
> > (Manual_DC_xx and Manual_PWM_xx registers).
> > - '/sys/class/leds/led_<id>/max_current' - To show max current setting (Dev_Config_0 register).
> > - '/sys/class/leds/led_<id>/lod_lsd' - To read lod, lsd status of each LED
> > (LOD_Status_0, LOD_Status_1, LSD_Status_0, LSD_Status_1 registers).
> > 
> > These attributes map directly to LP5812 registers. I’ve kept the interface minimal and
> > focused only on essential functionality needed to operate the device.
> > 
> > If any of these attributes seem unconventional or redundant, I’d appreciate clarification
> > so I can revise accordingly.
> > 
> > > but better yet, why does this need to be a kernel driver at all?  Why
> > > can't you just control this directly from userspace with a program
> > > there?
> > 
> > LP5812 is controlled via I2C, and its register map is non-trivial. Moving control to userspace
> > would require users to manually handle I2C transactions and understand the register layout,
> > which is error-prone and not user-friendly.
> 
> So you write it once in a library, or in a userspace program, and it is
> done.  Don't expose these low-level things in a custom api that could be
> done in userspace instead.
> 
> > Moreover, the driver integrates with the LED multicolor framework, allowing standardized control
> > via existing userspace tools. This abstraction is difficult to achieve reliably from userspace alone.
> 
> But this is a custom api for the leds, not like any other one out there.
> So how would it integrate with anything else?
> 
> > > For USB, we generally do not allow these types of crazy apis to be added
> > > to the kernel when controlling the device can be done from userspace.  I
> > > think the same thing can happen here too, right?
> > 
> > USB devices benefit from standardized descriptors and interfaces, which reduce the need for custom
> > sysfs APIs. In contrast, LP5812 has no such standard interface, and some customization is necessary.
> 
> Many USB devices do not benifit from that at all, you directly control
> them from userspace using vendor-specific apis.  Just like this device,
> nothing different just because it is an i2c device.
> 
> > I’m open to improving the sysfs interface or moving parts to another method if that’s more appropriate.
> > Please let me know which specific changes you’d recommend.
> 
> sysfs really doesn't seem to be the correct api here, you are making a
> custom one just for this one device that is not shared by any other one,
> so userspace has to write custom code to control it.  So why not just
> write one program, in userspace, to handle it all at once, instead of 2?
> 
> > For completeness, I considered these methods:
> > - sysfs: Recommended and standard for LED drivers.
> > - i2c-tools: Not recommended, intended for development/debug only.
> > - ioctl: Not recommended for new LED drivers.
> > - debugfs: For debugging only.
> > - Direct I2C register access: Requires users to know the register map and protocol.
> 
> A library will handle the i2c direct register access.  Again, do not
> make custom sysfs apis if at all possible.

Thank you very much for your valuable feedback.

I understand your suggestions and the overall strategy. I'm currently considering moving
some configurations to the device tree binding, allowing users to manage device settings
more flexibly through it.

For other interfaces, I plan to support them from userspace.
 
If this approach sounds good to you, I'll proceed to update the source code and submit a
new patch accordingly.

Thanks again for your review and support!

Best regards,
Nam Tran

