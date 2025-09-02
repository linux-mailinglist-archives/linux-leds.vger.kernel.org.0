Return-Path: <linux-leds+bounces-5357-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 663BEB3FCFF
	for <lists+linux-leds@lfdr.de>; Tue,  2 Sep 2025 12:50:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 021211886A11
	for <lists+linux-leds@lfdr.de>; Tue,  2 Sep 2025 10:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E78B2F49F4;
	Tue,  2 Sep 2025 10:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="DE2kIVNo";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="i/3J7Uku"
X-Original-To: linux-leds@vger.kernel.org
Received: from a7-19.smtp-out.eu-west-1.amazonses.com (a7-19.smtp-out.eu-west-1.amazonses.com [54.240.7.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A68A28031D;
	Tue,  2 Sep 2025 10:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756810246; cv=none; b=ZKmXH4I+Gm96UWO21qbd6lKydRTEYXC1kuamAYAWABDW7NPP77r/Lzuluu0ne/eRGjELW7DPCVwLBjaSH8atoa2oo8rY0238zjYarMQXvleNKRfcBvqGj3/ZgGfCGUgn37heFYEemrhQliuqEofPbOUTFqPPxtMHEw7egpRsYwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756810246; c=relaxed/simple;
	bh=1qckQvzwlWC/fKlkJTiN3ZnCnQ5EdaufHJeY89/pEVg=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:Cc; b=QuV09T9nPU8G8DD/ZipJ21x/8sIUt3wjoUa7p0CrKbV1Ff6JZZW1scfXdeTN6M4A/HRioc/Us1b24VOUhqa8LCKtt0Z46AQYgWF8AFyQgSKb5wcatHgRhaEUMgnevRuCQo+6qCob9B5JG8OpUepAqiGs8uGuh/Zxq+09Nhyacs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=eu-west-1.amazonses.com; dkim=pass (1024-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=DE2kIVNo; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=i/3J7Uku; arc=none smtp.client-ip=54.240.7.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eu-west-1.amazonses.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=vuvznkywrn6u4jb2ozie3fqz3nbg6pps; d=vinarskis.com; t=1756810242;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:Cc;
	bh=1qckQvzwlWC/fKlkJTiN3ZnCnQ5EdaufHJeY89/pEVg=;
	b=DE2kIVNosmX/EqOD4unG5iNMelEHczdAFiXTmtIsUo9UNnTHK4VQXXXiDNtACiYJ
	UbbPozl82m7Vt5N4QmF8tBjmbE5vrmmMgv9yXU8jdJ+MukhRVOa81nzdh/UyFjR2roQ
	zr3HSA9xPyU1VZsMYqb4lJqiWDjN15Ddde9KgZao=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=ihchhvubuqgjsxyuhssfvqohv7z3u4hn; d=amazonses.com; t=1756810242;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:Cc:Feedback-ID;
	bh=1qckQvzwlWC/fKlkJTiN3ZnCnQ5EdaufHJeY89/pEVg=;
	b=i/3J7Ukusy+Z75TwJwWF8hdZSuVDxSdjl2LHQP5Z2aH9cyRNBV380Snqj+mfV7xU
	qENUl5ghwPxe/wAuRTVTVMnGLWsdQEaX0FfYb2p02ZVn18Hy0KZMA/NTG3LmAWdkx+V
	s6mvzlIPrfD5h7EVLevesKydueZoUdID/7Zfwdr4=
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Subject: [PATCH 0/2] leds: privacy-led support for devicetree
Date: Tue, 2 Sep 2025 10:50:42 +0000
Message-ID: <010201990a0ce89c-70d011cb-b11e-4c66-a05b-02462389e8e3-000000@eu-west-1.amazonses.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPvLtmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSwMj3ZzUlGLdZDPDZAtz88SUFAsDJaDSgqLUtMwKsDHRsbW1AHbbYLd
 WAAAA
X-Change-ID: 20250902-leds-c61c877add80
To: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Aleksandrs Vinarskis <alex@vinarskis.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Hans de Goede <hansg@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1243; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=1qckQvzwlWC/fKlkJTiN3ZnCnQ5EdaufHJeY89/pEVg=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDBnbTv/NK7i7he2F2Jel7Hl275i4N5r9M34vfab56q8yG
 +5J2TvedpSyMIhxMciKKbJ0//ma1rVo7lqG6xrfYOawMoEMYeDiFICJvL/CyLB2J1/8/Fw9Jw3b
 vKt38qbGrVn0IfhAUOmlhWarXF59djdjZNg9y312sPRy3etG13Wr5eMje+Zcsp47dRvz8ycmEzy
 VxFgB
X-Developer-Key: i=alex@vinarskis.com; a=openpgp;
 fpr=8E21FAE2D2967BB123303E8C684FD4BA28133815
Feedback-ID: ::1.eu-west-1.dmE2JeRFSagpgiG6D+fa+YE0PH7S+b7tab7/4kfDOU8=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.7.19

Re-spin of RFC patch from ~2.5 years ago [1]. v4l2 controls for privacy
LEDs has landed, but the DT part was left out.

With recent inflow of arm64-power laptops (Snapdragon X1E/X1P) which
mostly use MIPI cameras, this feature becomes more desired. Original
rebased patch is still working as expected (with respective DT changes)
on Dell XPS 9345.

Changelog to original series:
- Pick RFC patch, pick R-by, drop RFC-related commit message part
- Add new DT binding to describe generic LED consumer properties
- Rebase and test on X1E laptop

[1] https://lore.kernel.org/all/20230120114524.408368-6-hdegoede@redhat.com/

Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
---
Aleksandrs Vinarskis (1):
      dt-bindings: leds: add generic LED consumer documentation

Hans de Goede (1):
      leds: led-class: Add devicetree support to led_get()

 .../devicetree/bindings/leds/leds-consumer.yaml    | 69 ++++++++++++++++++++++
 drivers/leds/led-class.c                           | 38 +++++++++---
 2 files changed, 98 insertions(+), 9 deletions(-)
---
base-commit: 3db46a82d467bd23d9ebc473d872a865785299d8
change-id: 20250902-leds-c61c877add80

Best regards,
-- 
Aleksandrs Vinarskis <alex@vinarskis.com>


