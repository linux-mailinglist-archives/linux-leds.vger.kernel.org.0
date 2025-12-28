Return-Path: <linux-leds+bounces-6468-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDCFCE558E
	for <lists+linux-leds@lfdr.de>; Sun, 28 Dec 2025 19:23:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F02AA300FE0E
	for <lists+linux-leds@lfdr.de>; Sun, 28 Dec 2025 18:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59FFB2367DC;
	Sun, 28 Dec 2025 18:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AMSqfDnt"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF50C223708
	for <linux-leds@vger.kernel.org>; Sun, 28 Dec 2025 18:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766946205; cv=none; b=VukkxFxV15FcpPVBM8Iuvhfzq+QtboLzQntA/TxpwtuG4jRqj/D5kcn5/w4b0nl2a23cmN3XlAqkXPMD2ZmSTQzbVEX4WXfsJV+wai6zPxS77MQf6V6uA3TIRROCTnlU0bnvPJqzhuF/JipX1nk4GDNtfUpo9rxMUNK71vUtuOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766946205; c=relaxed/simple;
	bh=GNdsGhLWAjPtHybVUZwNwUls+lSmwION9C+FutEVaAI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KA+MEchjI9YnQdbu5nrXYfvT/QkK2gt3HOfs50ESMHy06vdt3WY9Fa352aNtg2VQmyM9+vPsZ7UWRYE8ATttP3k4agQQiwLyMkBWKbLGa2qZ5ExsNmM0L0vhi2GRX8a5zipqL26FHhXWin9I6Lo1WNIcEnJv5TdXEL0I0FFrRww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AMSqfDnt; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7f0da2dfeaeso9040367b3a.1
        for <linux-leds@vger.kernel.org>; Sun, 28 Dec 2025 10:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766946202; x=1767551002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QeDSdNZFPeVa6HDvCoOYO+9p7A0DV8ybWdKjNHOp+qw=;
        b=AMSqfDntx3g7C/lkR7ohfvpLOE83iJS33XKuRvNS2GZBWlnrNpqZk1qC5FxzVZ/XLB
         +GHWfsOa1cqXhBe7ZsN+Rtl+6Tw1urosXFNYH6B6FBL9rlTb0ZU+UH8rHcmXQ1BSlUw4
         x8R8fLe4LRs54/eU9NE+Op6yxk7QZvi4WEfDsHAnJwBw1EvDSj7e0F7q0nypM/8Coae7
         9uNO21t4l5f7NLZU7278ccRplsMQSSKTiqijn9dZKpM8si18hQaMY2LXvKj3yFsg4s6a
         CnAov95MQtreSpUtGAeyfro9gSROprt2dZ5duxUQ3sWAwClgnZDsTXoApkvBgnd0kqbv
         4+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766946202; x=1767551002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QeDSdNZFPeVa6HDvCoOYO+9p7A0DV8ybWdKjNHOp+qw=;
        b=OhhcepEUfEyK8EdmKhmFOrs51i41h8ZGzp8ndtu/SZIjDcpzXYz3dPb63E1mlUcltQ
         8SDhP1SkkWJGbLumsBLJGpzxOn382JxI49UOn3qegppWFJgxLfh5b9vfgF7qONJLTBzh
         5yXGuVfQlMZyR60zp7mvx8ivP9bvjLZC1uZUwo7Qi13Xbtov7hSRUEZhkyI4zwfC8V42
         5dkCcsYkq2lJXPieiG5bJDLYrDFQLhuAV2zuOz9QySqAOybtUDiBTvxPPj/glf7UAp6z
         EzRlmDeQTfFLP76T3N2aalMxlqyujn5z4BMR1k/QeC4KE1K4aKoWy/24bOj8SbTL84qp
         16RA==
X-Forwarded-Encrypted: i=1; AJvYcCV1gSpN+qN/EdhTV1lxE9+mF2dBAYhDAvpswDmUWqx+gCth5WwszAGQffYryhLmW8ejAAmaFfJeCpKe@vger.kernel.org
X-Gm-Message-State: AOJu0YxTU6sT5D0YEKDlHopNV2R16XxSgqu4JCvcBomF2POeak8YwUNT
	Cm1sVXxTEz1ut6vFQOepmux7KjmRB8EbpP5BoWMIsY7sLFO/A7x6IB4O
X-Gm-Gg: AY/fxX7fTbHVKa0zrvsIMqaKPUTiWtwQ4noxrHppO0RYkptewfHziU4wJ2thvHBuYDs
	ANHNiC/Vphnf7s97upJc58zNtMb0A5HQIj8kkzrNyyXE7qoBokbQsqBNaPFY996kulGcDCt71G3
	KkJ0JnlfWcTmXaoIa3MJsClf7vRG3xBPPttymn1WHt+QyvUS05QgP3tIt/Hd8CutdHesV2uxV6v
	DYfiPZ4UxTtPwUCh48kKuUzRZMAw7KQ3EQhIUQrkcA3zUaQK6KKZUggm/jacA1+dVB5pABpp4dE
	hACdexlsj7+tG9nWNwe5oDkBBuRc+FEoMyceT6J8d3WP8rHmYOHFJNTM3IpQJ66+hINQf/tt//1
	Sg5q5zc9bEmCl+4FPSUIuHYpK+xr3a1UiWeN0Y8BejqNkwCAijNtafv0q+cW2HYWS9/9yPa1HpS
	KkXqMgMdbHAGgu2npkvfNxDVZcQAFZ7g4OCoqxAeL0oe4=
X-Google-Smtp-Source: AGHT+IFKng9YDxqymUd0O4EhoC70dKkY7AKl9HVF4EIAvoDTwUAlP6lo1Cv0UYS8JhxRaysQ/FVv4g==
X-Received: by 2002:a05:6a00:278b:b0:782:7052:5167 with SMTP id d2e1a72fcca58-7ff650c7fe1mr26251152b3a.6.1766946201986;
        Sun, 28 Dec 2025 10:23:21 -0800 (PST)
Received: from MRSPARKLE.localdomain ([150.228.155.85])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48f3d7sm27399695b3a.51.2025.12.28.10.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 10:23:21 -0800 (PST)
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
Subject: [RFC PATCH 0/2] leds: Add optional instance identifier for deterministic naming
Date: Mon, 29 Dec 2025 07:22:43 +1300
Message-ID: <20251228182252.1550173-1-professorjonny98@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

From: Jonathan Brophy <professor_jonny@hotmail.com>

This patch series introduces an optional "led-instance" device tree property
to address non-deterministic LED naming when multiple LEDs share the same
function and color.

Currently, the LED core appends numerical suffixes (_1, _2, etc.) based on
registration order when duplicate function:color combinations exist. This
creates several problems:

1. **Non-deterministic naming**: Registration order determines suffix values,
   which can change across boots due to probe ordering, async initialization,
   or module load order.

2. **Non-semantic identifiers**: Names like "lan:green_23" provide no
   indication of which physical LED or subsystem they represent.

3. **Breaks userspace automation**: Network management tools, LED control
   daemons, and hardware monitoring cannot reliably identify LEDs.

4. **Ambiguous numbering**: "lan:green_23" could be mistaken for LAN port 23
   when it may actually be the 23rd registered LED of any port.

5. **Namespace pollution**: The alternative of adding vendor-specific function
   names (LED_FUNCTION_LAN_PORT0, LED_FUNCTION_LAN_PORT1...) pollutes the
   function namespace. The instance identifier keeps standard functions clean
   while allowing contextual differentiation.

6. **Breaks naming convention**: The _1, _2 suffix was intended only as a
   collision avoidance workaround, but has become the de facto standard for
   hardware with multiple identical LEDs.

**Example: 48-port network switch**

Current behavior (non-deterministic):
  /sys/class/leds/lan:green      ← Port 0? Unknown
  /sys/class/leds/lan:green_1    ← Could be any port
  /sys/class/leds/lan:green_2    ← Could be any port
  ...
  /sys/class/leds/lan:green_47   ← Could be port 1 due to probe order

Proposed behavior (deterministic):
  /sys/class/leds/lan:green:port0   ← Always port 0
  /sys/class/leds/lan:green:port1   ← Always port 1
  /sys/class/leds/lan:green:port2   ← Always port 2
  ...
  /sys/class/leds/lan:green:port47  ← Always port 47

**Example: Multi-domain power indicators**

Current behavior (non-deterministic):
  /sys/class/leds/power:red      ← Which power source?
  /sys/class/leds/power:red_1    ← Which power source?
  /sys/class/leds/power:red_2    ← Which power source?

Proposed behavior (deterministic):
  /sys/class/leds/power:red:mains    ← Mains power indicator
  /sys/class/leds/power:red:battery  ← Battery power indicator
  /sys/class/leds/power:red:usb      ← USB power indicator

**Design principles:**

- Backward compatible: Instance identifier is optional
- Extends existing convention: function:color becomes function:color:instance
- Follows kernel precedent: Similar to eth0/eth1, gpio0/gpio1 naming patterns
- Ignored with deprecated "label" property: Avoids conflicts with legacy code

**Alternative solutions considered:**

1. function-enumerator: Only supports numbers (0, 1, 2), producing names like
   "lan:green-0" which are still non-semantic. The 48-port switch needs "port0"
   to match physical port labels.

2. Deprecated "label" property: Being actively removed from LED bindings. New
   code should not rely on deprecated APIs.

3. Different function names: LED_FUNCTION_LAN_PORT0, LED_FUNCTION_LAN_PORT1...
   This pollutes the function namespace with hardware-specific combinations.

This RFC seeks feedback on:
- Property naming: "led-instance" vs "led-subsystem" vs "led-context"
- Implementation approach
- Additional use cases to document

Jonathan Brophy (2):
  leds: core: Add support for led-instance property
  dt-bindings: leds: common: Add led-instance property

 .../devicetree/bindings/leds/common.yaml      | 93 +++++++++++++++++++
 drivers/leds/led-core.c                       | 43 +++++++--
 2 files changed, 126 insertions(+), 10 deletions(-)

--
2.43.0

