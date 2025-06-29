Return-Path: <linux-leds+bounces-4919-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0421FAECCAE
	for <lists+linux-leds@lfdr.de>; Sun, 29 Jun 2025 15:00:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9558B1721B9
	for <lists+linux-leds@lfdr.de>; Sun, 29 Jun 2025 13:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29347223DFB;
	Sun, 29 Jun 2025 13:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nj6oEyAT"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E18223338;
	Sun, 29 Jun 2025 13:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751202007; cv=none; b=BQxhT2VFA/xNkc0Iu+qCAJfWx34muEQNcLqMTMw38jSNYNXPIZXr5HvwuxKbtRJOd8OumUDJ9EYFgajKDqaSivexw4FrugDehIF7kgWN9a+i56JbPOFAwhGlq2U/GxT4AskqT1eKtheFxMqDTprCM7rkZ1XZl7s5Jj+w4io+PZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751202007; c=relaxed/simple;
	bh=ptQmvEJ8Tuk9psyjbLz+1JBidVCNcdBOgITLBL4kJyU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WJuhpwzAcy46h65JP6W/FLPA+ZrplpbK6AY/cXof1Ae9hgA64a9bUdG0l6BvYr7qfWZNvHWSKnUkkU8uiPuNeaZBEb0YpWrCMONd2P36p540vwhLTKfsaNf9mJE+W46WX++/nZaoQUESuwL7V5hGTIUR7UQBmDqTGUnGN0muhho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nj6oEyAT; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c5b8d13f73so121239985a.0;
        Sun, 29 Jun 2025 06:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751202004; x=1751806804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ptQmvEJ8Tuk9psyjbLz+1JBidVCNcdBOgITLBL4kJyU=;
        b=nj6oEyAT3qirBbRGpasdWrJch3H6FGXs8TKgr+5MElmF2wve3Z+yqFFH5CmI40kyUo
         QcIHvgOaFzJzr1B2fgj7WNNiYhfIl3KFXSj5N02HhV0bdnL4Aay7qc6g5DmzGf3g2XNv
         yqyN4qdTBZrIfWaxc+B4ZrWJgXkJtT2bsu7WW4nyxNjaEpz0f3rXzF04jADL43j7JVfZ
         cO/vo2Ozb1tJX5oj0ZbbUcfSp15ATtO9H+wVW4Y2eF0E7grKT420nLmTa04R14GX7QR0
         IMhc5e8EXH+r5LM2mZdB40sLxQIgloO6rlotK9CpFMaqgrvuDw5qkVk9Oxr1ml6W7Ppw
         aJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751202004; x=1751806804;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ptQmvEJ8Tuk9psyjbLz+1JBidVCNcdBOgITLBL4kJyU=;
        b=I6pZCKmtyVZLsThh6IQBYF4Gj2+qsoguiY1j6DBTNTkcojQ7PzsiX+6xwc2FkpVvT0
         3C8kZSUFpETBEYeoGwyrd6eRpcsAteJSgOarvvswUuJMiZC2LcaeR4MTr37WThpccEuj
         FEq/GnBuThESK92aDyBw6v4DWPbcivDrPWH06862AOKd33vu6aH9+XNn9gvvTsLt+tuY
         QOiNlYccJOxoAFCfVMknzvYpipws427mvpMUqv11iRzk9kKm5ni5AF9fTuqZemGY9XT6
         0GWHfj178Q+5wjpqj3vTeXggm7FIaARyt9Fw0VFa9ZXPRWaBCmLqwOH0mDRbVNx+93UV
         Asqw==
X-Forwarded-Encrypted: i=1; AJvYcCU3lH7WJJw8u5UeTqtZukwhunqhCK0JQ+fkoVBKKLCUa3FYZiPVYz8+e3Ul/cnXk2ukXePxaGzo60e8@vger.kernel.org, AJvYcCVlT7ebWZOPOwYCI1sf3KAMQXup6x58OZuimO6MN85f73MJRt2AWSmN8gIvSwsBdjVPDcIPTRhQYYgnJbNY@vger.kernel.org, AJvYcCWJ7QxLfVEa3eBDpWe/Th6KxHh62HmlWwY0ztE+wgwv+szCXvbvCMKYGN9eAEHRYLItOvvxNZhi0dxYMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxA9JoAyEGSWGYRF8FRkbOIePnSdmaDPN98GHzHf7/sh+7lfu7
	bUeY5jl4hb52GiZYToBIKCKYGGpmsNUQgsQNUN9jalDWNycAUXPB0Yj/
X-Gm-Gg: ASbGncvpNunNcOEFReDQCWUl+7BVg9ZDDx8PXBFJ6tXYCVXnhFe3SZg64Bd4712Tldh
	vP8izYr7932z5i/POvpQJwThCoTqE4sUbdBaS40FMRZyQp6Q2TL+fqFSXV8olWu9BknnT+Hkk2s
	rT0KW7EEzXxDjWDu3HKi3jTGpeRYoMv6k90iCqo5oKtcACL8Fmnw7/2dUvQWoe2sGakLj2V0yRt
	I+uPJte8cF0WV28IiVYXIh+9R6BbmHKZ2dDhZZmiEqNDsZSqY2IGjNzHrUyFd7E3L0BfN1/kTRw
	vQxSob2ILMvI/75Xy7yU54BcXksIURonWc1zWyL/jrJVEiHO+Q6QVb1o9joyyD7tOLpCdk1a9Ts
	dmacb9IiJBX976KSjNibnnY8d1KWtOaSH
X-Google-Smtp-Source: AGHT+IHwg44Tj8IfSX1MsET4EeUghLP5H8dAFgQqh9PFRCcXn8lY/kB3thBeO6dr8xDoGxMgTjbxog==
X-Received: by 2002:a05:620a:3728:b0:7d3:f883:6047 with SMTP id af79cd13be357-7d4439ca3e3mr1466751985a.51.1751202004067;
        Sun, 29 Jun 2025 06:00:04 -0700 (PDT)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44316d85esm431599585a.35.2025.06.29.06.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 06:00:03 -0700 (PDT)
From: =?UTF-8?q?Jean-Fran=C3=A7ois=20Lessard?= <jefflessard3@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Boris Gjenero <boris.gjenero@gmail.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Paolo Sabatino <paolo.sabatino@gmail.com>
Subject: [PATCH v2 0/8] auxdisplay: Add TM16xx and compatible LED display controllers driver
Date: Sun, 29 Jun 2025 08:59:49 -0400
Message-ID: <20250629130002.49842-1-jefflessard3@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces a new auxiliary display driver for the TM16xx family of LED controllers and compatible chips, widely used in TV boxes and embedded devices.

Many consumer devices, particularly TV boxes, use auxiliary displays based on TM16xx LED controllers to show status information such as time, network connectivity, and system state. Currently, there is no mainline kernel support for these displays, forcing users to rely on out-of-tree drivers or userspace solutions that directly manipulate GPIO pins.

This driver provides a unified interface for TM16xx-based auxiliary displays through the Linux LED subsystem. It supports both I2C and SPI communication protocols and integrates with the existing LED class framework, allowing displays to be controlled via standard sysfs interfaces and LED triggers.

Upstreaming this driver will eliminate reliance on out-of-tree drivers and enable standardized auxiliary display support across devices using these controllers.

It is compatible with multiple LED controller families:
- Titan Micro Electronics: TM1618, TM1620, TM1628, TM1650
- FUDA HISI Microelectronics: FD620, FD628, FD650, FD655, FD6551
- i-Core Electronics: AiP650, AiP1618, AiP1628
- Princeton Technology: PT6964
- Winrise Technology: HBS658

Key features:
- Write-only display support: This initial submission implements display output functionality. Most devices do not wire key scanning lines for input, so key input is left for potential future extensions if needed.
- 7-segment display support: Full integration with kernel segment mapping helpers for driving standard 7-segment digit displays.
- Flexible display configuration: Device tree bindings allow board-specific configuration of digit grids, segment mappings, and matrix orientation to accommodate different PCB layouts and wiring designs.
- LED subsystem integration: Individual display elements (icons) are exposed as LED devices, enabling use of LED triggers for automatic control based on system events (network activity, USB connections, etc.).
- Dual protocol support: Supports both I2C and SPI communication, with the protocol selected based on device tree configuration.

The device tree bindings provide properties to describe board-specific wiring and display layout, as the controller itself is agnostic to the display configuration:
- titanmec,digits: Array defining which controller grids drive digit displays.
- titanmec,segment-mapping: Mapping of 7-segment display elements to controller outputs.
- titanmec,transposed: Flag for displays with swapped grid/segment orientation.
- Individual LED definitions for icons and status indicators.

Tested platforms:
- Multiple TV boxes with Amlogic, Rockchip and Allwinner SoCs.
- Various display configurations and controller variants.
- Both I2C and SPI communication modes.
- LED trigger integration for automatic status indication.

Dependencies:
- Requires CONFIG_NEW_LEDS=y and CONFIG_LEDS_CLASS=y

Optional LED trigger modules for advanced functionality:
- CONFIG_LEDS_TRIGGER_TIMER for blinking elements.
- CONFIG_LEDS_TRIGGER_NETDEV for network activity indication.
- CONFIG_USB_LEDS_TRIGGER_USBPORT for USB activity indication.

User space clients, including display-service and display-utils for testing and integration, are available at: https://github.com/jefflessard/tm16xx-display

v2:
- Fixed duplicate label in dt-bindings examples
- Renamed dt properties prefix to match titanmec vendor prefix

