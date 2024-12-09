Return-Path: <linux-leds+bounces-3523-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FBF9E8CC1
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2024 08:59:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5330F164C1A
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2024 07:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E8C721507A;
	Mon,  9 Dec 2024 07:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3NKVyxB"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0100021506D;
	Mon,  9 Dec 2024 07:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733731173; cv=none; b=qmIyIQ41JCfkT+uibYHn+Gbrhrw+sjIq8EDCkD8Hrl11kRkXhGHr107Ma6O0cjkOBT4SvurZORZbMDc77RR/gsQD9b/Gg2WnkTyI5Pfe3DmtTpili+q35ktM3wYMQZ7Y3XonadmlFdsRf5J0li0/4pQIB0W+rluuN6FHaXjzKl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733731173; c=relaxed/simple;
	bh=3uOb8Ph7pXIqUZbw7TsQpsVXfzCs1n9SijT4jDjmmy8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=pYZQpSOBtDt6sA+5pvEPo4iW0ESfybEPTHzLQn/203CuXMnJ7QQK4IWWOSRQvFNYNhwZymLYg/leT+YimNDkNmUXNcRoXZfXhHSaHFv7Jdhl3oKZ0yQuee5/hMmCVX6gf9/FzBnONmuTkARhLynOpZFoV6Aeag6in8UkluTXuRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3NKVyxB; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20cf3e36a76so34703705ad.0;
        Sun, 08 Dec 2024 23:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733731170; x=1734335970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7gbsMKce0iUUWg86NGcSWuqSJewGWtF9btgnRLQtZXw=;
        b=h3NKVyxB3AJpwYN2NVc/QXUHjNpwVRNNju9l2G12lvt+akO9Ia0SOF4fLsuDsL3rE6
         /+vS0C/FJy2jp+V/eFKe+9Frs9Qzq6NCQCOlr0Mvu3lkXapu9sQWN+gJHQ4ADIClPPGy
         e9xUOIIZ6haZMwRXgP/OQnNgNvT4dpqpGa/4ocizUBIye9LOYWK1MTkVAZUY3gkxYOHz
         0LH17WbpeNCE4UdJYMuvYrAsrdg789BYETCvsxb8BS2T1igNeFw78K2iPbPv6TTpnfRu
         sYLu4E4fQcxD2PglOf9TiQDxmScD6Xqq1zngIvZlXmbH82tfP3z7PfC/JHTRKvn6R6bs
         G19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733731170; x=1734335970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7gbsMKce0iUUWg86NGcSWuqSJewGWtF9btgnRLQtZXw=;
        b=ELomuIEGYwC/M1zYrFkXeMMxvVtr8rvuJQNwVxMbHFrbVPbW5VOtN/J+LA+ZCzOmff
         1/u5mZOd7CvrTyhko9SmrcS7oZje2Hz4/EK+29FruwysiuIp1TFH3jAyT7VnzPEeReJy
         7xaxlp3aCTsLENhhtyjzksKW3KgcWiQ/k0XjhnTUiUFTcUA0WXNd6UKlofd+OwDp7cXt
         ceeCAK1aDE8ltSoVKB8Ey4g8RCWiQYSnXRcb8S0wzL3e1w2REze/X0TGMrCuSC1I5P6n
         t/AxRs4ryrWFP1+n8IGYjtowZnhQqLQIl0svY5dHtCqx+zUUGXb/QVqg0HdSUuL6zhRc
         ZEPQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8YyIi/UMXRoznJ16fIMRCo3tt8JkdQTvtTamNl/dLXic/i+ogu96C0uwZyxuZ2Iwdak0uKkmGFYLaGhb/@vger.kernel.org, AJvYcCW80vIM8mZ73lNp6Ir7LqB1W3tLzynIhJoxvlJg6r+MWa0rfq8257J6COTCbu3NiqDfh0ADoFyGI2K9aPI=@vger.kernel.org, AJvYcCWt6RhMDaXrrq2s0lYJB9YXt/2yX5i4Bg3hUk9cGjOXoCiyrfXqxI8Pt3gkNzujFywXEvFg0psWduVk@vger.kernel.org, AJvYcCXdDHkPGrsD92xsNqOovZU4kkDOrZYeyi9iULlyux0VHqGsr/G4VSzXgu82xd5nNZs4GJbk9VeuSu7/9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoN79hdkLqje4ODi13szmwisGfvzit7QtcvM0z0zDdyrC3d9xX
	oYFYuy9v7lwMcGz5A6UDDiA3FsCMcZ31KPx6UPLiFrkrzkyDNpdx
X-Gm-Gg: ASbGnctR8nxQZGpz1Qo47Mj26PLL2KqIbPsAQt7/yF/gkOz9dlTwdH2GGFlcCFXqlB7
	e0yZDXrJi1R9WEOc49UKelUfGw5m1grHm92EGCEvAhD1N60c01zzWj3IaXN22acd03aPCp0h8e1
	JlxR04j0/dr583hYUZWVdowVAruDIzF8xZI7C5MHbB6pnGLrpyrRTMfvVl6RXezUTVkaDIlBa9z
	WVSIqGKVRlyIbf/MXC/p9UVcXuZMnZoJPyedYeHn4QpXVdSDbZuqipSwRL3/cLShA==
X-Google-Smtp-Source: AGHT+IGoeeJoIHfFKB8IHGMMHXOwW3xF5w1b+OPf6OpYRt5GQUeN2r72qeeit1SjjCo03L5SijScYg==
X-Received: by 2002:a17:902:cecc:b0:216:1367:7e48 with SMTP id d9443c01a7336-21613951f65mr187686175ad.0.1733731170459;
        Sun, 08 Dec 2024 23:59:30 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21628b6588csm36508025ad.235.2024.12.08.23.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 23:59:30 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Nick Chan <towinchenmi@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/3] Apple DWI backlight driver
Date: Mon,  9 Dec 2024 15:58:32 +0800
Message-ID: <20241209075908.140014-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apple SoCs come with a 2-wire interface named DWI. On some iPhones, iPads
and iPod touches the backlight controller is connected via this interface.
This series adds a backlight driver for backlight controllers connected
this way.

Changes since v2:
- Add missing includes in driver
- Fix file path in MAINTAINERS

v2: https://lore.kernel.org/asahi/20241207130433.30351-1-towinchenmi@gmail.com/T

Changes since v1:
- Fixed dt-bindings $id.
- Make power-domains an optional property in dt-bindings.
- Added missing error checking after devm_ioremap_resource() in
dwi_bl_probe().

v1: https://lore.kernel.org/asahi/20241206172735.4310-1-towinchenmi@gmail.com/T

Nick Chan
---
Nick Chan (3):
  dt-bindings: leds: backlight: apple,dwi-bl: Add bindings for Apple DWI
    backlight
  backlight: dwi_bl: Add Apple DWI backlight driver
  MAINTAINERS: Add entries for Apple DWI backlight controller

 .../bindings/leds/backlight/apple,dwi-bl.yaml |  54 ++++++++
 MAINTAINERS                                   |   2 +
 drivers/video/backlight/Kconfig               |  12 ++
 drivers/video/backlight/Makefile              |   1 +
 drivers/video/backlight/dwi_bl.c              | 126 ++++++++++++++++++
 5 files changed, 195 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 create mode 100644 drivers/video/backlight/dwi_bl.c


base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
-- 
2.47.1


