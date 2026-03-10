Return-Path: <linux-leds+bounces-7234-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4E4FIW8hsGmCgAIAu9opvQ
	(envelope-from <linux-leds+bounces-7234-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 10 Mar 2026 14:49:35 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E376E250D66
	for <lists+linux-leds@lfdr.de>; Tue, 10 Mar 2026 14:49:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A4D9343F266
	for <lists+linux-leds@lfdr.de>; Tue, 10 Mar 2026 12:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD5A63AF655;
	Tue, 10 Mar 2026 12:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="esbFHyJU"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B583F3AF643;
	Tue, 10 Mar 2026 12:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773144631; cv=none; b=o71I+eue7zFV4irrfpj3HbCccHT8UVSGjHhL8Y/znCkiUn62h1LcDi1U+TFYZecG+WubyKOp2NZ+9CQr3kCg7UgEktP/2MeUz0KiuMIfBUCNLWyh1d9OUu/9cP7xKmali2wVx0y+Tzk7hDN9ZxRn6FOeoyEisB1YrksqmsL/q8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773144631; c=relaxed/simple;
	bh=23fDxMo4xHy1EdAru6003n7+54nLBKHhNf3N9eMsvmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S8wr/Bo/0A1w0DDEKZXNOp8iRRl2X87dFQqzApIg/dEubjbqoDOXWdDcR6xW8d/yobTqgu9fSfp6loFBHnQM0g7p0yBFygYe/wclQlNvHqVMVW7PxVQ0dMZaXmiRxj1IYY/tAMtlzYrAYEwoG9i0cmyQbR4iZJ6LTyUBFiCcV7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=esbFHyJU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D072C19423;
	Tue, 10 Mar 2026 12:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773144631;
	bh=23fDxMo4xHy1EdAru6003n7+54nLBKHhNf3N9eMsvmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=esbFHyJUClN9ir49CHpIDKhs+H20RGPu+wVQFm0oPuzWgAt6b45cTzMlVhL76SN//
	 nIyhRmvxgDLi6HslyCGD+do86TN6mO+nT5bHHCrTT9ia7oBj5zkuEZF/fZ2ziBhxcA
	 couq0541qNncgf4ysPb3VoGDTAQqspVQwxiliQjIQPKkFhrlz2AqMThjdmTO5DPvsG
	 ytB04eLHKQrjAMjNiqiG3oIgA9wcww5+LbNTYeWvOHoWMFC5ow6CHeNm9Ed4zGcRtO
	 pI+NoY30AaLZ+h2BH5904jSaICxZkuIUM5u2MPT8h+dmCWOF/e3J2O2N5yvFqwTucH
	 APH7Q4CvCGlQg==
Date: Tue, 10 Mar 2026 12:10:24 +0000
From: Lee Jones <lee@kernel.org>
To: Rong Zhang <i@rong.moe>, Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc: Pavel Machek <pavel@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Ike Panhc <ikepanhc@gmail.com>, Vishnu Sankar <vishnuocv@gmail.com>,
	vsankar@lenovo.com, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, chrome-platform@lists.linux.dev,
	platform-driver-x86@vger.kernel.org
Subject: Re: [RFC PATCH 0/9] leds: Add support for hw initiated hw control
 trigger transition
Message-ID: <20260310121024.GJ183676@google.com>
References: <20260227190617.271388-1-i@rong.moe>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260227190617.271388-1-i@rong.moe>
X-Rspamd-Queue-Id: E376E250D66
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7234-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,weissschuh.net,chromium.org,squebb.ca,gmail.com,linux.intel.com,lenovo.com,vger.kernel.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

I'd like for the netdev folks to take a look at this please.

> Some laptops can tune their keyboard backlight according to ambient
> light sensors (auto mode). This capability is essentially a hw control
> trigger. Meanwhile, such laptops also offer a shrotcut for cycling
> through brightness levels and auto mode. For example, on ThinkBook,
> pressing Fn+Space cycles keyboard backlight levels in the following
> sequence:
> 
>   1 => 2 => 0 => auto => 1 ...
> 
> Recent ThinkPad models should have similar sequence too.
> 
> However, there are some issues preventing us from using hw control
> trigger:
> 
> 1. We want a mechanism to tell userspace which trigger is the hw control
>    trigger, so that userspace can determine if auto mode is on/off or
>    turing it on/off programmatically without obtaining the hw control
>    trigger's name via other channels
> 2. Turing on/off auto mode via the shortcut cannot activate/deactivate
>    the hw control trigger, making the software state out-of-sync
> 3. Even with #1 resolved, deactivating the hw control trigger after
>    receiving the event indicating "auto => 1" has a side effect of
>    emitting LED_OFF, breaking the shortcut cycle
> 
> This RFC series tries to demonstrate a path on solving these issues:
> 
> - Introduce an attribute called trigger_may_offload, so that userspace
>    can determine:
>    - if the LED device supports hw control (supported => visible)
>    - which trigger is the hw control trigger
>    - if the hw control trigger is selected
>    - if the hw control trigger is in hw control (i.e., offloaded)
>      - A callback offloaded() is added so that LED triggers can report
>        their hw control state
> - Add led_trigger_notify_hw_control_changed() interface, so that LED
>   drivers can notify the LED core about hardware initiated hw control
>   state transitions. The LED core will then determine if the transition
>   is allowed and turning on/off the hw control trigger accordingly
> - Tune the logic of trigger deactivation so that it won't emit LED_OFF
>   when the deactivation is triggered by hardware
> 
> The last two patches are included into the RFC series to demonstrate how
> to utilize these interfaces to add support for auto keyboard backlight
> to ThinkBook. They will be submitted separately once the dust settles.
> 
> Currently no Kconfig entry is provided to disable either interface. If
> needed, I will add one later.
> 
> [ Summary of other approaches ]
> 
> < custom attribute >
> 
> Pros:
> - simplicity, KISS
> - no need to touch the LED core
> - extensible as long as it has a sensor-neutral name
>   - a sensor-related name could potentially lead to a mess if a future
>     device implements auto mode based on multiple different sensors
> 
> Cons:
> - must have zero influence on brightness_set[_blocking] callbacks
>   in order not to break triggers
>   - potential interference with triggers and the brightness attribute
> - weird semantic (an attribute other than "brightness" and "trigger"
>   changes the brightness)
> 
> < hw control trigger (this series) >
> 
> Pros:
> - mutually exclusive with other triggers (hence less chaos)
> - semantic correctness
> - acts as an aggregate switch to turn on/off auto mode even a future
>   device implements auto mode based on multiple different sensors
>   - extensibility (through trigger attributes)
> 
> Cons:
> - complexity
> 
> [ Previous discussion threads ]
> 
> https://lore.kernel.org/r/08580ec5-1d7b-4612-8a3f-75bc2f40aad2@app.fastmail.com
> 
> https://lore.kernel.org/r/1dbfcf656cdb4af0299f90d7426d2ec7e2b8ac9e.camel@rong.moe
> 
> Thanks,
> Rong
> 
> Rong Zhang (9):
>   leds: Load trigger modules on-demand if used as hw control trigger
>   leds: Add callback offloaded() to query the state of hw control
>     trigger
>   leds: cros_ec: Implement offloaded() callback for trigger
>   leds: turris-omnia: Implement offloaded() callback for trigger
>   leds: trigger: netdev: Implement offloaded() callback
>   leds: Add trigger_may_offload attribute
>   leds: trigger: Add led_trigger_notify_hw_control_changed() interface
>   platform/x86: ideapad-laptop: Decouple HW & cdev brightness for kbd
>     backlight
>   platform/x86: ideapad-laptop: Fully support auto kbd backlight
> 
>  .../obsolete/sysfs-class-led-trigger-netdev   |  15 ++
>  Documentation/ABI/testing/sysfs-class-led     |  22 ++
>  .../testing/sysfs-class-led-trigger-netdev    |  13 --
>  Documentation/leds/leds-class.rst             |  72 ++++++-
>  drivers/leds/led-class.c                      |  23 +++
>  drivers/leds/led-triggers.c                   | 176 +++++++++++++++-
>  drivers/leds/leds-cros_ec.c                   |   6 +
>  drivers/leds/leds-turris-omnia.c              |   7 +
>  drivers/leds/leds.h                           |   3 +
>  drivers/leds/trigger/ledtrig-netdev.c         |  10 +
>  drivers/platform/x86/lenovo/Kconfig           |   1 +
>  drivers/platform/x86/lenovo/ideapad-laptop.c  | 194 ++++++++++++++----
>  include/linux/leds.h                          |   6 +
>  13 files changed, 492 insertions(+), 56 deletions(-)
>  create mode 100644 Documentation/ABI/obsolete/sysfs-class-led-trigger-netdev
> 
> 
> base-commit: a75cb869a8ccc88b0bc7a44e1597d9c7995c56e5
> -- 
> 2.51.0
> 

-- 
Lee Jones [李琼斯]

