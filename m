Return-Path: <linux-leds+bounces-6496-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3956BCE9030
	for <lists+linux-leds@lfdr.de>; Tue, 30 Dec 2025 09:25:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E18BA301EC6F
	for <lists+linux-leds@lfdr.de>; Tue, 30 Dec 2025 08:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DE0E303CAA;
	Tue, 30 Dec 2025 08:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A873qr4i"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6273043DE
	for <linux-leds@vger.kernel.org>; Tue, 30 Dec 2025 08:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767083057; cv=none; b=UsyyrRvvZzJt81h7IsFXNDNp6Va/1l0wrzVzUpKw57gxiPp9RxCGGZvTdAdqSu+sA1AgyN0Y4YLoZdPd8q+UzRRVWo6kUv9eobx+wE4j1jKT2re//rXd/0UczVEPNkXii2fP/VMuEnGTudNg+eo/yrfh2md6T6EswGYw7FRTDM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767083057; c=relaxed/simple;
	bh=39ba9wue30A1aWTeAfgL3s9LMi8ZQBWqzHOGtGyy7Nw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qt37e+jk1ZC+mR0hhS1VvVdxXEIdhDlMVqFnGrpixPjIiLN6lVKst4olyG68UyGHgN0d3YL/L9pNSHO5yerVuODc9iinjctgTvil6ojzdUzuxKWuKTpTuq46N/SF4fwEUf1FwKdt6gCtsBa1bsK8SpTvFb7N/QJm1qI51YJFyDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A873qr4i; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-29f2676bb21so131099675ad.0
        for <linux-leds@vger.kernel.org>; Tue, 30 Dec 2025 00:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767083054; x=1767687854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugSCWrsJRygqnHc991VxzRvXCpP5GFtf/Wie/j+cCEo=;
        b=A873qr4iIvMeRTunaJVm6098+W3Be4nAjhV7RerAgcRfaEu9xRxr0GaDLO95bs9SUs
         Ux5PYXiuweEk0ty5RwgwyVvsdcb7qnpaUNGVYCtW4OzG4S2spU2TX3ElyD+8H65WOXfd
         WTaIcJ41amFBWxYCJH+tBkyoZ0eH8Q7ivhAXtFgbhMGQ+I9smqulIm9p1eEl+XGY8IBV
         eC+5wMGR/auKocE/Hn86Bat4pWRaUmXUdr+P3Lg1p8zomhnG5ESpUdQP3/6FTWSbwTzb
         DNXVNxvgZJAB1bRH9z0oSV85fvJPqJ9k/FBlVZYFNhATvpKA1HdEI42dI2TUqcHxXpok
         ZP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767083054; x=1767687854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ugSCWrsJRygqnHc991VxzRvXCpP5GFtf/Wie/j+cCEo=;
        b=oVjJXLj14/r4/0/gcm83ZVzr6XxVcATKc9+FaUNPl4RaYF2mSzQgsrDBsEy9h3nELq
         +6NaUlhQfGffAFm1Ph+NlfzZvYSWCURWuhl94WTh3kExaAZFMoP4onswzaCl25J7YDQ8
         WH2bRaj1CtqQMpbMiYDis8YJmCH1IWgn1/5WNY2xZvgXvGhKLeHc7GQUxEyCppO+97VH
         NVkrFgMQ69e9ZEoOKhaOowkielZ2GL2XqqBAESJDQkJnVhD3h+ePK7ewnV6iXkoySDOS
         Pz8Ns9WoSpkG8qPx3dwDit3PCKlyqrohwXfzAB2AU7qzmQxpd8Xi4QUwSp3ffZUEvHMo
         +HPg==
X-Forwarded-Encrypted: i=1; AJvYcCWqatV6ae7sV++q3PKzaYkAN2dcJ7S7AsBqatlu7jf93jZmkWtMnNmJvRQaaQsJshfP+IBwA7XsjRSy@vger.kernel.org
X-Gm-Message-State: AOJu0YyUuuyUJhVkn3wJqcOsKpdL0XUfZrsZbRPLw0IXyIVCycPD7+uY
	bkn66YeTaLpZtNjEMfvik7kd9p5a5z0Jd6YVdQCfYHLlK6gcXdiczSSK
X-Gm-Gg: AY/fxX4qQ5pw3o0/piu8U4Tp5O7rCG0RMpFNKm9RcRZDoJBzynbpP+a/TlEzqyk1zBe
	u2Y7IwrMWMO7ZHcuX95tMlPpzIcyfVpPoIf7aR8MMh3zKDtCuOf14FtpPdwRS5aV+dT12hFrb7Z
	QumuGpucJWLwKsL6oDWW6N5jdT6u6Nbj1X64Sqsnwg8oGpQghenDqluS2T0SzvaiOFngpux95hT
	vU8+l2GS7cnFNnLthEyDDuKHPiQYqFxVB+hv4xkYGYQkpg0pBpxDj+FWUj13NetcyrZUMWEUMln
	NbwYuujdFyKck2wogTT4vIFUkCaBb41FAotVrChCPd/0FpC8MM/ks9hf6eOxRzQyyR9KTxmgEk2
	gy4uHs+u4jMxIukCTB/IUywHKaFtekHHeEqi435sb6/Aec5rYHZLVnTcP4VDjUBApglkvdjXGLx
	Y8SNSiTcMQkxG+TOXG95qOyd1pwK5nyltj
X-Google-Smtp-Source: AGHT+IEfyveC6SXvwjrSjDZuZe24/t+dHtcajKoN+qJVB1dwZv7JEOXhFD3Ft886hclfPko6+3BGzg==
X-Received: by 2002:a17:903:1b65:b0:297:e69d:86ac with SMTP id d9443c01a7336-2a2f2836516mr331771855ad.39.1767083054471;
        Tue, 30 Dec 2025 00:24:14 -0800 (PST)
Received: from MRSPARKLE.localdomain ([150.228.155.85])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d76ceesm296667165ad.91.2025.12.30.00.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 00:24:14 -0800 (PST)
From: Jonathan Brophy <professorjonny98@gmail.com>
To: lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Andriy Shevencho <andriy.shevchenko@linux.intel.com>,
	Jonathan Brophy <professor_jonny@hotmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v5 4/7] ABI: Add sysfs documentation for leds-group-virtualcolor
Date: Tue, 30 Dec 2025 21:23:17 +1300
Message-ID: <20251230082336.3308403-5-professorjonny98@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251230082336.3308403-1-professorjonny98@gmail.com>
References: <20251230082336.3308403-1-professorjonny98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jonathan Brophy <professor_jonny@hotmail.com>

Document the sysfs ABI for the virtual LED group driver, including:

- mc/multi_intensity: Per-channel intensity control (0-255)
- mc/multi_index: Channel-to-color-ID mapping (read-only)
- mc/multi_multipliers: Per-channel scale factors (read-only)
- brightness: Master brightness control with arbitration trigger
- max_brightness: Maximum brightness value (mode-dependent)

Channel ordering is deterministic, sorted by ascending LED_COLOR_ID
value. For RGBW LEDs, white (ID=0) appears first, followed by RGB.

The multi_intensity attribute is rate-limited to 100 updates/second
per virtual LED by default, with counters visible in debugfs when
CONFIG_DEBUG_FS is enabled.

Co-developed-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Signed-off-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Signed-off-by: Jonathan Brophy <professor_jonny@hotmail.com>
---
 .../sysfs-class-led-driver-virtualcolor       | 168 ++++++++++++++++++
 1 file changed, 168 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-driver-virtualcolor

diff --git a/Documentation/ABI/testing/sysfs-class-led-driver-virtualcolor b/Documentation/ABI/testing/sysfs-class-led-driver-virtualcolor
new file mode 100644
index 000000000000..704f2e5f2af7
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-led-driver-virtualcolor
@@ -0,0 +1,168 @@
+What:		/sys/class/leds/<led>/mc/multi_intensity
+Date:		December 2024
+KernelVersion:	6.x
+Contact:	Jonathan Brophy <professor_jonny@hotmail.com>
+Description:
+		Control the intensity values for each color channel in a
+		virtual multicolor LED.
+
+		Reading returns space-separated intensity values (0-255) for
+		each configured color channel. Channel order is deterministic,
+		sorted by ascending LED_COLOR_ID value. Use multi_index to
+		determine which color corresponds to each position.
+
+		Writing accepts space-separated intensity values to set the
+		per-channel intensities. The number of values must match the
+		number of channels. Values must be ordered to match multi_index.
+
+		Channel ordering examples:
+		  RGB LED (no white):
+		    multi_index shows "1 2 3"
+		    Order is: red (ID 1), green (ID 2), blue (ID 3)
+
+		  RGBW LED (with white):
+		    multi_index shows "0 1 2 3"
+		    Order is: white (ID 0), red (ID 1), green (ID 2), blue (ID 3)
+		    Note: White comes FIRST because LED_COLOR_ID_WHITE = 0
+
+		Example (RGB LED with 3 channels):
+		  $ cat /sys/class/leds/myled/mc/multi_index
+		  1 2 3
+		  $ cat /sys/class/leds/myled/mc/multi_intensity
+		  255 128 0
+		  $ echo "128 64 200" > /sys/class/leds/myled/mc/multi_intensity
+
+		Note: In standard mode (led-mode = "standard"), intensity
+		changes are rejected with -EPERM and the color is fixed by the
+		channel multipliers defined in the device tree. In multicolor
+		mode (led-mode = "multicolor", default), intensity can be
+		freely modified.
+
+		This attribute is rate-limited to prevent system overload
+		(default: 100 updates/second per virtual LED). Excessive
+		updates will be silently dropped with incremented rate limit
+		counters (visible in debugfs when CONFIG_DEBUG_FS enabled).
+
+What:		/sys/class/leds/<led>/mc/multi_index
+Date:		December 2024
+KernelVersion:	6.x
+Contact:	Jonathan Brophy <professor_jonny@hotmail.com>
+Description:
+		Read-only attribute showing the LED color IDs for each channel
+		in the virtual LED.
+
+		Returns space-separated LED_COLOR_ID_* values (integers)
+		corresponding to each channel. Channels are ordered by
+		ascending color ID value (0, 1, 2, 3, ...).
+
+		See include/dt-bindings/leds/common.h for color ID definitions.
+
+		Common color ID values:
+		  - 0: LED_COLOR_ID_WHITE
+		  - 1: LED_COLOR_ID_RED
+		  - 2: LED_COLOR_ID_GREEN
+		  - 3: LED_COLOR_ID_BLUE
+		  - 4: LED_COLOR_ID_AMBER
+		  - 5: LED_COLOR_ID_VIOLET
+		  - 6: LED_COLOR_ID_YELLOW
+		  - 7: LED_COLOR_ID_IR
+		  - 8: LED_COLOR_ID_MULTI
+		  - 9: LED_COLOR_ID_RGB
+		  - 10: LED_COLOR_ID_UV
+
+		Example (RGB LED):
+		  $ cat /sys/class/leds/myled/mc/multi_index
+		  1 2 3
+		  (Shows: red=1, green=2, blue=3)
+
+		Example (RGBW LED):
+		  $ cat /sys/class/leds/myled/mc/multi_index
+		  0 1 2 3
+		  (Shows: white=0, red=1, green=2, blue=3)
+
+		This attribute is essential for correctly indexing the
+		multi_intensity and mc-channel-multipliers arrays, especially
+		when white LEDs are present (which come first due to ID=0).
+
+What:		/sys/class/leds/<led>/mc/multi_multipliers
+Date:		December 2024
+KernelVersion:	6.x
+Contact:	Jonathan Brophy <professor_jonny@hotmail.com>
+Description:
+		Read-only attribute showing the scale/multiplier values (0-255)
+		for each color channel.
+
+		Multipliers are defined in device tree via the
+		"mc-channel-multipliers" property and must be ordered to match
+		the channel order (sorted by LED_COLOR_ID).
+
+		In multicolor mode, these scale the intensity values:
+		  final = (intensity * multiplier / 255) * brightness / max_brightness
+
+		In standard mode, these define the fixed color mix:
+		  final = multiplier * brightness / max_brightness
+
+		Returns space-separated values (0-255), one per channel, in the
+		same order as multi_index.
+
+		Example (RGB LED):
+		  $ cat /sys/class/leds/myled/mc/multi_index
+		  1 2 3
+		  $ cat /sys/class/leds/myled/mc/multi_multipliers
+		  255 200 150
+		  (Shows: red=255, green=200, blue=150)
+
+		Example (RGBW warm white):
+		  $ cat /sys/class/leds/myled/mc/multi_index
+		  0 1 2 3
+		  $ cat /sys/class/leds/myled/mc/multi_multipliers
+		  180 255 200 100
+		  (Shows: white=180, red=255, green=200, blue=100)
+
+What:		/sys/class/leds/<led>/brightness
+Date:		December 2024
+KernelVersion:	6.x
+Contact:	Jonathan Brophy <professor_jonny@hotmail.com>
+Description:
+		Control the overall brightness of the virtual LED.
+
+		This is the standard LED class attribute. For virtual grouped
+		LEDs, this controls the master brightness that scales all
+		physical LEDs assigned to this virtual LED after per-channel
+		intensity and multipliers are applied.
+
+		Writing brightness triggers the winner-takes-all arbitration
+		engine which determines which virtual LED controls the hardware
+		based on:
+		  1. Priority (higher wins)
+		  2. Sequence number (most recent wins on tie)
+		  3. Only virtual LEDs with brightness > 0 participate
+
+		The winner controls ALL physical LEDs. Physical LEDs not used
+		by the winner are turned off.
+
+		Range: 0 to max_brightness (typically 0-255)
+
+		Reading returns the current brightness setting.
+
+		Example:
+		  $ echo 128 > /sys/class/leds/myled/brightness
+		  $ cat /sys/class/leds/myled/brightness
+		  128
+
+What:		/sys/class/leds/<led>/max_brightness
+Date:		December 2024
+KernelVersion:	6.x
+Contact:	Jonathan Brophy <professor_jonny@hotmail.com>
+Description:
+		Read-only attribute showing the maximum brightness value.
+
+		For multicolor mode virtual LEDs, this is always 255 to provide
+		full 8-bit resolution for color mixing.
+
+		For standard mode virtual LEDs, this is the minimum max_brightness
+		among all physical LEDs referenced by the virtual LED.
+
+		Example:
+		  $ cat /sys/class/leds/myled/max_brightness
+		  255
--
2.43.0

