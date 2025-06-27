Return-Path: <linux-leds+bounces-4898-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D57AEB47E
	for <lists+linux-leds@lfdr.de>; Fri, 27 Jun 2025 12:26:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CFC727B9316
	for <lists+linux-leds@lfdr.de>; Fri, 27 Jun 2025 10:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A1D1298999;
	Fri, 27 Jun 2025 10:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="JS1CbOKI"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2852BDC11
	for <linux-leds@vger.kernel.org>; Fri, 27 Jun 2025 10:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751019645; cv=none; b=YqZHMZBJWarXQsku8BUY0KWMJk/mAyOKw6IvxnmphkTWU12CvhllD98bo5CboTFjHXyXxfFUvLJUu+DgOwsUGGazx2EwpVsSrZ7TSww7XQaW+C6nIgjOrkgzPcdd80h8W7aQUbtoXeArR2WqvdPRMgv40zlXw3SgUicX84EN4so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751019645; c=relaxed/simple;
	bh=FhmgTdJ6cP9PxOzA8WlEXQnRFBUWlOmTT5U5OBmhcEI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DAxVtwfST55Ca14WbFEfDuJOEsq4E7HUZEnKDwEC8mIhhN07uPnh9kljcC75QEXfpm6X6tr6sGYlScaaI1ZRuYsvjRsVV3NAAyfdZGZF+3T/txsa2gjl0qBxHE4itOhdvlgnkog6O2VIf7r7ikzGU+rdA2oRvUZTl2SnIUAk9FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=JS1CbOKI; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a575a988f9so1181027f8f.0
        for <linux-leds@vger.kernel.org>; Fri, 27 Jun 2025 03:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1751019642; x=1751624442; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RYSN+GZcW4gUECwe2kmpbtN2LC/+JHKPUt9qV2WDmbk=;
        b=JS1CbOKIZXoz54ubNpTF1bMqVFqhK7Rca+T3+JV1c7IOtooq7i6aadfUVugKXNE6oN
         qLA+Fybf/6WkYEVXJJOgFNumbfDJ1L47v7ZWZNBESwVYyg3bVtDKZJ2HViPc2qidiyjr
         vs8U5/AAdxHlq0yLIOju21pB/kKRtV4C56R+2oQoxuiAZKk50TpTSxwAgyR2VcLmY28N
         VoaiGWvywAa//bMHAyf+eRthE0kfNIWVqeggGc1O8K0Q79xvMph5rpDIWHsSFsccH1x5
         WEgfl+b1ggOKYtr1uKiv+CoZNA+YlBGFnmSNjnl4gRO2607gof+yfvIAkaGo83KL/5rw
         MMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751019642; x=1751624442;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RYSN+GZcW4gUECwe2kmpbtN2LC/+JHKPUt9qV2WDmbk=;
        b=QMRFHXR+ch4hZyafd3n4sueJl8vy11XvqxZF3JkUJ4uzwlhuymNR9k0coyPzTXvjxv
         k8KnqvldyejG1ku/IThYsGXazPqWBjCgP7UY+CKUrMi7OLnALtdZRYT8KEXooo5l0fiq
         wuloupgVNcbrr7DqxqHdtO8YtfLlfgLanPGZmzYUR8XOp5ucToSixdCFeNJgvNsC0S2/
         lsY/S34ChGC31kFD7xbyl3phvpg+D8I7BpHdQ86pXH8hHQVZqfn49F/eg28TmlBjSmBc
         d3ZhyHGNlpgKftjosnZzpfEB0BgBBsSQOptK7XoMR9DqsMNS5tkMZ7Pnjr7PC8qHJSbL
         4yqg==
X-Gm-Message-State: AOJu0YwaFuut4OWaacs19pGtzwMcC+u137bxmZfP903+kEIrFUJ4fhQy
	Djpu4/sl7/42shZGgfMF4CqSQadjO0lBrbITK6QtbcGCGyVqnUqA91Hvaq7d/VXQ+f0=
X-Gm-Gg: ASbGncveFVfnsV2EzjR/6hcvMtX3Gm/GhocWLemawX8ssiWmVu/KyODOfJO8KRmOAz0
	TG4W/LL5DKVn3/RtX5JXKc7b1ghd+Zgvx04KxnJvHxN5+3+7+AvXWkCCboxpbjh3e+i5Kf4C0ML
	bzPA7WxlL6BXpqjk+6oFmuO4PVdT1k22eryjfgRl8z4EyB7oQLldClWzX1d5XfEi+UmE5H4UGuB
	oBhZx+s05UpBR+4KQhFSO443QANnxCLjgRO0t0ZkC/0206cMPSleqR9e0DWMTvcvBDTMoaWkgZe
	vmawuxwEBXfm5DWVT1O8QKar1tetx7hIiLvttq1GvPvh9G4AI5Zt0cjv3Xj8zVO4l7DLUG9Lu7p
	dXLo=
X-Google-Smtp-Source: AGHT+IGu9Fi0W6hXlr9qVqehLMYehVwqcu/e+3Iz0Z+8ACmhO/y4WX9W2CjhCCBTdbuugxQIhwvHNA==
X-Received: by 2002:a5d:64e3:0:b0:3a8:6260:142c with SMTP id ffacd0b85a97d-3a90bba866cmr2884051f8f.59.1751019641952;
        Fri, 27 Jun 2025 03:20:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c7:1d1a:9c01:1a4a:198c:c191:f3d7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e7524sm2331700f8f.12.2025.06.27.03.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 03:20:41 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Subject: [PATCH v2 0/3] Add support for is31fl3236a LED controller
Date: Fri, 27 Jun 2025 11:20:34 +0100
Message-Id: <20250627-leds-is31fl3236a-v2-0-f6ef7495ce65@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHNwXmgC/x3MQQqAIBBA0avErBNqRMOuEi1ExxoQCwciiO6et
 HyL/x8QqkwCc/dApYuFj9KAfQdh92UjxbEZcEAzWDQqUxTFoseUNWrrlXYhGUzOujBBy85Kie9
 /uazv+wFvOCLAYgAAAA==
X-Change-ID: 20250625-leds-is31fl3236a-39cf52f969c7
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
 Lucca Fachinetti <luccafachinetti@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751019641; l=1993;
 i=pzalewski@thegoodpenguin.co.uk; s=20250625; h=from:subject:message-id;
 bh=FhmgTdJ6cP9PxOzA8WlEXQnRFBUWlOmTT5U5OBmhcEI=;
 b=RNULG04rJwzn/nrr8OFhMDsPd96uoJOFWtNqzjiLM1lp8Zu1Nn5cZ78aPREiZgdqn3QjJPqiy
 cLrOJKv4z+FAepHF6H8pOGqQui05IIbd+HbsKSugjE1jdZ4Dis71NHJ
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=hHrwBom/yjrVTqpEvKpVXLYfxr6nqBNP16RkQopIRrI=

This series of patches adds support for the is31fl3236a led
controller. The main difference between this IC and the
is31fl3236 is that there is a new parameter/register that
moves the operating frequency of the PWM outputs out of 
the audible range.

To support the new register a property was added in the dt-bindings,
as this property is at the board layout level ie. not all
boards will have analog audio and have to worry about it.

To add the new property the old .txt binding documentation was
ported to .yaml format. There was a previous attempt to do this
in 2024 but the original author has never acted on the feedback
given [1]. So I have implemented changes requested in that 
review and added his Signed-off-by.

The new functionality was tested by scoping the PWM signal. Out of
reset the IC is in 3kHz mode, thus action is taken only if the new
boolean value is set to true in the device tree.

[1] https://lore.kernel.org/linux-leds/20240701-overview-video-34f025ede104@spud/

Changes in v2:
- Added cover letter
- Ported dt-binding to yaml
- Refactored driver module
- Link to v1: https://lore.kernel.org/linux-leds/CAA6zWZ+TbcHrZaZ0ottm0s1mhCLa8TXASii47WKSLn2_zV95bw@mail.gmail.com/T/#t

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
Lucca Fachinetti (1):
      dt-bindings: leds: is31fl32xx: convert the binding to yaml

Pawel Zalewski (2):
      leds/leds-is31fl32xx: add support for is31fl3236a
      dt-bindings: leds: is31fl3236: add issi,22kHz-pwm property

 .../devicetree/bindings/leds/leds-is31fl3236.yaml  | 107 +++++++++++++++++++++
 .../devicetree/bindings/leds/leds-is31fl32xx.txt   |  52 ----------
 drivers/leds/leds-is31fl32xx.c                     |  35 +++++++
 3 files changed, 142 insertions(+), 52 deletions(-)
---
base-commit: 52da431bf03b5506203bca27fe14a97895c80faf
change-id: 20250625-leds-is31fl3236a-39cf52f969c7

Best regards,
-- 
Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>


