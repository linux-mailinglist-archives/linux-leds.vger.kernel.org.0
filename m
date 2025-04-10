Return-Path: <linux-leds+bounces-4455-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E27A8499A
	for <lists+linux-leds@lfdr.de>; Thu, 10 Apr 2025 18:27:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6986C4A6EB2
	for <lists+linux-leds@lfdr.de>; Thu, 10 Apr 2025 16:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 184E01EE02F;
	Thu, 10 Apr 2025 16:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mcI8l2aw"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9AA1EE031;
	Thu, 10 Apr 2025 16:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744302345; cv=none; b=YGg4m7HIAo9HvZgqMPx7zrjkkD3LQ5ffB49kvPjnJ5U4q1HSLiUpVM50flg+GkP2mCJlQOtX6OSZ67EU/FnsnAnsMcecgga9k85IxotWynY4zdbsTyWU8rjSq2pvW8eewJnKcrVliCaNKbqAceICLgQkLrjqP1kQI+ei0o+cBro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744302345; c=relaxed/simple;
	bh=x/bO77EEyI3OCt62DbSrYycKBhh5jpMg4E8TC+wQ+a8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bnKiHz/8rR+JvzCCh5i2O9M+FTuwRdyZKbYDarCq5wBPoa5qGHK/LxHKcCOy4k3sPJ+WpnhSX0YkkDI4lIj/0Cs80dN17GalL3zoaxBsAEonHm88XVwkFB3n0FhOH5hcL4mYA5nrJ8claPd1qwKFRQJKY4SZIh+51r+8LOQ2QXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mcI8l2aw; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-224100e9a5cso12064615ad.2;
        Thu, 10 Apr 2025 09:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744302342; x=1744907142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DpU2k3vR3N9darrIRQy4VUCi59YBugQwxClUhu0eWlo=;
        b=mcI8l2awE6sl4FPgnfoa79thHMkCJP8b3Dm50QL4Jf2Gl6ibxWbGw+cMQqXSLSJ7v0
         H8rxx9BqMj8+VDgE3wLfCjl/8UkRQZQb8KNEzAk+SMSID6Fw/7QE0mj6ybf39SUNd9dr
         fEZ1RvquzlgattzsdvHbsQ2guZ9YS3UT9BvkFRCXzMWV4P6TYd735u1BgRJxFP63sk5E
         ktnGv88kDYHBAC+ev6bkAo8DnnxgqvMpmZvpwLyGTVt4Xnwh6vZpqFeP9RisiKvlUkJh
         IowvlWxgHscd6qnIYjiBl20A1N/BtofWqUaS7dhAPuioVqqSXjLjePd+SE/N4eSS2mGl
         XlEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744302342; x=1744907142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DpU2k3vR3N9darrIRQy4VUCi59YBugQwxClUhu0eWlo=;
        b=JeZlRy87c/ywjtsqsolTdSjPVEzYyctSIObkomQlwWMDYOwba9Lv18v+sTuIJJcgX6
         2UOFI6BCWrQp6IPF9cRiQiXcJvmrBdONcigwgOUZeSvFyMzPcvhSDas+QmUUBICbwI6W
         XCBEqh6VJ5Wow/xgso1IRQF0JuAOpcCefZqfWEsLs07lcuE5niRE1RGI+dWylBTixNfA
         yMTlMMI1DrVN6oFFmbD0vLGHQ1i5usp3XHS9GkI19P9dn2NEH4DSXejKVjZ0EU5LPUxa
         PVTEjjo2aEf8M75ibXO9vWVGGyLwgrHzE/5pfISFDm1UOb52PZUXALKrj2TNDgMB0kc6
         rkOQ==
X-Forwarded-Encrypted: i=1; AJvYcCU34s1h2g4/KaPQ9U9on3Hp4GskDrqzAeL2IxN/v7ywWQqJ38EidNyRzYypjU1CyGa1OWEH0cc9VGsiyQ==@vger.kernel.org, AJvYcCUc2VHsbqUDEceZfj0c8yCDnCUQAkJx/2ACA8B5lpPrPSr+m4JKZ1lUFkMHQxw4Frtm/k9mehxdicLewnIH@vger.kernel.org, AJvYcCVCX4e1YIpOug8wkfksrUn7onMzrt+idtwaB3gjC194+WJQQXuYnr+GXIr8BDZ+0DCklebyCDixmaZ/@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm/7kEBDZROHnEmhEUnX0nf5J0/vhx4sShR6eiraQt8Jmwlsxe
	7umTGnbO64Zv04tlBbUn3darDZu4icYAVdmV2wdZrdOETGRELcA3
X-Gm-Gg: ASbGncv4/eMKObCW55bL215h83gZnovjJ36jIbu6B5lyAEHIVFdXbbWh2dzX622YI2I
	6ruR+NH2bjM+hQAILCsgi213LMOPBxE9XWr2n0nanlIa95mnkFs3SfsJgZdZ1lH38GcjOmHh+A7
	pAq083F63mK/2HuTuS50Ai42sXhKjTJVygKbApzg5VXAZvBwXxgZ/U7Y7H+/qhc4gE3+IU4RNTt
	kiCFCaBD7V/sVUYrOVvR3s2PzmjYkyql+0cuICNen/LVlsNtnK6osoS7uxiYYKVr6mBUhIEJrOT
	hSm4Zi4EnQuhK2tTcgIBKVtsi+h9sBQ39gt0W9I2q+uSNIiVYm8soZBxP0iMlfFi
X-Google-Smtp-Source: AGHT+IF9Guim8/3coeLyjnCmE0Ple3bGkG9MUpXvj2ZI58J0waQlGLnDCVLUK79LBO5EQaK4P+eDYA==
X-Received: by 2002:a17:903:186:b0:21f:988d:5758 with SMTP id d9443c01a7336-22be03902c8mr44157485ad.35.1744302342281;
        Thu, 10 Apr 2025 09:25:42 -0700 (PDT)
Received: from localhost.localdomain ([123.16.133.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccbf62sm32617685ad.244.2025.04.10.09.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 09:25:41 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: krzk+dt@kernel.org
Cc: pavel@kernel.org,
	lee@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/5] docs: ABI: Document LP5812 LED sysfs interfaces
Date: Thu, 10 Apr 2025 23:25:17 +0700
Message-Id: <20250410162517.10074-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <707dc912-12d2-4b50-b934-0c1d1f5efe6b@kernel.org>
References: <707dc912-12d2-4b50-b934-0c1d1f5efe6b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 6 Apr 2025, Krzysztof Kozlowski wrote:

> On 05/04/2025 20:32, Nam Tran wrote:
> > The LP5812 is a 4 × 3 matrix RGB LED driver
> > with autonomous animation engine control.
> > 
> > The driver provides interfaces to configure
> > LED modes manual/autonomous, set PWM/DC values,
> > and manage autonomous animation engines.
> > 
> > Signed-off-by: Nam Tran <trannamatk@gmail.com>
> > ---
> >  .../ABI/testing/sysfs-bus-i2c-devices-lp5812  | 150 ++++++++++++++++++
> >  MAINTAINERS                                   |   1 +
> >  2 files changed, 151 insertions(+)
> >  create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812 b/Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
> > new file mode 100644
> > index 000000000000..e745f0f936c5
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
> > @@ -0,0 +1,150 @@
> > +What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/device_enable
> 
> I do not see reason for such ABI. If you want to disable, just unbind it.

I think the name is confusing, it is Chip_EN register. It is used to "enable the internal circuits".
The hardware supports low power consumption.
When we write 0 to the bit, it will save all configurations and go to save power mode.
When we write 1, it will restore. Therefore, I support the end user in controlling this register.

> > +Date:		April 2025
> 
> Not possible...

Sorry, I understand now. Should I use the current date or the date when the patch is accepted?

> > +KernelVersion:	6.14
> 
> You cannot go to the past. 6.14 was released. This will be v6.16 or later.

It is my mistake. I will update the KernelVersion to v6.16 or later accordingly.

> > +Contact:	Nam Tran <trannamatk@gmail.com>
> > +Description:
> > +        Enables or disables the LP5812 device. (RW)
> > +        0 - Disable
> > +        1 - Enable
> > +
> > +What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/dev_config
> 
> Looks like wrong path here and everywhere else. I think other name it as
> led driver, e.g.
> Documentation/ABI/testing/sysfs-class-led-driver-lm3533

The LP5812 driver is basically an I2C driver.
It doesn't work as current common or multi-LEDs supported by the Kernel framework.
However, the LP5812 driver still supports LED functions.

> > +Date:		April 2025
> > +KernelVersion:	6.14
> > +Contact:	Nam Tran <trannamatk@gmail.com>
> > +Description:
> > +        Configures drive mode and scan order. (RW)
> > +        Some valid values: tcmscan:4:0:1:2:3 (default), tcmscan:3:0:1:2, mixscan:2:2:0:3, mixscan:3:0:1:2:3
> > +
> > +What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/device_command
> > +Date:		April 2025
> > +KernelVersion:	6.14
> > +Contact:	Nam Tran <trannamatk@gmail.com>
> > +Description:
> > +        Issues device-level commands. (WO)
> > +        Valid values: "update", "start", "stop", "pause", "continue"
> > +
> > +What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/device_reset
> > +Date:		April 2025
> > +KernelVersion:	6.14
> > +Contact:	Nam Tran <trannamatk@gmail.com>
> > +Description:
> > +        Triggers a software reset of the device. (WO)
> > +        1 - resets device
> > +        0 - does not reset device
> 
> I do not see kernel exposing it for other devices, drop.

This is sw_reset register of hardware. It is used to request the hardware reset.
I think I will change the name to "sw_reset" to make it clearly.

> > +
> > +What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/fault_clear
> > +Date:		April 2025
> > +KernelVersion:	6.14
> > +Contact:	Nam Tran <trannamatk@gmail.com>
> > +Description:
> > +        Clears fault status. (WO)
> > +        1 - clears fault status
> > +        0 - does not clear fault status
> > +
> > +What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/tsd_config_status
> > +Date:		April 2025
> > +KernelVersion:	6.14
> > +Contact:	Nam Tran <trannamatk@gmail.com>
> > +Description:
> > +        Report the current thermal shutdown config status. (RO)
> > +
> > +What:		/sys/bus/i2c/devices/.../led_<id>/enable
> > +Date:		April 2025
> > +KernelVersion:	6.14
> > +Contact:	Nam Tran <trannamatk@gmail.com>
> > +Description:
> > +        Enables or disables the specified LED channel. (RW)
> > +        1 - Enable
> > +        0 - Disable
> 
> No, you already have standard ABI for this. I also already told you that
> you cannot duplicate existing kernel interface.

According to function of led and register, I will change it to "activate" interface.

> > +
> > +What:		/sys/bus/i2c/devices/.../led_<id>/mode
> > +Date:		April 2025
> > +KernelVersion:	6.14
> > +Contact:	Nam Tran <trannamatk@gmail.com>
> > +Description:
> > +        Selects LED operation mode. (RW)
> > +        Valid values: "manual", "autonomous"
> > +
> > +What:		/sys/bus/i2c/devices/.../led_<id>/manual_dc
> > +Date:		April 2025
> > +KernelVersion:	6.14
> > +Contact:	Nam Tran <trannamatk@gmail.com>
> > +Description:
> > +        DC current level in manual mode. (RW)
> > +        Valid values: 0 - 255
> 
> NAK, duplicating existing brightness.

There are some brighness mode in this hardware. manual_dc is a interface to to control dc current in manual mode.

> > +
> > +What:		/sys/bus/i2c/devices/.../led_<id>/manual_pwm
> > +Date:		April 2025
> > +KernelVersion:	6.14
> > +Contact:	Nam Tran <trannamatk@gmail.com>
> > +Description:
> > +        PWM duty cycle in manual mode. (RW)
> > +        Valid values: 0 - 255
> > +> +What:		/sys/bus/i2c/devices/.../led_<id>/autonomous_dc
> > +Date:		April 2025
> > +KernelVersion:	6.14
> > +Contact:	Nam Tran <trannamatk@gmail.com>
> > +Description:
> > +        DC current level used in autonomous mode. (RW)
> > +        Valid values: 0 - 255
> > +
> > +What:		/sys/bus/i2c/devices/.../led_<id>/autonomous_dc
> > +Date:		April 2025
> > +KernelVersion:	6.14
> > +Contact:	Nam Tran <trannamatk@gmail.com>
> > +Description:
> > +        DC current level used in autonomous mode. (RW)
> > +        Valid values: 0 - 255
> 
> Also duplicating brigthness.

It is not brightness only. It is another registers.
It is used for autonomous_dc that mean the led will blink with several brighness levels automotically.

> > +
> > +What:		/sys/bus/i2c/devices/.../led_<id>/pwm_dimming_scale
> > +Date:		April 2025
> > +KernelVersion:	6.14
> > +Contact:	Nam Tran <trannamatk@gmail.com>
> > +Description:
> > +        PWM dimming scale type. (RW)
> > +        Valid values: "linear", "exponential"
> > +
> > +What:		/sys/bus/i2c/devices/.../led_<id>/pwm_phase_align
> > +Date:		April 2025
> > +KernelVersion:	6.14
> > +Contact:	Nam Tran <trannamatk@gmail.com>
> > +Description:
> > +        Configures PWM phase alignment. (RW)
> > +        Valid values: "forward", "middle", "backward"
> > +
> > +What:		/sys/bus/i2c/devices/.../led_<id>/autonomous_animation
> > +Date:		April 2025
> > +KernelVersion:	6.14
> > +Contact:	Nam Tran <trannamatk@gmail.com>
> > +Description:
> > +        Controls AEU configuration and playback. (RW)
> > +        Format: (aeu number):(start pause time):(stop pause time):(playback time)
> > +        with aeu number 1, 2, 3; playback time 0 - 15
> > +
> > +What:		/sys/bus/i2c/devices/.../led_<id>/aep_status
> > +Date:		April 2025
> > +KernelVersion:	6.14
> > +Contact:	Nam Tran <trannamatk@gmail.com>
> > +Description:
> > +        Shows current animation pattern status, value from 0 to 7. (RO)
> > +
> > +What:		/sys/bus/i2c/devices/.../led_<id>/auto_pwm_val
> > +Date:		April 2025
> > +KernelVersion:	6.14
> > +Contact:	Nam Tran <trannamatk@gmail.com>
> > +Description:
> > +        Shows the pwm value in autonomous mode when pause the animation, value from 0 to 255. (RO)
> > +
> > +What:		/sys/bus/i2c/devices/.../led_<id>/lod_lsd
> > +Date:		April 2025
> > +KernelVersion:	6.14
> > +Contact:	Nam Tran <trannamatk@gmail.com>
> > +Description:
> > +        0 0 mean no lod and lsd fault detected, 1 1 mean lod and lsd fault detected (RO)
> > +
> > +
> > +
> > +
> > +
> > +
> 
> Why so many blank lines? Drop

It's my mistake. I will remove the blank lines.

Thanks for your detailed review.
Appreciate your time and feedback!

Best regards,
Nam Tran

