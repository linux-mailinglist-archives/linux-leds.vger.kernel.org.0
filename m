Return-Path: <linux-leds+bounces-4471-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2A5A88640
	for <lists+linux-leds@lfdr.de>; Mon, 14 Apr 2025 17:04:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 791A017394E
	for <lists+linux-leds@lfdr.de>; Mon, 14 Apr 2025 14:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78706279795;
	Mon, 14 Apr 2025 14:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="feS+ofW/"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AD660DCF;
	Mon, 14 Apr 2025 14:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744642692; cv=none; b=VZwGotLoP2kO2zLxJqSrhSasecPpzBScpsd7HY2/KvK8naGLYxQ21V4fiHqw8B3jENw7f7MFprDqFP4jLEIV/T4PhA2LGx3v/N86a2JbIKnwTZdILqZ4vK/LfxTiqgTa6MZsCj/lAlK75IxuBzRCeO+yvCF3cIfflpYYpPUwTRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744642692; c=relaxed/simple;
	bh=1XMVM/k9n06TLsEdZyzAP6OwsHeopzBPsGQnSjzIFRo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=VXBgV90Jhm4rXKFUXZetjyIX8UmQKdX2dFe19iGo3N9xhMvv4S040E69eh3faCfkOFJzRZQRY86+IASLkz8a2ojRn1tuZeKDjzBZ6zBlOB+9IsHaXWY7cRyVmxaLSd5R1Uc11WJ09RJcLm4QsdNAlanHYUEhvm815vvu2dvIBB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=feS+ofW/; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso5387377b3a.2;
        Mon, 14 Apr 2025 07:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744642690; x=1745247490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7BREEgtK98b0xyilJAZ33FfSZORAv8N7MvFY8lDiD8g=;
        b=feS+ofW/QeEoa3gIN8t5zQ6AGFFj+2YEAonAapROKjwVaw5ZGQk3EI+FwqXS83E+Aj
         Ysf7AxWaT3zhE8fOwzjT6+uFFsfZtbfzhAiMt8H0i7e3Fkx9wesx5+PkyFPDqqPNahqR
         DYvy19KQjwzC8XMw7IKt+i/lUnsILFEv0/yXaMWgsjzmWEyCgZ08OAPNYYTdxPwzoVjm
         gcxdH5l8HHFOWKwd0Ho0QWO8fOATmuIDClm3b5NxZrCx4UOVBA6MAPFhtlj7ONaFoVJ2
         Hi2KSBVponIZMppgRXarZf0KQ+ZJVaym4xjvK//OAwwZl89O3WU2x9MBRkxowxhHIcOI
         8QHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744642690; x=1745247490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7BREEgtK98b0xyilJAZ33FfSZORAv8N7MvFY8lDiD8g=;
        b=SC/HIeyj8gOTfYTRyMzyCchZnQifsbRAg6DrsaZgPpYOQs81XbHq4sJGQ5LPJWRIdx
         ZKfYfBvfKwQLTGxn/bcX+TKdqyMw2VAFEYnRJ229NyjfKaD+vPgt2dR7pT5hTbJV7nhf
         63AKnoTg1GnCsUMFgFVetej19ok0jH0olHcxC3pRntqt228e3lFqG4y8wVWSlbTvlkPd
         XrWYqOUgMp0LFUrqTWPIr5KjaiLPMwJ1OuPKs9XX2Qwk0XJa6kexapaFgr7FrKBaBRcL
         C5WFu0icLl8HoTE99ZQXfDJTw6xrWmLS9ZifyZ7Mmb6bEJ14eTJXm7ix9eBXFuE02aQx
         tS6A==
X-Forwarded-Encrypted: i=1; AJvYcCW76le12Sdz6nQdLvaIXX5uOMK7/TnXmq8EyIwHXrN+A4FQveOPWts9ALCkRf7hGRoPYT07Ny/KT4FZ8g==@vger.kernel.org, AJvYcCXgUe2lgIDqSBmvzbyyWdAH+g2PnU3IDAJJPqHYwqK/JiWmLXN0PqLXqrZhJNvkW9X8OQzcWK33LD7B8Mw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7OS8gBTrLCzYCLK4J5pIP28D/1K1xyM1HleDNWUJN7/eLbsAe
	eDxvv7AsBuS58K5yd3dyNKqTOtzl4jKohaQpVBmmpGM7SDN8EJeleN0gChR/
X-Gm-Gg: ASbGncuMLpQdIS1rEsue7qTie6eY/Z6P0s5aR+Z+/RJL1f5NAQq+M60cO4W01ePnUMq
	a7b94NqLZCGYPoJZmAc00AwNN2JQMXltuj5cTum92eoNG20AipSzxyrYh1M+hMrZkrx+jucv/7m
	xtwNZa0K+qh/MtmSW7yt7+ZVpU6gNAQycmJvNMHEInJidp8xKWGmIdBXZTiTUWIUY71R4k4KFpL
	ZCDZvGAg9vLKFpjedMID06SyJFYjOxP4JL99UgMfL7XUOYrN7c9dhEn1/jSjk6XkBDozJMOipd+
	6JFVMH7Ffdc2GK6IkRjwXGglg/l8cmoBegUsDqePT7a51PqngseoIosLbUMazjT/
X-Google-Smtp-Source: AGHT+IG/bX7LtHk0tsqXViGfziYN9ednke428t8UbxQHuLM7MS4ScfFIyz8kt7tz5/ePCQMmI3sRqA==
X-Received: by 2002:a05:6a00:2348:b0:736:457b:9858 with SMTP id d2e1a72fcca58-73bd11c6780mr17471472b3a.10.1744642689758;
        Mon, 14 Apr 2025 07:58:09 -0700 (PDT)
Received: from localhost.localdomain ([123.16.133.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f1071sm6632165b3a.120.2025.04.14.07.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 07:58:09 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: pavel@kernel.org,
	lee@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net
Cc: devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nam Tran <trannamatk@gmail.com>
Subject: [PATCH v5 0/5] leds: add new LED driver for TI LP5812
Date: Mon, 14 Apr 2025 21:57:37 +0700
Message-Id: <20250414145742.35713-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series adds support for the TI/National Semiconductor LP5812
4x3 matrix RGB LED driver. The driver supports features such as autonomous
animation and time-cross-multiplexing (TCM) for dynamic LED effects.

Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
Changes in v5:
- Rebase on v6.15-rc2
- Removed unused functions (lp5812_dump_regs, lp5812_update_bit).
- Address Krzysztof's review comments
- Link to v4: https://lore.kernel.org/linux-leds/20250405183246.198568-1-trannamatk@gmail.com/

---
Nam Tran (5):
  dt-bindings: leds: add TI/National Semiconductor LP5812 LED Driver
  leds: add TI/National Semiconductor LP5812 LED Driver
  docs: ABI: Document LP5812 LED sysfs interfaces
  docs: leds: Document TI LP5812 LED driver
  arm64: dts: Add LP5812 LED node for Raspberry Pi 4 Model B

 .../ABI/testing/sysfs-bus-i2c-devices-lp5812  |  144 +
 .../devicetree/bindings/leds/ti,lp5812.yaml   |  119 +
 Documentation/leds/leds-lp5812.rst            |   79 +
 MAINTAINERS                                   |   12 +
 .../arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts |   60 +
 drivers/leds/Kconfig                          |   16 +
 drivers/leds/Makefile                         |    1 +
 drivers/leds/leds-lp5812.c                    | 2797 +++++++++++++++++
 drivers/leds/leds-lp5812.h                    |  350 +++
 9 files changed, 3578 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5812.yaml
 create mode 100644 Documentation/leds/leds-lp5812.rst
 create mode 100644 drivers/leds/leds-lp5812.c
 create mode 100644 drivers/leds/leds-lp5812.h


base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
-- 
2.25.1


