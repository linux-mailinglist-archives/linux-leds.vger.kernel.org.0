Return-Path: <linux-leds+bounces-4547-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15643A9DA15
	for <lists+linux-leds@lfdr.de>; Sat, 26 Apr 2025 12:20:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BD0E4C01E0
	for <lists+linux-leds@lfdr.de>; Sat, 26 Apr 2025 10:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2420F229B39;
	Sat, 26 Apr 2025 10:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDlSVt/3"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5011A9B2B;
	Sat, 26 Apr 2025 10:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745662810; cv=none; b=KTMQSm6cOwqDXzV3Do89jhaRy+Lpc3oCtveHfjFAYDXtAjqbhQCTRLrme275zbqJ39/HTo9pzRzMchXROvR/CWeSzFI7hWVV11IDiAHJYRAKIE6pLfDxEKvmJnqj5ipj5R+AZA1lKYNC/p+/tk8pnsKcsld6gDvrVrgjS5va1lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745662810; c=relaxed/simple;
	bh=r6qhSCVHepSMhKb3TBUCUMvg1+07WGxAhrn4zgsPQuQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VCQLzvu0LE8neH560/Wfl3xOrEXcTZAShmglKCgLk7tHFcH/S8j5LpV2JAs7Q52UoIahcgbqm1peFiik63pVj4tXLYsabXyyx8mz2A03J9giNaljjgWc29iUSn/u2fMofOt5RAQtuYMEjN3D0Ypy4K22UACb6DWY6CnJJ4+XEwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDlSVt/3; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-736b98acaadso3112427b3a.1;
        Sat, 26 Apr 2025 03:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745662808; x=1746267608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Y/aVElFSf6SbTcMarcKVaSoPWzqKiwn3umcgmTvsik=;
        b=SDlSVt/3IUGICWA+dBZqsReiBQJCCB+0DYzVE7BxLwFuXUxbSZeSZrCmqqju65CUG5
         1oDfSigmwUR7br4b0SiLKEo7HQnV4n/gFNPNclhGlGRxeHqImOSDLf7CFOtRGjRpwn6O
         EvANZmTb7q7gih9zQ2ESlj4xblW8MNcw9YNz65OCzXaWYf379JtX1wDSOOj6saqm07pW
         oadLJkeUQuA750fdYrMvVnmG5QbB7ds7jSdyoZJGBha/qqyleP7Mj9kQ3k9mcBrYdrmp
         yXqRlDQfBkQse3m/9MoR2ROI0S+EEX726GHLs53SnNsjf/wVJV7pO93ZXtPsZZyzQSVI
         IbkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745662808; x=1746267608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Y/aVElFSf6SbTcMarcKVaSoPWzqKiwn3umcgmTvsik=;
        b=bpjoHk5PyXD2LEyUvXflggNEwsCVAONcu28fi4dy8+Af2WvNUoEm/4W1TA78Ahvg6Z
         D8DLu21VHXLmmRH5lug0rEJJzgjbhiuEtqE5r0qjlLvMqRy5mQ51koCqvOPJOrPIUJyi
         /R+p/Uzr2MKgvF2bzPc7H6F7kspOCjp/ZQEq1IqMhJeJMssFQ1fuEIluQKhgHRFoY31t
         dIq1z9TmdQLX3GT9cfdtznShEDojWfI3xDkKL8jDkkAGJF1upVcr5l8bk6QS/G0CFH6T
         iTlb+yJg33IGKK2gXmvkjZnPmMI7r2Tqwg9iHArBcPxVrp4gyIKzn3HBO28FAfW62mqq
         XYjg==
X-Forwarded-Encrypted: i=1; AJvYcCVPOgA5bAwPHSvbrlx8yueq6udvvfn1z73JH5Yx6AP5yFwBlw8kw1ZO2SvcZdqoRFFCekV3In7w4NA3@vger.kernel.org, AJvYcCVdZZKNtgYVqnDeEFD02P+vtfHy+vbKd8xohTCESCsZAgn5hERgrybULnMk+rYSEQj93i7FiUOnci2vCC/T@vger.kernel.org, AJvYcCVpq+ncQXK/i0e4yXPUySy9LqfM9V37p/Jn2MNU6IWwxjwR07s79LD103Gj1MvloNjgzelqcqBqTJK92A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxM64yzczDfioiOx+Sh4qF9KLXklzsmvPXJXGY84XZAe7DDhdpu
	FfnM+qf7Ev094QLDcr/zq+9mjnI6Ps22PH86kmdooGUUaUadYCOI
X-Gm-Gg: ASbGnctWi1oTdnhpCZvF+Zc9FQFVFrCJGBvisTOvHwr2kMjJL7Ek1qBvSIhONJVYAZ+
	i4vmu/6F27w2KeHTzjCmToF1ShRFFq2Rc0q6vYzho4C47U48zM2WOFUbf+cogjDYi6ZYhh9Vwp+
	qTqKlFxuyDlwUBO/5LNNZA7jNE0L0CVLB81KCUjdCdN5aGk3NPtf88roRa5ncercmMRWSFPs1jt
	Vl3Cj9bok4XgLa9uyxbGzM4+ru7pN1HPQ8aMyNk+ZTuVBgXwGHTcbNQuYQ2PfCOKzznyGCzENwW
	dtexCMjxRO6FXS0Gt3lppNrO5ZS+cRsBk0B1ayDkntJfZzD6MsG+AA==
X-Google-Smtp-Source: AGHT+IFAy5fk6L0wEqm376PHaHq7uRapAMRNFA7bfD3XZYSA+UlQ7D+4WYIC7ZczN3SNLIULqg/blA==
X-Received: by 2002:a05:6a20:c6ca:b0:1f5:8a1d:38f3 with SMTP id adf61e73a8af0-2045b6c1ce9mr8606619637.2.1745662807510;
        Sat, 26 Apr 2025 03:20:07 -0700 (PDT)
Received: from localhost.localdomain ([14.171.43.210])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e2593f62esm4565607b3a.40.2025.04.26.03.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 03:20:07 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: lee@kernel.org
Cc: christophe.jaillet@wanadoo.fr,
	pavel@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/5] leds: add new LED driver for TI LP5812
Date: Sat, 26 Apr 2025 17:19:42 +0700
Message-Id: <20250426101942.10233-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250425101112.GB1567507@google.com>
References: <20250425101112.GB1567507@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 25 Apr 2025, Lee Jones wrote:

> On Wed, 23 Apr 2025, Nam Tran wrote:
> 
> > This patch series adds support for the TI/National Semiconductor LP5812
> > 4x3 matrix RGB LED driver. The driver supports features such as autonomous
> > animation and time-cross-multiplexing (TCM) for dynamic LED effects.
> > 
> > Signed-off-by: Nam Tran <trannamatk@gmail.com>
> > ---
> > Changes in v7:
> > - Mark `chip_leds_map` as const.
> > - Use consistent `ret` initialization.
> > - Simplify the function `set_mix_sel_led()`.
> > - Refactor `dev_config_show()` and `led_auto_animation_show()` to avoid temp buffer, malloc/free.
> > - Simplify the code and ensure consistent use of mutex lock/unlock in show/store functions.
> > - Remove `total_leds` and `total_aeu`.
> > - Link to v6: https://lore.kernel.org/linux-leds/20250419184333.56617-1-trannamatk@gmail.com/
> > 
> > Changes in v6:
> > - Add `vcc-supply` property to describe the LP5812 power supply.
> > - Remove `chan-name` property and entire LED subnodes, as they are not needed.
> > - Update LP5812 LED driver node to Raspberry Pi 4 B Device Tree, based on updated binding.
> > - Link to v5: https://lore.kernel.org/linux-leds/20250414145742.35713-1-trannamatk@gmail.com/
> > 
> > Changes in v5:
> > - Rebase on v6.15-rc2
> > - Removed unused functions (lp5812_dump_regs, lp5812_update_bit).
> > - Address Krzysztof's review comments
> > - Link to v4: https://lore.kernel.org/linux-leds/20250405183246.198568-1-trannamatk@gmail.com/
> > ---
> > 
> > Nam Tran (5):
> >   dt-bindings: leds: add TI/National Semiconductor LP5812 LED Driver
> >   leds: add TI/National Semiconductor LP5812 LED Driver
> >   docs: ABI: Document LP5812 LED sysfs interfaces
> >   docs: leds: Document TI LP5812 LED driver
> >   arm64: dts: Add LP5812 LED node for Raspberry Pi 4 Model B
> > 
> >  .../ABI/testing/sysfs-bus-i2c-devices-lp5812  |  144 +
> >  .../devicetree/bindings/leds/ti,lp5812.yaml   |   46 +
> >  Documentation/leds/leds-lp5812.rst            |   79 +
> >  MAINTAINERS                                   |   12 +
> >  .../arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts |   10 +
> >  drivers/leds/Kconfig                          |   16 +
> >  drivers/leds/Makefile                         |    1 +
> >  drivers/leds/leds-lp5812.c                    | 2736 +++++++++++++++++
> >  drivers/leds/leds-lp5812.h                    |  348 +++
> >  9 files changed, 3392 insertions(+)
> >  create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
> >  create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5812.yaml
> >  create mode 100644 Documentation/leds/leds-lp5812.rst
> >  create mode 100644 drivers/leds/leds-lp5812.c
> >  create mode 100644 drivers/leds/leds-lp5812.h
> 
> Nothing about this driver has anything to do with the LEDs subsystem.
> 
> Suggest moving it to drivers/auxdisplay instead.

Thank you for the feedback.

I'll move the driver to drivers/auxdisplay as you suggested
and will prepare a new version accordingly.

Best regards,
Nam Tran

